<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c250">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>point2(3f)</b> - [M_draw:POINT] Draw a point at x, y. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>point2</b>(<i>x</i>, <i>y</i>)
<b>real,intent</b>(<i>in</i>) :: <i>x</i>, <i>y</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Draw a point at <i>x</i>, <i>y</i>. Points are device-dependent and may not appear at all. Generally points are drawn with the current color as a
        circle with a diameter equal to the current linewidth.
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_point2
   use :: M_draw
   implicit none
   integer :: i
   integer :: ipaws
   call prefsize(300,300)
   call vinit(' ') ! start graphics using device $M_draw_DEVICE
   call ortho2(0.0, 20.0, 0.0, 20.0)
   call color(D_MAGENTA)
   do i=1,20
      call linewidth(20*i)
      call point2(real(i),real(i))
   enddo
   ipaws=getkey()
   call vexit()
   end program demo_point2
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c250"><img src="../images/point2.3m_draw.gif" /></div>
    </div>
  </div>
</body>
