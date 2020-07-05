<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c397">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>topjustify(3f)</b> - [M_draw:TEXT] top justify text <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>topjustify</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Top justifies text. The text string will be drawn with its upper edge aligned with the current Y position. Bottom justification and Y centering are
        turned off.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_topjustify
   use M_draw
   implicit none
   real    :: x1, x2, y1, y2
   real    :: scl, ax, bx
   integer :: key
      call prefsize(1200,120)
      call vinit(' ')
      x1=0; x2=40; y1=0; y2=4; scl=1.9
      call page(x1,x2,y1,y2)
      call textsize(0.9*scl,1.4*scl)
      call font("times.rb")
      call linewidth(200)
      AX=(x1+x2)/2+0.3; BX=y1+3.3
      call move2(AX,BX)
      call topjustify()
      call color(D_BLUE)
      call drawstr("topjustify()")
      call color(D_RED)
      call move2(AX-1.0,BX)
      call draw2(AX+1.0,BX)
      call move2(AX,BX-1.0)
      call draw2(AX,BX+1.0)
      call vflush()
      key=getkey()
      call vexit()
   end program demo_topjustify
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c397"><img src="../images/topjustify.3m_draw.gif" /></div>
    </div>
  </div>
</body>
