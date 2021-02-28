#include <iostream>
#include "functions/speed_of_sound.h"

// Simple program to return the speed of sound
int main(int argc, char* argv[]) {
    // Set up fluid constants
    double gamma = 1.4;

    double rho, p;

    std::cout << "Enter the pressure: ";
    std::cin >> p;

    std::cout << "Enter the density: ";
    std::cin >> rho;

    std::cout << "Speed of sound: " << speed_of_sound(p, rho, gamma) << std::endl;
}
