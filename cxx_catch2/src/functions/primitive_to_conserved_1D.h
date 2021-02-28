#pragma once

#include <array>

// Converts from the primitive state to the conserved state.
inline std::array<double, 3> primitive_to_conserved_1D(const std::array<double, 3>& primitive_state, double gamma) {
    return {primitive_state[0],
            primitive_state[0] * primitive_state[1],
            primitive_state[2] / (gamma - 1) + 0.5 * primitive_state[0] * primitive_state[1] * primitive_state[1]};
}
