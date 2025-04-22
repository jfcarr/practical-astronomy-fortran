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
end module
