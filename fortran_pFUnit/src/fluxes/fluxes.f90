module fluxes

  implicit none

  private

  public :: flux_exact

contains

  !================================ flux_exact =================================80
  !
  ! Takes primitive variables and returns the flux
  !
  !=============================================================================80
  pure function flux_exact(q)

    use set_precision,   only : dp

    real(dp), dimension(3), intent(in) :: q
    real(dp), dimension(3)             :: flux_exact, cons

    cons = primitive_to_conserved_1D(q)

    flux_exact(1) = cons(2)
    flux_exact(2) = cons(2)*q(1)
    flux_exact(3) = q(2)*(cons(3) + q(3))

  end function flux_exact

  include 'primitive_to_conserved_1D.f90'

end module fluxes
