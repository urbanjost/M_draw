<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c105">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>drawstr(3f)</b> - [M_draw:TEXT] Draw the text in string at the current position. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>drawstr</b>(<i>str</i>)
<b>character</b>(len=*),intent(<i>in</i>) :: <i>str</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Draw a text string at the current position. Uses current line color and thickness and text centering mode.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
      program demo_drawstr
      use M_draw
      call vinit('')
      ! by default the drawing surface is
      ! a square ranging from -1 to 1 in both
      ! the X and Y axis
<br />      call color(D_BLACK)    ! set current color to black
      call clear()           ! clear to current color
<br />      ! SET COMMON TEXT ATTRIBUTES
      call color(D_GREEN)    ! we want to draw in green
      call font('futura.m')  ! set font
      call textsize(0.1,0.1) ! font size
<br />      ! DRAW A STRING
      call move2(-1.0, 0.0)
      call drawstr('Hello')  ! draw string at current position
      ! note that current position is now at end of this string
<br />      ! CHANGE SOME TEXT ATTRIBUTES AGAIN
      call linewidth(20)     ! set line width
      call color(D_RED)      ! change color
      call textang(45.0)     ! change text angle
<br />      call drawstr(' World!')! draw string at current position
      idum=getkey()          ! pause
<br />      call vexit()           !  wrap up and exit graphics mode
<br />      end program demo_drawstr
      </blockquote>
      <hr />
      <br />
      <div class="c105"><img src="../images/drawstr.3m_draw.gif" /></div>
    </div>
  </div>
</body>
