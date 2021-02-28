// Calculates and returns the speed of sound given the pressure and density.
inline double speed_of_sound(double p, double rho, double gamma) { return gamma * p / rho; }
