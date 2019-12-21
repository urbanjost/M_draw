<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c151">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>getgp2(3f)</b> - [M_draw:POSITION] Gets the current graphics position in world coordinates <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="5">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>getgp2</b>(<i>x</i>, <i>y</i>)
<b>real,intent</b>(<i>out</i>) :: <i>x</i>,<i>y</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Gets the current graphics position in world coords.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">RETURNS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c152" width="6%" nowrap="nowrap">X</td>
            <td valign="bottom">X coordinate of current position</td>
          </tr>
          <tr valign="top">
            <td class="c152" width="6%" nowrap="nowrap">Y</td>
            <td valign="bottom">Y coordinate of current position</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
     program demo_getgp2
     use M_draw
     implicit none
     real :: X,Y
     call prefsize(20,20)
     call vinit(' ') ! start graphics using device $M_draw_DEVICE
     call ortho2(-100.0,100.0,-100.0,100.0)
     call move2(0.0,0.0)
     call draw2(96.5,98.333)
<br />     call getgp2(X,Y)
     write(*,*)'CURRENT POSITION (X,Y)=',X,Y
<br />     call vexit()
     end program demo_getgp2
<br />
</pre>Results
        <pre>
   CURRENT POSITION (X,Y)=   96.5000000       98.3330002
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c151"><img src="../images/getgp2.3m_draw.gif" /></div>
    </div>
  </div>
</body>
