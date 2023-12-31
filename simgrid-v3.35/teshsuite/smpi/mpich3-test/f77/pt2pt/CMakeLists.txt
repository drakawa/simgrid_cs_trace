if(enable_smpi AND enable_testsuite_smpi_MPICH3 AND SMPI_FORTRAN)
  set(CMAKE_C_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpicc")
  set(CMAKE_Fortran_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpiff")

  set(CMAKE_INCLUDE_CURRENT_DIR ON)
  include_directories(BEFORE "${CMAKE_HOME_DIRECTORY}/include/smpi")

  add_executable(allpairf  EXCLUDE_FROM_ALL allpairf.f)
  if((CMAKE_Fortran_COMPILER_ID MATCHES "GNU") AND (NOT CMAKE_Fortran_COMPILER_VERSION VERSION_LESS "10.0"))
    set_property(SOURCE allpairf.f PROPERTY COMPILE_FLAGS -std=legacy)
  endif()
  add_executable(greqf    EXCLUDE_FROM_ALL greqf.f dummyf.f)
#  add_executable(mprobef  EXCLUDE_FROM_ALL mprobef.f)
  add_executable(statusesf EXCLUDE_FROM_ALL statusesf.f)
  add_dependencies(tests allpairf statusesf) # greqf mprobef

  target_link_libraries(allpairf simgrid mtest_f77)
  target_link_libraries(greqf simgrid mtest_f77)
  #target_link_libraries(mprobef simgrid mtest_f77)
  target_link_libraries(statusesf simgrid mtest_f77)
endif()

set(examples_src
  ${examples_src}
  ${CMAKE_CURRENT_SOURCE_DIR}/allpairf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/attr1aints.h
  ${CMAKE_CURRENT_SOURCE_DIR}/dummyf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/greqf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/mprobef.f
  ${CMAKE_CURRENT_SOURCE_DIR}/statusesf.f
  PARENT_SCOPE)
set(txt_files
  ${txt_files}
  ${CMAKE_CURRENT_SOURCE_DIR}/testlist
  PARENT_SCOPE)
