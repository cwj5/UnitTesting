module calc_pi
  implicit none
contains

  subroutine pi_calc( num_steps, pi )

    integer, intent(in)  :: num_steps
    real(8), intent(out) :: pi

    integer :: i

    real(8) :: step, x
    continue

    pi = 0.0_8

    step = 1/( real(num_steps,8) )

    do i = 1, num_steps

      x = (i+.5)*step

      pi = pi + 4.0/(1.0+x*x)

    end do

    pi = pi*step;

  end subroutine pi_calc

end module calc_pi

program main

  use calc_pi

  implicit none

  integer :: num_steps =100000
  real(8) :: pi

  continue

  call pi_calc( num_steps, pi )

  print*, pi

end program

