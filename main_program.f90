program main
   use pa_test_datetime

   implicit none

   integer,parameter :: SUCCESS_CODE = 0

   call test_date_of_easter(2003, 4, 20.0, 2003)

   call test_civil_date_to_day_number(1, 1, 2000, 1)
   call test_civil_date_to_day_number(3, 1, 2000, 61)
   call test_civil_date_to_day_number(6, 1, 2003, 152)
   call test_civil_date_to_day_number(11, 27, 2009, 331)

   call test_civil_time_to_decimal_hours(18.0, 31.0, 27.0, 18.52416667)
   call test_decimal_hours_to_civil_time(18.52416667, 18.0, 31.0, 27.0)

   call exit(SUCCESS_CODE)
end program main

