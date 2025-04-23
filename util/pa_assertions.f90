module pa_assertions
   implicit none
contains
   !> Assert that two integer variables have the same value. Stop execution if they do not.
   logical function compare_integers(expected_value, actual_value, description, error_code)
      integer, intent(in) :: expected_value, actual_value
      character(len=*), intent(in) :: description
      integer, intent(in) :: error_code
      logical :: is_equal

      if (expected_value .eq. actual_value) then
         is_equal = .true.
      else
         is_equal = .false.
         print *, "Assertion failed! ", description, " Expected", expected_value, "got", actual_value
         call exit(error_code)
      end if

      compare_integers = is_equal
   end function

   !> Assert that two real variables have the same value. Stop execution if they do not.
   logical function compare_real(expected_value, actual_value, description, error_code)
      real, intent(in) :: expected_value, actual_value
      character(len=*), intent(in) :: description
      integer, intent(in) :: error_code
      logical :: is_equal

      if (expected_value .eq. actual_value) then
         is_equal = .true.
      else
         is_equal = .false.
         print *, "Assertion failed! ", description, " Expected", expected_value, "got", actual_value
         call exit(error_code)
      end if

      compare_real = is_equal
   end function
end module
