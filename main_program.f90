program main
   use pa_test_datetime

   implicit none

   call test_date_of_easter(2003, 4, 20.0, 2003)

   call test_civil_date_to_day_number(1, 1, 2000, 1)
   call test_civil_date_to_day_number(3, 1, 2000, 61)
   call test_civil_date_to_day_number(6, 1, 2003, 152)
   call test_civil_date_to_day_number(11, 27, 2009, 331)
end program main

