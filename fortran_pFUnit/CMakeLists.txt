project(SENSEI Fortran)
cmake_minimum_required(VERSION 3.6)

#=============================================================================80
# CMake macros
#=============================================================================80
include( ${CMAKE_SOURCE_DIR}/cmake/macros/add_exe_sources.txt  )
include( ${CMAKE_SOURCE_DIR}/cmake/macros/add_lib_sources.txt  )
include( ${CMAKE_SOURCE_DIR}/cmake/macros/add_test_target.txt  )
include( ${CMAKE_SOURCE_DIR}/cmake/macros/add_test_sources.txt )

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")

#=============================================================================80
# Set output directories
#=============================================================================80
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
set( CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/lib )

#=============================================================================80
# Set Compiler Flags
#=============================================================================80
set(
  USER_DEBUG_FLAGS
  "-O0 -fopenmp -Wall -Wextra -fimplicit-none -fcheck=all \
   -ffpe-trap=zero,underflow,overflow,invalid --coverage -fbacktrace \
   -fstack-protector"
)
set( USER_RELEASE_FLAGS "-O3 -march=native -fopenmp" )

set( CMAKE_Fortran_LINK_FLAGS_DEBUG "-O0 --coverage" )
set( CMAKE_Fortran_LINK_FLAGS_RELEASE "-O3" )

set( PROFILE_FLAGS "-g -p -pg" )


# Append these flags to cmake flags
set(
  CMAKE_Fortran_FLAGS_DEBUG
  "${CMAKE_Fortran_FLAGS_DEBUG} ${USER_DEBUG_FLAGS}"
)
set(
  CMAKE_Fortran_FLAGS_RELEASE
  "${CMAKE_Fortran_FLAGS_RELEASE} ${USER_RELEASE_FLAGS}"
)

# Append profile flags
if (PROFILE)
  set(
    CMAKE_Fortran_FLAGS_DEBUG
    "${CMAKE_Fortran_FLAGS_DEBUG} ${PROFILE_FLAGS}"
  )
  set(
    CMAKE_Fortran_FLAGS_RELEASE
    "${CMAKE_Fortran_FLAGS_RELEASE} ${PROFILE_FLAGS}"
  )
endif()


#=============================================================================80
# Add source tree and included folders
#=============================================================================80
add_subdirectory(src)

include_directories( ${CMAKE_SOURCE_DIR}/src/functions )

#=============================================================================80
# Add library and executables
#=============================================================================80
add_library( sample ${LIB_SRCS} )
target_link_libraries( sample )
set_target_properties( sample PROPERTIES
                                 COMPILE_FLAGS "${CMAKE_Fortran_FLAGS}"
                                 LINK_FLAGS    "${CMAKE_FORTRAN_LINK_FLAGS}" )

add_executable( speed_calc ${speed_calc_sources} )
target_link_libraries( speed_calc sample )
set_target_properties( speed_calc PROPERTIES
                              COMPILE_FLAGS "${CMAKE_Fortran_FLAGS}"
                              LINK_FLAGS    "${CMAKE_FORTRAN_LINK_FLAGS}" )

#=============================================================================80
# Testing: enable with -DPFUNIT=/path/to/pfunit
#=============================================================================80
set(PFUNIT "FALSE" CACHE PATH "path to pFUnit")

if ( EXISTS ${PFUNIT}/lib/libpfunit.a )

  # Enable make test
  include(CTest)

  #pFUnit was found so compile unit tests
  set( TESTING TRUE )
  MESSAGE( STATUS "pFUnit found!" )

  #set location of lib
  set( PFUNIT_LIB ${PFUNIT}/lib )

  # Add unit tests
  add_subdirectory( tests )

else()
  set( TESTING FALSE )
endif()

