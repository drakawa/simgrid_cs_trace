if(enable_smpi)
  set(CMAKE_C_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpicc")

  include_directories(BEFORE "${CMAKE_HOME_DIRECTORY}/include/smpi")
  add_executable       (is EXCLUDE_FROM_ALL is.c nas_common.c)
  target_link_libraries(is simgrid)
  add_executable       (ep EXCLUDE_FROM_ALL ep.c nas_common.c)
  target_link_libraries(ep simgrid)
  add_executable       (dt EXCLUDE_FROM_ALL dt.c nas_common.c DGraph.c)
  target_link_libraries(dt simgrid)
  add_dependencies(tests is ep dt)
endif()

set(examples_src  ${examples_src}  ${CMAKE_CURRENT_SOURCE_DIR}/nas_common.h
                                   ${CMAKE_CURRENT_SOURCE_DIR}/nas_common.c
                                   ${CMAKE_CURRENT_SOURCE_DIR}/is.c
                                   ${CMAKE_CURRENT_SOURCE_DIR}/dt.c
                                   ${CMAKE_CURRENT_SOURCE_DIR}/ep.c
                                   ${CMAKE_CURRENT_SOURCE_DIR}/DGraph.c
                                   ${CMAKE_CURRENT_SOURCE_DIR}/DGraph.h
                                                                              PARENT_SCOPE)
set(txt_files     ${txt_files}    ${CMAKE_CURRENT_SOURCE_DIR}/README.install  PARENT_SCOPE)
