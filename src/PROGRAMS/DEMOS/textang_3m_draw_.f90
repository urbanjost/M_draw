program demo_textang
   use :: M_draw

   !! set up drawing environment
   call prefsize(600,600)
   call vinit(' ') ! start graphics using device $M_draw_DEVICE
   call ortho2(-100.0,100.0,-100.0,100.0)
   call textsize(7.0,7.0)
   call linewidth(20)
   call color(D_BLACK)
   call clear()

   do i=1,30
      !! draw radial lines
      call color(D_RED)
      call move2(0.0,0.0)
      call draw2(100.0*cosd(i*12.0),100.0*sind(i*12.0))
      !! draw rotated text
      call color(D_WHITE)
      call move2(30.0*cosd(i*12.0),30.0*sind(i*12.0))
      call textang(i*12.0)
      call drawstr('angled text')
   enddo

   ipaws=getkey()

   call vexit()

contains
   elemental real function sind(angle_in_degrees)
      doubleprecision,parameter :: PI= 3.14159265358979323846264338327950288419716939937510d0
      doubleprecision,parameter :: degrees_to_radians = PI / 180.0D+00
      real,intent(in) :: angle_in_degrees
      sind=sin(angle_in_degrees*degrees_to_radians)
   end function sind
   elemental real function cosd(angle_in_degrees)
      doubleprecision,parameter :: PI= 3.14159265358979323846264338327950288419716939937510d0
      doubleprecision,parameter :: degrees_to_radians = PI / 180.0D+00
      real,intent(in) :: angle_in_degrees
      cosd=cos(angle_in_degrees*degrees_to_radians)
   end function cosd
end program demo_textang
