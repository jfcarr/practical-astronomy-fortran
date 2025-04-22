module pa_datetime
   use pa_returns
   use pa_util

   implicit none
contains
   !> Calculate the date of Easter for a given year.
   !> Input value: input_year
   !> Returns: pointer to CivilDate
   function get_date_of_easter_obj(input_year) result(custom_obj)
      type(CivilDate), pointer :: custom_obj
      integer :: input_year
      real :: year, a, b, c, d, e, f, g, h, i, k, l, m, n, p, day, month

      allocate(custom_obj)

      year = input_year
      a = mod(year, 19.0)
      b = floor(year / 100)
      c = mod(year, 100.0)
      d = floor(b / 4)
      e = mod(b , 4.0)
      f = floor((b + 8) / 25)
      g = floor((b - f + 1) / 3)
      h = mod( ((19 * a) + b - d - g + 15) , 30.0)
      i = floor(c / 4)
      k = mod(c , 4.0)
      l = mod( (32 + 2 * (e + i) - h - k) , 7.0)
      m = floor((a + (11 * h) + (22 * l)) / 451)
      n = floor((h + l - (7 * m) + 114) / 31)
      p = mod((h + l - (7 * m) + 114) , 31.0)

      day = p + 1
      month = n

      custom_obj%month = floor(month)
      custom_obj%day = day
      custom_obj%year = input_year
   end function

   !> Calculate the date of Easter for a given year.
   !> Input value: input_year
   !> Output values: month, day, year
   subroutine get_date_of_easter(input_year, month, day, year)
      implicit none

      integer, intent(in) :: input_year
      integer, intent(out) :: month
      real, intent(out) :: day
      integer, intent(out) :: year

      real :: year1, a, b, c, d, e, f, g, h, i, k, l, m, n, p

      year1 = input_year
      a = mod(year1, 19.0)
      b = floor(year1 / 100)
      c = mod(year1, 100.0)
      d = floor(b / 4)
      e = mod(b , 4.0)
      f = floor((b + 8) / 25)
      g = floor((b - f + 1) / 3)
      h = mod(((19 * a) + b - d - g + 15) , 30.0)
      i = floor(c / 4)
      k = mod(c, 4.0)
      l = mod((32 + 2 * (e + i) - h - k) , 7.0)
      m = floor((a + (11 * h) + (22 * l)) / 451)
      n = floor((h + l - (7 * m) + 114) / 31)
      p = mod((h + l - (7 * m) + 114) , 31.0)

      day = p + 1
      month = floor(n)
      year = input_year
   end subroutine

   !> Calculate day number for a civil date (month, day, and year)
   integer function civil_date_to_day_number (month, day, year)
      integer :: month, day, year
      integer :: working_month

      working_month = month

      if (working_month <= 2) then
         working_month = working_month - 1

         if (is_leap_year(year) .eqv. .true.) then
            working_month = working_month * 62
         else
            working_month = working_month * 63
         end if

         working_month = floor(real(working_month) / 2)
      else
         working_month = floor((working_month + 1) * 30.6)

         if (is_leap_year(year) .eqv. .true.) then
            working_month = working_month - 62
         else
            working_month = working_month - 63
         end if
      end if

      civil_date_to_day_number = working_month + day
   end function
end module pa_datetime
