<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c200">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>lookat(3f)</b> - [M_draw:VIEWPORT] Specify the viewer's position <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>lookat</b>(<i>vx</i>, <i>vy</i>, <i>vz</i>, <i>px</i>, <i>py</i>, <i>pz</i>, <i>twist</i>)
real <i>vx</i>, <i>vy</i>, <i>vz</i>, <i>px</i>, <i>py</i>, <i>pz</i>, <i>twist</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Specify the viewer's position by giving a viewpoint and a reference point in world coordinates. A <i>twist</i> about the line of sight may also be
        given.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_lookat
   ! Demonstrate a rotating translating tetrahedron, and doublebuffering
   use M_draw
   use M_time, only : system_sleep
   !
   integer TETRAHEDRON
   parameter (TETRAHEDRON = 1)
   !
   real R, tx, tz, rotval, drotval, zeye
   integer i
   logical back, backdir, fill
   character(len=50) :: device
   integer :: ios
   !
   call prefsize(300, 300)
   !
   print*,'Enter output device:'
   read(*,'(a)',iostat=ios)device
   if(ios.ne.0)device=' '
   !
   back = .true.
   backdir = .true.
   fill = .true.
   !
   call vinit(device)
   !
   ! Make the tetrahedral object
   !
   call maketheobject()
   !
   rotval = 0.0
   drotval = 5.0
   zeye = 5.0
   !
   R = 1.6
   !
   tx = 0.0
   tz = R
   !
   !all polyfill(fill)
   call backface(back)
   call backfacedir(backdir)
   call clipping(.false.)
   !
   ! set up a perspective projection with a field of view of
   ! 40.0 degrees, aspect ratio of 1.0, near clipping plane 0.1,
   ! and the far clipping plane at 1000.0.
   !
   call perspective(40.0, 1.0, 0.001, 15.0)
   call lookat(0.0, 0.0, zeye, 0.0, 0.0, 0.0, 0.0)
   !
   ! Setup drawing into the backbuffer....
   !
   if (backbuffer().lt.0) then
      call vexit()
      write(*,*)'Device can''t support doublebuffering'
      stop
   endif
   !
   ! here we loop back here ad-naseum until someone hits a non interpreted key
   !
   INFINITE: do
   !
      rotval = 0.0
   !
      do i = 0, int(359.0 / drotval)
   !
         call color(D_BLACK)
         call clear()
   !
   !  Rotate the whole scene...(this accumulates - hence
   !  drotval)
   !
         call rotate(drotval * 0.1, 'x')
         call rotate(drotval * 0.1, 'z')
   !
         call color(D_RED)
         call pushmatrix()
         call polyfill(.false.)
         call rotate(90.0, 'x')
         call circle(0.0, 0.0, R)
         call polyfill(fill)
         call popmatrix()
   !
         call color(D_BLUE)
         call move(0.0, 0.0, 0.0)
         call draw(tx, 0.0, tz)
   !
   ! Remember! The order of the transformations is
   ! the reverse of what is specified here in between
   ! the pushmatrix and the popmatrix. These ones don't
   ! accumulate because of the push and pop.
   !
         call pushmatrix()
            call translate(tx, 0.0, tz)
            call rotate(rotval, 'x')
            call rotate(rotval, 'y')
            call rotate(rotval, 'z')
            call scale(0.4, 0.4, 0.4)
            call callobj(TETRAHEDRON)
         call popmatrix()
   !
         tz = R * cos(rotval * 3.1415926535 / 180)
         tx = R * sin(rotval * 3.1415926535 / 180)
   !
         call swapbuffers()
   !
         select case(char(checkkey()))
         case('f')
                   fill = .not. fill
                   call polyfill(fill)
         case('b')
                   back = .not. back
                   call backface(back)
         case('d')
                   backdir = .not. backdir
                   call backfacedir(backdir)
         case(char(0))
         case default
                   call vexit()
                   stop
          end select
   !
         rotval = rotval + drotval
   !
         call system_sleep(0.05)
   !
   enddo
   !
   enddo INFINITE
   !
   contains
   !
   ! maketheobject
   !
   !       generate a tetrahedron object as a series of move draws
   !
   subroutine maketheobject()
<br />   integer TETRAHEDRON, NSIDES, NFACES, NPNTS
   parameter (TETRAHEDRON = 1, NSIDES = 3, NFACES = 4, NPNTS = 4)
   integer colface(NFACES)
   real pnts(3, NPNTS)
   integer faces(NSIDES, NFACES)
   integer i, j
   real x, y, z
<br />   data pnts/               &amp;
        &amp;  -0.5, 0.866, -0.667,     &amp;
        &amp;  -0.5, -0.866, -0.667,    &amp;
        &amp;   1.0, 0.0, -0.667,       &amp;
        &amp;   0.0, 0.0, 1.334/
<br />   data colface/D_GREEN, D_YELLOW, D_CYAN, D_MAGENTA/
<br />   data faces/   &amp;
        &amp;  3, 2, 1,      &amp;
        &amp;  1, 2, 4,      &amp;
        &amp;  2, 3, 4,      &amp;
        &amp;  3, 1, 4/
<br />   call makeobj(TETRAHEDRON)
<br />   do i = 1, NFACES
      call makepoly()
      call color(colface(i))
      x = pnts(1, faces(1, i))
      y = pnts(2, faces(1, i))
      z = pnts(3, faces(1, i))
      call move(x, y, z)
      do j = 2, NSIDES
         x = pnts(1, faces(j,i))
         y = pnts(2, faces(j,i))
         z = pnts(3, faces(j,i))
         call draw(x, y, z)
      enddo
      call closepoly()
    enddo
<br />    call closeobj()
<br />    end subroutine maketheobject
<br />   end program demo_lookat
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c200"><img src="../images/lookat.3m_draw.gif" /></div>
    </div>
  </div>
</body>
