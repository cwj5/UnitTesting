!=============================== speed_of_sound ==============================80
!>
!! Calculates and returns the speed of sound given the pressure and density.
!<
!=============================================================================80
pure function speed_of_sound( p, rho )

  use set_precision,   only : dp
  use fluid_constants, only : gamma

  implicit none

  real(dp), intent(in) :: p, rho
  real(dp)             :: speed_of_sound

  continue

  speed_of_sound = gamma*p/rho

end function speed_of_sound
