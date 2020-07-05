<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c197">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>locator(3f)</b> - [M_draw:INTERACTIVE] Find out where cursor is <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
integer function <b>locator</b>(<i>xaddr</i>, <i>yaddr</i>)
real <i>xaddr</i>, <i>yaddr</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Find out where the cursor is. <i>xaddr</i> and <i>yaddr</i> are set to the current location in world coordinates. The function returns a bit
        pattern which indicates which buttons are being held down eg. if mouse buttons 1 and 3 are down locator returns binary 101 (decimal 7). The function
        returns <b>-1</b> if the device has no locator capability. Note: if you have been doing a lot of 3-D transformations <i>xaddr</i> and <i>yaddr</i>
        may not make a lot of sense. In this case use slocator.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
      program demo_locator !     track a cube with the locator
      use M_draw
      parameter(TRANS=20.0, SC=0.1)
      integer, parameter :: FACE=1, FILLED=2, OUTLINE=3
      character(len=10)  :: device
      character(len=1)   :: but
      logical            :: back, fill, hatch
      integer            :: ios
         write(*,*)'x,y,z = translate'
         write(*,*)'s     = apply scale'
         write(*,*)'+,-   = change scale/translate direction'
         write(*,*)'f,h   = fill, hatch'
         write(*,*)'b     = toggle backface'
         write(*,*)'q     = quit'
<br />         print*, 'Enter output device:'
         read(*, '(a)',iostat=ios) device
         if(ios.ne.0) device=' '
<br />         call prefposition(50, 50)
         call prefsize(500, 500)
<br />         call vinit(device)
<br />         call window(-800.0, 800.0, -800.0, 800.0, -800.0, 800.0)
         call lookat(0.0, 0.0, 1500.0, 0.0, 0.0, 0.0, 0.0)
<br />         tdir = TRANS
         scal = SC
<br />         !
         ! Start with a very ordinary filled cube like in the original demo...
         !
         call polyhatch(.false.)
         call hatchang(45.0)
         call hatchpitch(40.0)
         call polyfill(.true.)
<br />         fill = .true.
         hatch = .false.
         back = .true.
<br />         call makeobj(FACE)
         call makepoly()
         call rect(-200.0, -200.0, 200.0, 200.0)
         call closepoly()
         call closeobj()
<br />         call makecube(FILLED)
<br />         nplanes = getdepth()
         if (nplanes .eq. 1) call makecube(OUTLINE)
<br />         call backface(back)
         !
         ! Setup drawing into the backbuffer....
         !
         if (backbuffer().lt.0) then
            call vexit()
            write(*,*)'Device can''t support doublebuffering'
            stop
         endif
<br />         INFINITE: do
            idum = slocator(x, y)
            call pushmatrix()
            call rotate(100.0 * x, 'y')
            call rotate(100.0 * y, 'x')
            call color(D_BLACK)
            call clear()
            call callobj(FILLED)
            if (nplanes .eq. 1 .and. (fill .or. hatch)) call callobj(OUTLINE)
            call popmatrix()
            call swapbuffers()
<br />            but = char(checkkey())
            select case(but)
             case('x')
               call translate(tdir, 0.0, 0.0)
             case('y')
               call translate(0.0, tdir, 0.0)
             case('z')
               call translate(0.0, 0.0, tdir)
             case('s')
               call scale(scal, scal, scal)
             case('f')
               fill = .not. fill
               hatch = .false.
               call polyfill(fill)
             case('h')
               hatch = .not. hatch
               fill = .false.
               call polyhatch(hatch)
             case('b')
               back = .not. back
               call backface(back)
             case('-')
               tdir = -tdir
               if (scal .lt. 1.0) then
                  scal = 1.0 + SC
               else
                  scal = 1.0 - SC
               endif
             case('+')
               tdir = TRANS
             case('q',char(27))
               call vexit()
               stop
            end select
         enddo INFINITE
      contains
<br />      subroutine makecube(obj)
      integer obj
<br />         call makeobj(obj)
         if (obj .eq. OUTLINE) then
            call pushattributes()
            call color(D_BLACK)
            call polyfill(.false.)
            call polyhatch(.false.)
         endif
<br />         call pushmatrix()
         call translate(0.0, 0.0, 200.0)
         if (obj .eq. FILLED) call color(D_RED)
         call callobj(FACE)
         call popmatrix()
<br />         call pushmatrix()
         call translate(200.0, 0.0, 0.0)
         call rotate(90.0, 'y')
         if (obj .eq. FILLED) call color(D_GREEN)
         call callobj(FACE)
         call popmatrix()
<br />         call pushmatrix()
         call translate(0.0, 0.0, -200.0)
         call rotate(180.0, 'y')
         if (obj .eq. FILLED) call color(D_BLUE)
         call callobj(FACE)
         call popmatrix()
<br />         call pushmatrix()
         call translate(-200.0, 0.0, 0.0)
         call rotate(-90.0, 'y')
         if (obj .eq. FILLED) call color(D_CYAN)
         call callobj(FACE)
         call popmatrix()
<br />         call pushmatrix()
         call translate(0.0, 200.0, 0.0)
         call rotate(-90.0, 'x')
         if (obj .eq. FILLED) call color(D_MAGENTA)
         call callobj(FACE)
         call popmatrix()
<br />         call pushmatrix()
         call translate(0.0, -200.0, 0.0)
         call rotate(90.0, 'x')
         if (obj .eq. FILLED) call color(D_YELLOW)
         call callobj(FACE)
         call popmatrix()
<br />         if (obj .eq. OUTLINE) call popattributes()
<br />         call closeobj()
<br />
</pre>
        <blockquote>
          end subroutine makecube
          <p>end program demo_locator</p>
        </blockquote>
      </blockquote>
      <hr />
      <br />
      <div class="c197"><img src="../images/locator.3m_draw.gif" /></div>
    </div>
  </div>
</body>
