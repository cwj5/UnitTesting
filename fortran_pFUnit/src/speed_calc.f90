! Simple program to return the speed of sound
program speed_calc

  use set_precision,   only : dp
  use fluid_constants, only : gamma, set_fluid_constants

  real(dp) :: rho, p, a

  interface
    function speed_of_sound(p,rho)
      use set_precision, only : dp
      real(dp), intent(in) :: p, rho
      real(dp)             :: speed_of_sound
    end function speed_of_sound
  end interface

  continue

  ! Set up fluid constants
  gamma = 1.4_dp
  call set_fluid_constants

  print*, "Enter the pressure:"
  read(*,*) p

  print*, "Enter the density:"
  read(*,*) rho

  print*, speed_of_sound(p,rho)

end program speed_calc

include 'speed_of_sound.f90'
