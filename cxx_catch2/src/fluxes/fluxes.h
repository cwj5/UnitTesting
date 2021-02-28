#pragma once

#include <array>
#include <functions/primitive_to_conserved_1D.h>

// Takes primitive variables and returns the flux
namespace Flux {
// exact flux
inline std::array<double, 3> flux_exact(const std::array<double, 3>& primitive_state, double gamma) {
    auto conserved_state = primitive_to_conserved_1D(primitive_state, gamma);

    return {conserved_state[1],
            conserved_state[1] * primitive_state[0],
            primitive_state[1] * (conserved_state[2] + primitive_state[2])};
}

}