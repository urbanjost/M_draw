      program drawchars
!     @(#) draw characters in a Hershey data file read from standard input
      use M_draw
      use M_drawplus, only : page
      use ISO_C_BINDING
      implicit none
      character*1000 chars    ! assume a character description fits this string
      integer :: ic
      integer :: ibase
      integer :: icount
      integer :: ix, iy
      integer :: ixlt, ixrt
      integer :: istart, iend
      integer :: ileft
      integer :: ixmin, ixmax, iymin, iymax
      integer :: itype
      integer :: ipairs
      integer :: iordinal
      integer :: i30
      integer :: inum
      real    :: box
      real    :: a
      real    :: rx, ry
      real    :: rxp, ryp

!     call prefsize(550,550)! select window size before starting X11 graphics
!     call prefposition(0,0)! select window position before starting X11
!     call vinit('X11')     ! select X11 output device

      call voutput('hershey_canvas.html')
      call vinit('canvas')    ! select output device

      call linewidth(10)      ! select line thickness in 1/10000 of x width
      ic=10                   ! rows and columns of characters per page
      box=40.0                ! area of box for putting a character into
      a=box/2.0               ! an additional border around main grid of boxes
                              ! for some oversized characters
      call page(0.0-a,box*real(ic)+a,0.0-1.0-a,box*real(ic)+a)  ! window and viewport
      call textsize(box/6.0,box/6.0)     ! size of text for printing  dataset ID
      ibase=ichar('R')        ! 'R' is the 0 coordinate (ie. the center) in data
      icount=0                ! count the number of characters
!=======================================================================--------
20    continue
      ix=mod(icount,ic)           ! figure out the column of the grid to draw in
      iy=mod(icount/ic,ic)        ! figure out the row of the grid to draw in
      if(ix+iy.eq.0)then          ! new page
         call vflush()
         if(icount.ne.0)iordinal=getkey()  ! if not first page, pause before
         call color(0)            ! select background color
         call clear()             ! clear drawing surface to background color
         call color(4)            ! select initial pen color to draw in
      endif
      chars(:)=' '
40     continue  ! get new character data
      istart=1
      iend=istart+63
      ! inum is the character ID number
      ! ipairs is the number of coordinate pairs used to draw the character
      ! chars is the string used to hold the coordinate pairs
      read(*,101,end=999)inum,ipairs,chars(istart:iend)
101   format(i5,i3,a)
      if(inum.eq.0)goto 40  ! blank line
      icount=icount+1
      ileft=ipairs-32  ! number of pairs to still read
10    continue
      if(ileft.gt.0)then ! get another line if need more data
         istart=iend+1
         iend=istart+71
         ileft=ileft-36
         read(*,'(a)')chars(istart:iend)
         goto 10
      endif
      ! write data for a character as a single line
      write(*,202)inum,ipairs,chars(1:ipairs*2)
202   format('for char ',i5,' with ',i3,' pairs:',a)
      !=================================================================--------
      ! draw a character as vectors
      itype=2 ! 1 means move to next value, 2 means draw to it
      rxp=real(ix)*box+box/2.0
      ryp=(real(ic-iy)-0.5)*box
      call color(1)            ! select initial pen color to draw in
      call move2(0.0+rxp-10,0.0+ryp)
      call draw2(0.0+rxp+10,0.0+ryp)
      call move2(0.0+rxp,0.0+ryp-10)
      call draw2(0.0+rxp,0.0+ryp+10)
      call color(4)            ! select initial pen color to draw in
      call move2(0.0+rxp,0.0+ryp)
      do 30 i30=1,ipairs*2,2
         if(chars(i30:i30).eq.' ')then
            itype=1 !move
         else
            ix=ichar(chars(i30:i30))-ibase
            iy=ichar(chars(i30+1:i30+1))-ibase
            if(i30.eq.1)then  ! first pair is X extrema
               itype=3
               ixlt=ix
               ixrt=iy
               ixmin=0  ! in case a blank character
               ixmax=0
               iymin=0  ! in case a blank character
               iymax=0
            elseif(i30.eq.2)then  ! always move to first point
               itype=1  ! move flag
               ixmin=ix
               ixmax=ix
               iymin=iy
               iymax=iy
            else
               ixmin=min(ix,ixmin)
               ixmax=max(ix,ixmax)
               iymin=min(iy,iymin)
               iymax=max(iy,iymax)
            endif
            rx=real(ix)
            ry=real(iy)
            if(itype.eq.1)then
               call move2(rx+rxp,-ry+ryp)
               itype=2
            elseif(itype.eq.2)then
               call draw2(rx+rxp,-ry+ryp)
               itype=2
            elseif(itype.eq.3)then
               itype=1
            else
               write(*,*)'bad type ',itype
            endif
         endif
         !write(*,*) itype,' ',chars(i30:i30+1),ix,iy
30    continue
      write(*,*)'lt,rt,extremes=',ixlt,ixrt,ixmin,ixmax,-iymax,-iymin
      !=================================================================--------
      ! label the character with a number
      call move2(-(box/2.0-1.0)+rxp,-(box/2.0-1.0)+ryp)
      write(chars,'(i5)')inum
      call drawstr(chars(1:5))
      !=================================================================--------
      call vflush()
      goto 20
!=======================================================================--------
999   continue
      call vflush()
      iordinal=getkey()
      write(*,*)'number of character=',icount
      call vexit()
      end
