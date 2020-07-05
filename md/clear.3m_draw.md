<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c57">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>clear(3f)</b> - [M_draw:COLOR] Clears screen to current color <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>clear</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Clears the screen to the current color. Causes a new page to begin on file-based devices that support multiple pages (Currently, the pixmap
        devices do not support multiple pages).</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
     program demo_clear
     use M_draw, only  : prefsize, vinit, ortho2, clear, getkey
     use M_draw, only  : vexit, color, circle, polyfill
     use M_draw, only  : D_BLACK,   D_WHITE
     use M_draw, only  : D_RED,     D_GREEN,    D_BLUE
     use M_draw, only  : D_YELLOW,  D_MAGENTA,  D_CYAN
     implicit none
     integer :: ipaws
<br />     call prefsize(300,300)
     call vinit(' ') ! start graphics using device $M_DRAW_DEVICEDEVICE
     ipaws=getkey()
     call ortho2(-100.0,100.0,-100.0,100.0)
<br />     call color(D_BLACK)               ! set current  color
     call clear()                ! clear background to current color
     call color(D_RED)               ! set color to draw with
     call circle(0.0,0.0,50.0)
     ipaws=getkey()              ! pause for a keypress on interactive devices
<br />     call color(D_GREEN)               ! make a second page
     call clear()
     call polyfill(.true.)
     call color(D_YELLOW)
     call circle(0.0,0.0,50.0)
     ipaws=getkey()
<br />     call vexit()
<br />     end program demo_clear
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c57"><img src="../images/clear.3m_draw.gif" /></div>
    </div>
  </div>
</body>
