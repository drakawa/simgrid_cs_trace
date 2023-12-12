/* Copyright (c) 2016-2023. The SimGrid Team. All rights reserved.          */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#include "src/mc/explo/Exploration.hpp"
#include "src/mc/mc_config.hpp"
#include "src/mc/mc_environ.h"
#include "src/mc/mc_exit.hpp"
#include "src/mc/mc_private.hpp"
#include "xbt/string.hpp"

#include <sys/wait.h>

XBT_LOG_NEW_DEFAULT_SUBCATEGORY(mc_explo, mc, "Generic exploration algorithm of the model-checker");

namespace simgrid::mc {

static simgrid::config::Flag<std::string> cfg_dot_output_file{
    "model-check/dot-output", "Name of dot output file corresponding to graph state", ""};

Exploration* Exploration::instance_ = nullptr; // singleton instance

Exploration::Exploration(const std::vector<char*>& args) : remote_app_(std::make_unique<RemoteApp>(args))
{
  xbt_assert(instance_ == nullptr, "Cannot have more than one exploration instance");
  instance_ = this;

  if (not cfg_dot_output_file.get().empty()) {
    dot_output_ = fopen(cfg_dot_output_file.get().c_str(), "w");
    xbt_assert(dot_output_ != nullptr, "Error open dot output file: %s", strerror(errno));

    fprintf(dot_output_, "digraph graphname{\n fixedsize=true; rankdir=TB; ranksep=.25; edge [fontsize=12]; node "
                         "[fontsize=10, shape=circle,width=.5 ]; graph [resolution=20, fontsize=10];\n");
  }
}

Exploration::~Exploration()
{
  if (dot_output_ != nullptr)
    fclose(dot_output_);
  instance_ = nullptr;
}

void Exploration::dot_output(const char* fmt, ...)
{
  if (dot_output_ != nullptr) {
    va_list ap;
    va_start(ap, fmt);
    vfprintf(dot_output_, fmt, ap);
    va_end(ap);
    fflush(dot_output_);
  }
}

void Exploration::log_state()
{
  if (not cfg_dot_output_file.get().empty()) {
    dot_output("}\n");
    fclose(dot_output_);
  }
  if (getenv(MC_ENV_SYSTEM_STATISTICS)) {
    int ret = system("free");
    if (ret != 0)
      XBT_WARN("Call to system(free) did not return 0, but %d", ret);
  }
}
// Make our tests fully reproducible despite the subtle differences of strsignal() across archs
static const char* signal_name(int status)
{
  switch (WTERMSIG(status)) {
    case SIGABRT: // FreeBSD uses "Abort trap" as a strsignal for SIGABRT
      return "Aborted";
    case SIGSEGV: // MacOSX uses "Segmentation fault: 11" for SIGKILL
      return "Segmentation fault";
    default:
      return strsignal(WTERMSIG(status));
  }
}

std::vector<std::string> Exploration::get_textual_trace(int max_elements)
{
  std::vector<std::string> trace;
  for (auto const& transition : get_record_trace()) {
    auto const& call_location = transition->get_call_location();
    if (not call_location.empty())
      trace.push_back(xbt::string_printf("Actor %ld in %s ==> simcall: %s", transition->aid_, call_location.c_str(),
                                         transition->to_string().c_str()));
    else
      trace.push_back(xbt::string_printf("Actor %ld in simcall %s", transition->aid_, transition->to_string().c_str()));
    max_elements--;
    if (max_elements == 0)
      break;
  }
  return trace;
}

XBT_ATTRIB_NORETURN void Exploration::report_crash(int status)
{
  XBT_INFO("**************************");
  XBT_INFO("** CRASH IN THE PROGRAM **");
  XBT_INFO("**************************");
  if (WIFSIGNALED(status))
    XBT_INFO("From signal: %s", signal_name(status));
  else if (WIFEXITED(status))
    XBT_INFO("From exit: %i", WEXITSTATUS(status));
  if (not xbt_log_no_loc)
    XBT_INFO("%s core dump was generated by the system.", WCOREDUMP(status) ? "A" : "No");

  XBT_INFO("Counter-example execution trace:");
  for (auto const& s : get_textual_trace())
    XBT_INFO("  %s", s.c_str());
  XBT_INFO("You can debug the problem (and see the whole details) by rerunning out of simgrid-mc with "
           "--cfg=model-check/replay:'%s'",
           get_record_trace().to_string().c_str());
  log_state();

  throw McError(ExitStatus::PROGRAM_CRASH);
}
XBT_ATTRIB_NORETURN void Exploration::report_assertion_failure()
{
  XBT_INFO("**************************");
  XBT_INFO("*** PROPERTY NOT VALID ***");
  XBT_INFO("**************************");
  XBT_INFO("Counter-example execution trace:");
  for (auto const& s : get_textual_trace())
    XBT_INFO("  %s", s.c_str());
  XBT_INFO("You can debug the problem (and see the whole details) by rerunning out of simgrid-mc with "
           "--cfg=model-check/replay:'%s'",
           get_record_trace().to_string().c_str());
  log_state();
  throw McError(ExitStatus::SAFETY);
}

}; // namespace simgrid::mc
