<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c388">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>textsize(3f)</b> - [M_draw:TEXT] Set text size of a character in the current SOFTWARE font in world units. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>textsize</b>(<i>width</i>, <i>height</i>)
<b>real,intent</b>(<i>in</i>) :: <i>width</i>
<b>real,intent</b>(<i>in</i>) :: <i>height</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Set the maximum size of a character <i>in</i> the current font. Width and <i>height</i> are values <i>in</i> world units. This applies to
        software text, but may not apply to hardware fonts depending upon the output device. This must be done after the font being scaled is loaded. To
        keep text of different sizes aligned along the same baseline not that you typically need to subtract the descender <i>height</i> from the Y
        position</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_textsize
   use M_draw
   implicit none
   integer :: i,ii
   integer :: ipaws
      !! set up long bar as plotting area
      call prefsize(900,150)
      call vinit(' ') ! start graphics using device $M_draw_DEVICE
      call ortho2(-30.0, 30.0, -5.0, 5.0)
      call font('times.r')
<br />      call move2(-23.0,-4.5)
      call color(D_WHITE)
      call textsize(2.0,2.0)
      call move2(-27.5,-3.0)
      call draw2( 27.5,-3.0)
      call move2(-27.5,-3.0)
<br />      do i=1,7
         ii=nint((i*20)*0.30)
         call linewidth(nint(ii*2.35))
         call textsize(real(i),real(i))
         call color(D_MAGENTA)
         call drawstr('aA')
      enddo
<br />      ipaws=getkey()
<br />      call vexit()
<br />   end program demo_textsize
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c388"><img src="../images/textsize.3m_draw.gif" /></div>
    </div>
  </div>
</body>
