module pa_util
   implicit none
contains
   !> Indicates (true/false) if the given year is a leap year.
   logical function is_leap_year (input_year)
      integer :: input_year
      real :: year
      logical :: return_value

      year = input_year

      if (mod(year, 4.0) == 0) then
         if (mod(year, 100.0) == 0) then
            return_value = .true.
         else
            return_value = .false.
         end if
      else
         return_value = .false.
      end if

      is_leap_year = return_value
   end function

   !> Function to round a number to a specified number of decimal places
   real function round_to_decimal(value, places)
      real, intent(in) :: value
      integer, intent(in) :: places
      real :: factor

      ! Calculate the factor based on the number of decimal places
      factor = 10.0 ** real(places)

      ! Round the value
      round_to_decimal = nint(value * factor) / factor
   end function
end module
