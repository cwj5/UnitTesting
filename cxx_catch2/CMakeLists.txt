cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project(UnitTesting LANGUAGES CXX)

# Dissallow in-source build
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_CURRENT_BINARY_DIR)
  message(
    FATAL_ERROR
      "UnitTesting requires an out-of-source build. Please create a separate build directory and run CMake there."
  )
endif()

# Add library and executables
add_library(sample OBJECT)
set_target_properties(sample PROPERTIES LINKER_LANGUAGE CXX)

add_executable(speed_calc)
target_link_libraries(speed_calc PUBLIC sample)

add_executable(UnitTests)
target_link_libraries(UnitTests PUBLIC sample)

# Add sources
add_subdirectory(src)
add_subdirectory(tests)
