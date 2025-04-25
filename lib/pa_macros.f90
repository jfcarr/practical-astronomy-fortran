module pa_macros
   use pa_util

   implicit none
contains
   !> Convert a Civil Time (hours,minutes,seconds) to Decimal Hours
   !>
   !> Original macro name: HMSDH
   real function hms_to_dh (hours, minutes, seconds)
      real :: hours, minutes, seconds
      real :: f_hours, f_minutes, f_seconds, a, b, c
      real :: return_value

      f_hours = hours
      f_minutes = minutes
      f_seconds = seconds

      a = abs(f_seconds) / 60
      b = (abs(f_minutes) + a) / 60
      c = abs(f_hours) + b

      if (f_hours < 0 .or. f_minutes < 0 .or. f_seconds < 0) then
         return_value = -c
      else
         return_value = c
      end if

      hms_to_dh = return_value
   end function

   !> Return the hour part of a Decimal Hours
   !>
   !> Original macro name: DHHour
   integer function decimal_hours_hour(decimal_hours)
      real :: decimal_hours
      real :: a, b, c, e

      a = abs(decimal_hours)
      b = a * 3600
      c = round_to_decimal((b - 60 * floor(b / 60)), 2)

      if (c == 60) then
         e = b + 60
      else
         e = b
      end if

      if (decimal_hours < 0) then
         decimal_hours_hour = -(floor(e / 3600))
      else
         decimal_hours_hour = floor(e / 3600)
      end if
   end function

   !> Return the minutes part of a Decimal Hours
   !>
   !> Original macro name: DHMin
   integer function decimal_hours_minute(decimal_hours)
      real :: decimal_hours
      real :: a, b, c, e

      a = abs(decimal_hours)
      b = a * 3600
      c = round_to_decimal(b - 60 * floor(b / 60), 2)

      if (c == 60) then
         e = b + 60
      else
         e = b
      end if

      decimal_hours_minute =  mod(floor(e / 60), 60)
   end function

   !> Return the seconds part of a Decimal Hours
   !>
   !> Original macro name: DHSec
   real function decimal_hours_second(decimal_hours)
      real :: decimal_hours
      real :: a, b, c, d

      a = abs(decimal_hours)
      b = a * 3600
      c = round_to_decimal(b - 60 * floor(b / 60), 2)

      if (c == 60) then
         d = 0
      else
         d = c
      end if

      decimal_hours_second = d
   end function
end module
