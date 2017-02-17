!============================ fluid_constants ================================80
!
! Initialize constants dependent on ratio of specific heats ( gamma ) or
! the specific gas constant, R
! NOTE: x implies '1 over'
!
!=============================================================================80

module fluid_constants

  use set_precision, only : dp

  implicit none

  private

  public :: r     ! Gas constant
  public :: cv
  public :: cp
  public :: gamma ! Ratio of specific heats
  public :: gm1
  public :: gp1
  public :: xg
  public :: xgm1
  public :: xgp1
  public :: gxgm1
  public :: xg2m1
  public :: gxg2m1
  public :: gm1xgp1
  public :: gp1xgm1

  public :: set_fluid_constants

! Set initial values
  real(dp) :: r = 287.0_dp
  real(dp) :: cv
  real(dp) :: cp
  real(dp) :: gamma = 1.4_dp
  real(dp) :: gm1   = 0.4_dp
  real(dp) :: gp1   = 2.4_dp
  real(dp) :: xg    = 1.0_dp/1.4_dp
  real(dp) :: xgm1  = 1.0_dp/0.4_dp
  real(dp) :: xgp1  = 1.0_dp/2.4_dp
  real(dp) :: gxgm1 = 1.4_dp/0.4_dp
  real(dp) :: xg2m1 = 1.0_dp/(1.4_dp**2-1.0_dp)
  real(dp) :: gxg2m1  = 1.4_dp/(1.4_dp**2-1.0_dp)
  real(dp) :: gm1xgp1 = 0.4_dp/2.4_dp
  real(dp) :: gp1xgm1 = 2.4_dp/0.4_dp

contains

!=========================== set_fluid_constants =============================80
!
!  Gamma is set by the namelist input, all other constants are defined here
!
!=============================================================================80
  subroutine set_fluid_constants()

    use set_constants, only : one

    continue

    gm1    = gamma - one
    gp1    = gamma + one
    xg     = one / gamma
    xgm1   = one / (gamma - one)
    xgp1   = one / (gamma + one)
    xg2m1  = one / (gamma*gamma - one)
    gxgm1  = gamma / (gamma - one)
    gxg2m1 = gamma / (gamma*gamma - one)
    gm1xgp1 = gm1/gp1
    gp1xgm1 = gp1/gm1

    cv = R*xgm1
    cp = R*gxgm1

  end subroutine set_fluid_constants

end module fluid_constants
