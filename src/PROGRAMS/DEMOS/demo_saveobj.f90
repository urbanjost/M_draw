program demo_saveobj
   ! create object in file "circle.obj" for use with loadobj(3f)
   use M_draw
   implicit none
   character(len=:),allocatable :: env
   integer :: ipaws
   integer :: env_len
   call voutput('+')            ! ignore $M_DRAW_OUTPUT
   call vinit('nil')            ! start graphics
   call pushall()
   !
   call makeobj(3)              ! create an object
   call polyfill(.true.)
   call color(D_GREEN)
   call circle(0.0,0.0,10.0)
   call polyfill(.false.)
   call color(D_BLUE)
   call linewidth(100)
   call circle(0.0,0.0,4.0)
   call closeobj()
   !
   call saveobj(3,"circle.obj") ! save object to file
   call popall()
   call vexit()                 ! exit graphics
   !
   !-------  now this could be a separate program to use object
   !
   !------------------------------------------------------------
   ! CURRENTLY:
   ! with multiple vinit(3f) calls the environment variable is
   ! not used without explicitly using it
   call get_environment_variable('M_DRAW_OUTPUT',LENGTH=env_len)
   if(env_len.ne.0)then
      allocate(character(len=env_len) :: env)
      call get_environment_variable('M_DRAW_OUTPUT',env)
      call voutput(env)
   endif
   !------------------------------------------------------------
   call vinit(' ')  ! set up device
   call page(-100.0,100.0,-100.0,100.0)
   call loadobj(100,"circle.obj")
   ! translate x,y,z scale x,y,z rotate x,y,z object
   call invoke(   0.0,  0.0, 0.0,1.0,1.0,1.0,0.0,0.0,0.0, 100)
   call invoke( -20.0,-20.0, 0.0,1.0,2.0,1.0,0.0,0.0,0.0, 100)
   call invoke(  30.0, 40.0, 0.0,2.0,2.0,1.0,0.0,0.0,0.0, 100)
   ipaws=getkey()
   call vexit() ! set the screen back to its original state
   !
   contains
   subroutine invoke(xt,yt,zt,xs,ys,zs,xr,yr,zr,iobject)

      !@(#) M_drawplus::invoke(3f): invoke object with specified transformation applied and then restored

      real,intent(in)    :: xt,yt,zt  ! linear transforms
      real,intent(in)    :: xs,ys,zs  ! scaling
      real,intent(in)    :: xr,yr,zr  ! rotation
      integer,intent(in) :: iobject

      call pushmatrix()
      call translate(xt,yt,zt)
      call scale(xs,ys,zs)
      call rotate(xr,'x')
      call rotate(yr,'y')
      call rotate(zr,'z')
      call callobj(iobject)
      call popmatrix()

   end subroutine invoke
   subroutine popall()

      !@(#) M_drawplus::popall(3f): call popviewport(), popmatrix(), popattributes()

      call popviewport()
      call popmatrix()
      call popattributes()
   end subroutine popall
   subroutine pushall()

      !@(#) M_drawplus::pushall(3f): call pushattributes(), pushmatrix(), pushviewport()

      call pushattributes()
      call pushmatrix()
      call pushviewport()
   end subroutine pushall
end program demo_saveobj
