module pa_test_datetime
   use pa_datetime
   use pa_assertions

   implicit none

   integer,parameter :: ERROR_CODE_DATETIME = 1
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

      assertion_passed = compare_integers(expected_month, actual_month, "[Date of Easter - Month]", ERROR_CODE_DATETIME)
      assertion_passed = compare_real(expected_day, actual_day, "[Date of Easter - Day]", ERROR_CODE_DATETIME)
      assertion_passed = compare_integers(expected_year, actual_year, "[Date of Easter - Year]", ERROR_CODE_DATETIME)

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

      assertion_passed = compare_integers(expected_day_number, actual_day_number, "[Civil Date to Day Number]", ERROR_CODE_DATETIME)

      if (assertion_passed .eqv. .true.) then
         print *, "[Civil Date to Day Number] PASSED"
      end if
   end subroutine

   subroutine test_civil_time_to_decimal_hours(input_hours, input_minutes, input_seconds, expected_decimal_hours)
      real :: input_hours, input_minutes, input_seconds, expected_decimal_hours
      real :: actual_decimal_hours
      logical :: assertion_passed

      actual_decimal_hours = civil_time_to_decimal_hours(input_hours, input_minutes, input_seconds)

      assertion_passed = compare_real(expected_decimal_hours, actual_decimal_hours, &
         "[Civil Time to Decimal Hours]", ERROR_CODE_DATETIME)

      if (assertion_passed .eqv. .true.) then
         print *, "[Civil Time to Decimal Hours] PASSED"
      end if
   end subroutine

   subroutine test_decimal_hours_to_civil_time(input_decimal_hours, expected_hours, expected_minutes, expected_seconds)
      real :: input_decimal_hours, expected_hours, expected_minutes, expected_seconds
      real :: actual_hours, actual_minutes, actual_seconds
      logical :: assertion_passed

      call decimal_hours_to_civil_time(input_decimal_hours, actual_hours, actual_minutes, actual_seconds)

      assertion_passed = compare_real(expected_hours, actual_hours, "[Decimal Hours to Civil Time]", ERROR_CODE_DATETIME)
      assertion_passed = compare_real(expected_minutes, actual_minutes, "[Decimal Hours to Civil Time]", ERROR_CODE_DATETIME)
      assertion_passed = compare_real(expected_seconds, actual_seconds, "[Decimal Hours to Civil Time]", ERROR_CODE_DATETIME)

      if (assertion_passed .eqv. .true.) then
         print *, "[Decimal Hours to Civil Time] PASSED"
      end if
   end subroutine
end module
