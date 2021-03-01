add_pfunit_ctest(test_speed_of_sound TEST_SOURCES test_speed_of_sound.pf
                 LINK_LIBRARIES sample)

add_pfunit_ctest(test_exact_flux TEST_SOURCES test_exact_flux.pf LINK_LIBRARIES
                 sample)
