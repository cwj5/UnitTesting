cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(UnitTesting LANGUAGES Fortran)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_BUILD_DIR}/modules")

# =============================================================================80
# Set Compiler Flags
# =============================================================================80
set(USER_DEBUG_FLAGS
    "-O0 -fopenmp -Wall -Wextra -fimplicit-none -fcheck=all \
   -ffpe-trap=zero,underflow,overflow,invalid --coverage -fbacktrace \
   -fstack-protector")
set(USER_RELEASE_FLAGS "-O3 -march=native -fopenmp")

set(CMAKE_Fortran_LINK_FLAGS_DEBUG "-O0 --coverage")
set(CMAKE_Fortran_LINK_FLAGS_RELEASE "-O3")

set(PROFILE_FLAGS "-g -p -pg")

# Append these flags to cmake flags
set(CMAKE_Fortran_FLAGS_DEBUG
    "${CMAKE_Fortran_FLAGS_DEBUG} ${USER_DEBUG_FLAGS}")
set(CMAKE_Fortran_FLAGS_RELEASE
    "${CMAKE_Fortran_FLAGS_RELEASE} ${USER_RELEASE_FLAGS}")

# Append profile flags
if(PROFILE)
  set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${PROFILE_FLAGS}")
  set(CMAKE_Fortran_FLAGS_RELEASE
      "${CMAKE_Fortran_FLAGS_RELEASE} ${PROFILE_FLAGS}")
endif()

# Add library and executables
add_library(sample)

add_executable(speed_calc)
target_link_libraries(speed_calc PUBLIC sample)

# Add sources
add_subdirectory(src)

# Testing
find_package(PFUNIT QUIET)

if(PFUNIT_FOUND)

  enable_testing()

  add_subdirectory(tests)

else()
  message(STATUS "pFUnit not found!")
endif()
