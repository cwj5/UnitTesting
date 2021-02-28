#include <external/catch.hpp>
#include <functions/speed_of_sound.h>

const double toler = 1.0e-14;

TEST_CASE("Speed of sound works") {
    double gamma = 1.4;
    double rho = 1.225;
    double p = 101325.0;

    double a_expected = 340.29399054347107;

    auto a = speed_of_sound(p, rho, gamma);

    REQUIRE(a == Approx(a_expected).epsilon(toler));
}