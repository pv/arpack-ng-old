c-----------------------------------------------------------------------
c\BeginDoc
c
c\Name: arseed
c
c\Description:
c  Return or set the internal random generator state.
c
c  The internal state has the initial value 1,3,5,7.
c
c\Usage:
c  call arseed
c     ( RSTATE, SET, ISEED )
c
c\Arguments
c  RSTATE  Character*1.  (INPUT)
c          Which internal random state to access: 'S', 'C', 'D', 'Z'
c
c  SET     Logical.  (INPUT)
c          Whether to set or get the random state.
c          -------------------------------------------------------------
c          SET = .true.:  write the internal state to ISEED
c          SET = .false.: write ISEED to the internal state
c          -------------------------------------------------------------
c
c  ISEED   Integer array of length 4.  (INPUT/OUTPUT)
c          The array to which the current seed value is written to or
c          read from.
c
c\EndDoc
c-----------------------------------------------------------------------
c
      subroutine arseed
     &   ( rstate, set, iseed )
c
c     %------------------%
c     | Scalar Arguments |
c     %------------------%
c
      character rstate
      logical set
c
c     %-----------------%
c     | Array Arguments |
c     %-----------------%
c
      integer    iseed(4)
c
c     %------------------------%
c     | Local Scalars & Arrays |
c     %------------------------%
c
      integer    irng, j
      integer    iseedx(4,4)
      save       iseedx
c
c     %-----------------%
c     | Data Statements |
c     %-----------------%
c
      data       iseedx /1,3,5,7, 1,3,5,7, 1,3,5,7, 1,3,5,7/
c
c     %-----------------------%
c     | Executable Statements |
c     %-----------------------%
c
      if (rstate .eq. 'S' .or. rstate .eq. 's') then
          irng = 1
      else if (rstate .eq. 'C' .or. rstate .eq. 'c') then
          irng = 2
      else if (rstate .eq. 'D' .or. rstate .eq. 'd') then
          irng = 3
      else if (rstate .eq. 'Z' .or. rstate .eq. 'z') then
          irng = 4
      else
c         Invalid value: do nothing
          return
      end if

      if (set) then
          do 10 j = 1, 4
              iseedx(j,irng) = iseed(j)
 10       continue
      else
          do 20 j = 1, 4
              iseed(j) = iseedx(j,irng)
 20       continue
      end if
      return
c
c     %---------------%
c     | End of arseed |
c     %---------------%
c
      end
