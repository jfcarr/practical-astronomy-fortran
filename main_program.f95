program main
   use pa_datetime
   use pa_returns

   implicit none

   ! call test_date_of_easter_1(2025)
   call test_date_of_easter(2003, 4, 20.0, 2003)
end program main

subroutine test_date_of_easter(input_year, expected_month, expected_day, expected_year)
   use pa_datetime
   use pa_assertions

   ! input
   integer :: input_year
   integer :: expected_month
   real :: expected_day
   integer :: expected_year
   logical :: assertion_passed

   ! outputs
   integer :: actual_month
   real :: actual_day
   integer :: actual_year

   call get_date_of_easter(input_year, actual_month, actual_day, actual_year)

   assertion_passed = compare_integers(expected_month, actual_month, "[Date of Easter - Month]")
   assertion_passed = compare_real(expected_day, actual_day, "[Date of Easter - Day]")
   assertion_passed = compare_integers(expected_year, actual_year, "[Date of Easter - Year]")

   if (assertion_passed .eqv. .true.) then
      print *, "[Date of Easter] PASSED"
   end if
end subroutine
