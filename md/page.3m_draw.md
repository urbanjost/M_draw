<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c229">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>page(3f)</b> - set window into largest viewport available </b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="6">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>page</b>(xsmall,xlarge,ysmall,ylarge)
<i>real</i>, <b>intent=</b>(<i>in</i>) :: xsmall
<i>real</i>, <b>intent=</b>(<i>in</i>) :: xlarge
<i>real</i>, <b>intent=</b>(<i>in</i>) :: ysmall
<i>real</i>, <b>intent=</b>(<i>in</i>) :: ylarge
<br />subroutine <b>page</b>(xsize,ysize,icolor)
</pre>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><i>real</i>, <b>intent=</b>(<i>in</i>)</td>
            <td>:: xsize</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><i>real</i>, <b>intent=</b>(<i>in</i>)</td>
            <td>:: ysize <i>integer</i>, <b>intent=</b>(<i>in</i>) :: icolor</td>
          </tr>
        </table>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        FORM SUBROUTINE <b>PAGE</b>(XSMALL,XLARGE,YSMALL,YLARGE)
        <p>Set the window to the rectangle defined by the corner points &lt;xsmall,ysmall&gt; and &lt;xlarge,ylarge&gt;.</p>
        <p>Also, given the window size, and assuming a one-to-one correspondence of window units (ie. an "x-unit" is as long as a "y-unit"), find the
        largest area on the display surface that has the same aspect ratio, and set the viewport to it.</p>
        <p>FORM SUBROUTINE <b>PAGE</b>(XSIZE,YSIZE,ICOLOR)</p>
        <p>Size the window to the rectangle defined by the corner points &lt;0.0,0.0&gt; and &lt;xsize,ysize&gt; and the viewport to the largest centered
        area that has the same aspect ratio, and set the background color to the value mapped to color ICOLOR.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_page
   use M_draw
   use M_draw,    only  : D_BLACK,   D_WHITE
   use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
   use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
   implicit none
   integer :: ipaws
   real,parameter :: radius=25.0
      call prefsize(600,600)
      call vinit(' ') ! start graphics using device $M_draw_DEVICE
      call page(-radius, radius, -radius, radius)
      call linewidth(200)
      call clear()
      call color(D_BLUE)
      call move2(-radius, -radius)
      call draw2(-radius, radius)
      call draw2(radius, radius)
      call draw2(radius, -radius)
      call draw2(-radius, -radius)
      call color(D_CYAN)
      call circle(0.0,0.0,radius)
      call vflush()
      ipaws=getkey()
      call vexit()
   end program demo_page
</pre>
      </blockquote><a name="4"></a>
      <hr />
      <br />
      <div class="c229"><img src="../images/page.3M_draw.gif" /></div>
    </div>
  </div>
</body>
