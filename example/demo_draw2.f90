program demo_draw2
   use M_draw,    only : prefsize, vinit, ortho2, clear, getkey
   use M_draw,    only : move2, draw2, vexit, color,linewidth
   use M_draw,    only  : D_BLACK,   D_WHITE
   use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
   use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
   !
   ! The Archimedean spiral is the locus of points corresponding
   ! to the locations over time of a point moving away from a
   ! fixed point with a constant speed along a line which rotates
   ! with constant angular velocity.
   !    r=A+B*theta
   ! Changing the parameter A will turn the spiral,
   ! while B controls the distance between successive turnings.
   !
   implicit none
   integer        :: i
   real           :: x,y,radius,theta
   real,parameter :: rotate=0.0, gap=2.0
   integer        :: ipaws

   call prefsize(400,400)
   call vinit(' ') ! start graphics using device $M_draw_DEVICE
   call ortho2(-150.0,150.0,-150.0,150.0)
   call color(D_MAGENTA)
   call clear()
   call move2(0.0,0.0)
   call color(D_BLACK)
   call linewidth(40)
   do i=0,360*10,5
      theta=d2r(real(i))
      ! equation in polar coordinates
      radius=rotate+gap*theta
      ! convert polar coordinates to cartesian
      call polar_to_cartesian(radius,theta,x,y)
      ! draw from current position to end of next segment
      call draw2(x,y)
   enddo
   ipaws=getkey()
   ! exit graphics mode
   call vexit()
contains
   elemental real function d2r(degrees)

      character(len=*),parameter::ident_6="@(#)M_units::d2r(3f): Convert degrees to radians"

      doubleprecision,parameter :: RADIAN=57.2957795131d0 ! degrees
      real,intent(in)           :: degrees                ! input degrees to convert to radians
      d2r=dble(degrees)/RADIAN                       ! do the unit conversion
   end function d2r
   subroutine polar_to_cartesian(radius,inclination,x,y)
      implicit none
      character(len=*),parameter::ident_21="@(#)M_units::polar_to_cartesian(3f): convert polar coordinates to cartesian coordinates"
      real,intent(in) :: radius,inclination
      real,intent(out)  :: x,y
      if(radius.eq.0)then
         x=0.0
         y=0.0
      else
         x=radius*cos(inclination)
         y=radius*sin(inclination)
      endif
   end subroutine polar_to_cartesian
end program demo_draw2
