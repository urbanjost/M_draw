program demo_polyhatch
   use M_draw
   use M_draw,    only  : D_BLACK,   D_WHITE
   use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
   use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
   real :: N=11
   call prefsize(600*10/6,200*10/6)
   call vinit(' ')
   call page( -15.0, 15.0, -5.0, 5.0)
   call linewidth(100)
   call color(D_BLACK)
   call clear()
   call color(D_RED)
   call spirograph(-10.0, 0.0, N, 1.0, N, 5.0, 1000, 0.0, 0.0, 0)
   call polyhatch(.true.) ! turn on polygon hatching
   call hatchang(45.0)
   call hatchpitch(0.3)
   call color(D_GREEN)
   call spirograph(10.0, 0.0, N, 1.0, N, 5.0, 1000, 0.0, 0.0, 2)
   call vflush()
   key=getkey()
   call vexit()
contains
   subroutine spirograph(xcenter,ycenter,sunr0,planet0,offset0,radius,ilines,ang,angs,ifill)
!
!     Make shapes for use as markers using hypocycloidal curves.
!     Huge variety of shapes can be generated using this routine.
!===================================================================================================================================

!@(#) M_drawplus::spirograph(3f): draw hypocycloidal curves

      real,parameter :: PI= 3.14159265358979323846264338327950288419716939937510
      real,intent(in)    :: xcenter, ycenter      ! center of curve
      real,intent(in)    :: sunr0,planet0,offset0 ! radii of sun, planet, and planet offset
      real,intent(in)    :: radius                ! radius to fit the shape to (no fit if radius is 0)
      integer,intent(in) :: ilines                ! number of points to sample along curve
      real,intent(in)    :: ang                   ! angle to rotate the shape by, to orientate it.
      real,intent(in)    :: angs                  ! angle to start sampling points at; ccw is +; 0 is East
      integer,intent(in) :: ifill                 ! 1 make a filled polygon, 2 make a hatched polygon
      real               :: ang1
      real               :: con1
      real               :: con2
      real               :: factor
      integer            :: i10
      real               :: offset
      real               :: planet
      real               :: r
      real               :: sunr
      real               :: u
      real               :: xpoin
      real               :: xpoin1
      real               :: ypoin
      real               :: ypoin1

      sunr=sunr0
      offset=offset0
      planet=planet0

      if(ilines.eq.0) return
      if(planet.eq.0.0) return
      if(sunr.eq.0.0)   return

      if(radius.ne.0.and.sunr-planet+offset.ne.0)then
         factor=radius/(sunr-planet+offset)
         sunr=factor*sunr
         planet=factor*planet
         offset=factor*offset
      endif

      u=0.0+ang
      con1=PI*2.*(sunr/planet)/real(ilines)
      con2=(1.0-planet/sunr)*u
      xpoin1=(sunr-planet)*cos(planet*u/sunr)+offset*cos(con2)
      ypoin1=(sunr-planet)*sin(planet*u/sunr)-offset*sin(con2)

      ang1=atan2(ypoin1,xpoin1)+angs
      r=sqrt(xpoin1**2+ypoin1**2)
      xpoin1=r*cos(ang1)+xcenter
      ypoin1=r*sin(ang1)+ycenter

      !call push()

      select case(ifill)
       case(0)
       case(1)
         call polyfill(.true.)
         call makepoly()
       case(2)
         call polyhatch(.true.)
         call makepoly()
       case(3:)
         call makepoly()
       case default
      end select

      call move2(xpoin1,ypoin1)
      do i10=1,ilines
         u=con1*i10+ang
         con2=(1.0-planet/sunr)*u
         if(con2.ge.2**24) con2=amod(con2,PI)
         xpoin=(sunr-planet)*cos(planet*u/sunr)+offset*cos(con2)
         ypoin=(sunr-planet)*sin(planet*u/sunr)-offset*sin(con2)

         ang1=atan2(ypoin,xpoin)+angs
         r=sqrt(xpoin**2+ypoin**2)
         xpoin=r*cos(ang1)+xcenter
         ypoin=r*sin(ang1)+ycenter

         call draw2(xpoin,ypoin)
      enddo

      if(ifill.gt.0)then
         call closepoly()
         call polyfill(.false.)
      endif

      !call pop()

   end subroutine spirograph
end program demo_polyhatch
