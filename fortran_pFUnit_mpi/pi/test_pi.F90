!@test
subroutine pi_test

  use calc_pi, only : pi_calc
  use pfunit_mod

  integer :: n_steps
  real(8) :: pi, pi_expected

  real(dp) :: toler = 1D-14

  continue

  pi_expected = acos(-1.0_8)

  pi_calc( n_steps, pi )

#line 18 "test_pi.pf"
  call assertEqual(pi_expected, pi, toler, &
 & location=SourceLocation( &
 & 'test_pi.pf', &
 & 18) )
  if (anyExceptions()) return
#line 19 "test_pi.pf"

end subroutine pi_test

module Wraptest_pi
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_pi

function test_pi_suite() result(suite)
   use pFUnit_mod
   use Wraptest_pi
   type (TestSuite) :: suite

   external pi_test


   suite = newTestSuite('test_pi_suite')

   call suite%addTest(newTestMethod('pi_test', pi_test))


end function test_pi_suite

