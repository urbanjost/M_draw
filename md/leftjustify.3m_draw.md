<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c185">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>leftjustify(3f)</b> - [M_draw:TEXT] left justify text <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>leftjustify</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Left justifies text. The text string will begin at the current position and extend to the notional right. Right justification and X centering are
        turned off.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_leftjustify
   use M_draw
   use M_draw,    only  : D_BLACK,   D_WHITE
   use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
   use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
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
      AX=(x1+x2)/2+1; BX=y1+1.3
      call move2(AX,BX)
      call leftjustify()
      call color(D_GREEN)
      call drawstr("leftjustify()")
      call color(D_RED)
      call move2(AX-1.0,BX)
      call draw2(AX+1.0,BX)
      call move2(AX,BX-1.0)
      call draw2(AX,BX+1.0)
      call vflush()
      key=getkey()
      call vexit()
   end program demo_leftjustify
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c185"><img src="../images/leftjustify.3m_draw.gif" /></div>
    </div>
  </div>
</body>
