if(enable_smpi AND enable_testsuite_smpi_MPICH3 AND SMPI_FORTRAN)
  set(CMAKE_C_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpicc")
  set(CMAKE_Fortran_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpif90")

  include_directories(BEFORE "${CMAKE_HOME_DIRECTORY}/include/smpi")

  foreach(test infotest2f90 infotestf90)
    add_executable(${test} EXCLUDE_FROM_ALL ${test}.f90)
    add_dependencies(tests ${test})
    target_link_libraries(${test} simgrid mtest_f90)
  endforeach()
endif()

set(examples_src
  ${examples_src}
 ${CMAKE_CURRENT_SOURCE_DIR}/infotest2f90.f90
 ${CMAKE_CURRENT_SOURCE_DIR}/infotestf90.f90
  PARENT_SCOPE)
set(txt_files
  ${txt_files}
  ${CMAKE_CURRENT_SOURCE_DIR}/testlist
  PARENT_SCOPE)
