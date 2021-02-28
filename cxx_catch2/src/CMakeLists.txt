add_subdirectory(fluxes)
add_subdirectory(functions)

target_include_directories(sample PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_sources(speed_calc PRIVATE speed_calc.cpp)
