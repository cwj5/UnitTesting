add_subdirectory(constants)

# Propagate lib_srcs list to parent
add_lib_sources( set_precision.f90 )

# Add sources for executables
add_exe_sources( speed_calc speed_calc.f90 )
