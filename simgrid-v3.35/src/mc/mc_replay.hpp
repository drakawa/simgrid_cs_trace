/* Copyright (c) 2008-2023. The SimGrid Team. All rights reserved.          */

/* This program is free software; you can redistribute it and/or modify it
 * under the terms of the license (GNU LGPL) which comes with this package. */

#ifndef SIMGRID_MC_REPLAY_H
#define SIMGRID_MC_REPLAY_H

#include <string>

/** Replay path (if any) in string representation
 *
 *  This is using the format generated by traceToString().
 *  Use a function to avoid static initialization order fiasco.
 */
inline auto& MC_record_path()
{
  static std::string value;
  return value;
}

/** Whether the replay mode is enabled */
static inline int MC_record_replay_is_active()
{
  return not MC_record_path().empty();
}

/** Whether we should display extra information during this MC replay */
extern bool simgrid_mc_replay_show_backtraces;

#endif
