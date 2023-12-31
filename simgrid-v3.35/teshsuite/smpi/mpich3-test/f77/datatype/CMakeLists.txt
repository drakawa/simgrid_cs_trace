if(enable_smpi AND enable_testsuite_smpi_MPICH3 AND SMPI_FORTRAN)
  set(CMAKE_C_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpicc")
  set(CMAKE_Fortran_COMPILER "${CMAKE_BINARY_DIR}/smpi_script/bin/smpiff")

  include_directories(BEFORE "${CMAKE_HOME_DIRECTORY}/include/smpi")
  include_directories(${CMAKE_CURRENT_BINARY_DIR})

  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/typeaints.h.in typeaints.h @ONLY)

  foreach(test gaddressf
             allctypesf hindex1f hindexed_blockf packef typecntsf
             typem2f typename3f typenamef typesnamef
             typesubf)
    add_executable(${test} EXCLUDE_FROM_ALL ${test}.f)
    add_dependencies(tests ${test})
    target_link_libraries(${test} simgrid mtest_f77)
    if((CMAKE_Fortran_COMPILER_ID MATCHES "GNU") AND (NOT CMAKE_Fortran_COMPILER_VERSION VERSION_LESS "10.0"))
      set_property(SOURCE ${test}.f PROPERTY COMPILE_FLAGS -std=legacy)
    endif()
  endforeach()
endif()

set(examples_src
  ${examples_src}
  ${CMAKE_CURRENT_SOURCE_DIR}/allctypesf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/gaddressf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/hindex1f.f
  ${CMAKE_CURRENT_SOURCE_DIR}/hindexed_blockf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/packef.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typeaints.h.in
  ${CMAKE_CURRENT_SOURCE_DIR}/typecntsf.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typem2f.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typename3f.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typenamef.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typesnamef.f
  ${CMAKE_CURRENT_SOURCE_DIR}/typesubf.f
  PARENT_SCOPE)
set(txt_files
  ${txt_files}
  ${CMAKE_CURRENT_SOURCE_DIR}/testlist
  PARENT_SCOPE)
