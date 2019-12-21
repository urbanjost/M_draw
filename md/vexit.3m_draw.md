<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c416">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>vexit(3f)</b> - [M_draw:DEVICE] Reset window/terminal and exit graphics mode. Must be last routine called. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>vexit</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Reset the window/terminal and terminate graphics mode. Required to properly close out most output devices. Must be called before any second call
        to <b>vinit</b>(3f). Must be the last M_draw routine called.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
     program demo_vexit
     use M_draw, only: vinit, vexit, voutput, circle, linewidth, color
     use M_draw,    only  : D_BLACK,   D_WHITE
     use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
     use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
     implicit none
     integer :: i
<br />     ! assuming you have the NetPBM package installed
     ! set up output to create a GIF file called one.gif
     call voutput('|ppmtogif &gt;vexit.3m_draw.gif')
<br />     call vinit('p6') ! start graphics
     ! default window is -1 &lt;= x &lt;= 1, -1 &lt;= y &lt;= 1
     ! default viewport is left bottom justified square
     ! so essentially you have a square drawing surface
     ! with the point &lt;0,0&gt; at the center of the square
     ! with X and Y ranging from -1 to 1.
<br />     call color(D_RED)
     call linewidth(100)
     ! this loop draws outside the current window
     ! but by default clipping is on
     do i=1,30
        call circle((real(i)-1)*0.04,0.0,1.0/real(i))
     enddo
<br />     call vexit() ! exited graphics so can start again
<br />     ! start second graphics session with new output
     ! device and output file
     call voutput('|ppmtogif &gt;vexit2.3m_draw.gif')
     call vinit('p6')
<br />     do i=10,1,-1
        call color(i)
        call circle(0.0,0.0,1.0/real(i))
     enddo
<br />     call vexit()
<br />     end program demo_vexit
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c416"><img src="../images/vexit.3m_draw.gif" /></div>
    </div>
  </div>
</body>
