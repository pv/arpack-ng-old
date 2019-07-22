! icbasd : iso_c_binding for arpack

subroutine arseed_c(rstate, set, iseed) &
                    bind(c, name="arseed_c")
  use :: iso_c_binding
  implicit none
#include "arpackdef.h"
  character(kind=c_char),       dimension(1),       intent(in)    :: rstate
  logical(kind=c_bool),         value,              intent(in)    :: set
  integer(kind=c_int),          dimension(4),       intent(inout) :: iseed

  interface
     subroutine arseed(rstate, set, iseed)
       character, intent(in) :: rstate
       logical, intent(in) :: set
       integer, intent(inout) :: iseed(4)
     end subroutine arseed
  end interface

  logical :: setf

  setf = set
  call arseed(rstate(1), setf, iseed)
end subroutine arseed_c
