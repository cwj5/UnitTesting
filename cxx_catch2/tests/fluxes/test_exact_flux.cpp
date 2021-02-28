#include <array>
#include <external/catch.hpp>
#include <fluxes/fluxes.h>

TEST_CASE("Exact flux works for no flow condition.") {
    double toler = 1E-14;

    double gamma = 1.4;

    std::array<double, 3> q({1.225, 0.0, 101325.0});
    std::array<double, 3> flux_expected({0.0, 101325.0, 0.0});

    auto flux = Flux::flux_exact(q, gamma);

    REQUIRE(flux[0] == Approx(flux_expected[0]).epsilon(toler));
    REQUIRE(flux[1] == Approx(flux_expected[1]).epsilon(toler));
    REQUIRE(flux[2] == Approx(flux_expected[2]).epsilon(toler));
}

TEST_CASE("Exact flux works for supersonic condition.") {
    double toler = 1E-14;

    // set up fluid constants
    double gamma = 1.4;

    std::array<double, 3> q({1.225, 400.0, 101325.0});

    std::array<double, 3> flux_expected({490.0, 297325.0, 181055000.0});

    auto flux = Flux::flux_exact(q, gamma);
    REQUIRE(flux[0] == Approx(flux_expected[0]).epsilon(toler));
    REQUIRE(flux[1] == Approx(flux_expected[1]).epsilon(toler));
    REQUIRE(flux[2] == Approx(flux_expected[2]).epsilon(toler));
}