add_subdirectory(constants)
add_subdirectory(fluxes)

target_sources(sample PUBLIC set_precision.f90)

target_sources(speed_calc PRIVATE speed_calc.f90)

target_include_directories(sample PUBLIC functions)
