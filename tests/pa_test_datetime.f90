module pa_test_datetime
   use pa_datetime
   use pa_assertions

   implicit none
contains
   subroutine test_date_of_easter(input_year, expected_month, expected_day, expected_year)
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

   subroutine test_civil_date_to_day_number(input_month, input_day, input_year, expected_day_number)
      ! input
      integer :: input_month, input_day, input_year, expected_day_number
      integer :: working_month, working_day, working_year
      logical :: assertion_passed

      ! output
      integer :: actual_day_number

      working_month = input_month
      working_day = input_day
      working_year = input_year

      actual_day_number = civil_date_to_day_number(working_month, working_day, working_year)

      assertion_passed = compare_integers(expected_day_number, actual_day_number, "[Civil Date to Day Number]")

      if (assertion_passed .eqv. .true.) then
         print *, "[Civil Date to Day Number] PASSED"
      end if
   end subroutine
end module
