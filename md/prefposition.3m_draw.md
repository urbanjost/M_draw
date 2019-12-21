<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c287">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>prefposition(3f)</b> - [M_draw:WINDOW_SETUP] Specify preferred position of window <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>prefposition</b>(<i>x</i>, <i>y</i>)
<br />    integer,intent(in) :: x, y
<br />
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Specify the preferred position of the window opened by the *next* vinit in raster units or units of resolution, depending on the output device. The
        physical size of the units are generally device-specific -- For X11 Windows and PPM pixmaps the values would represent rasters. For vector output
        devices the number of "rasters" per inch varies.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
     program demo_prefposition
     use M_draw, only    : prefsize, vinit, ortho2, clear, getkey, prefposition
     use M_draw, only    : move2, draw2, vexit, color
     use M_draw,    only  : D_BLACK,   D_WHITE
     use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
     use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
     implicit none
     integer :: ipaws
<br />     call prefsize(60,40)
     call prefposition(100,100)
<br />     call vinit(' ')         ! start graphics using device $M_DRAW_DEVICEDEVICE
     call ortho2(-300.0,300.0,-200.0,200.0)
     call color(D_BLACK)
     call clear()
     call color(D_RED)
     call move2(-300.0,-200.0)
     call draw2(300.0,200.0)
     call move2(300.0,-200.0)
     call draw2(-300.0,200.0)
     ipaws=getkey()
     call vexit()
<br />     end program demo_prefposition
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c287"><img src="../images/prefposition.3m_draw.gif" /></div>
    </div>
  </div>
</body>
