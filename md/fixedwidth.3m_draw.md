<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c115">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>fixedwidth(3f)</b> - [M_draw:TEXT] Turns fixedwidth mode on or off for SOFTWARE fonts. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>fixedwidth</b>(<i>onoff</i>)
logical <i>onoff</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Turns fixedwidth text on or off. Non-zero (.true.) causes all text to be printed with a fixed width for each character. Otherwise, the text is
        spaced proportionally, where each character has a unique width less than or equal to the current fixed font width. This routine only affects
        software text.</p>
        <p>The default at program initialization is <b>fixedwidth</b>(.false.)</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_fixedwidth
      use M_draw
      implicit none
      real,parameter :: x1=0.0,  x2=40.0,  y1=0.0,  y2=4.0
      real,parameter :: scl=3*0.7
      integer :: idum
   ! set up display
      call prefsize(1000,100)
      call vinit(' ')
      call page(x1,x2,y1,y2)
   ! set font appearance
      call linewidth(200)
      call font("times.rb")
   ! draw a string using proportional and fixed spacing
      call move2(x1+0.3,y1+0.4)
      call textsize(0.8*scl,1.2*scl)
      call color(1)
      call fixedwidth(.false.)
      call drawstr("fixedwidth(.false.)")
      call textsize(0.6*scl,1.2*scl)
      call color(2)
      call fixedwidth(.true.)
      call drawstr(" fixedwidth(.true.)")
   ! wrap up
      idum=getkey()
      call vexit()
   end program demo_fixedwidth
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c115"><img src="../images/fixedwidth.3m_draw.gif" /></div>
    </div>
  </div>
</body>
