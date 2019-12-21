<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c349">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>scale(3f)</b> - [M_draw:TRANSFORMATION] Set up scaling factors in x, y, and z axis. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="6">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>scale</b>(<i>x</i>, <i>y</i>, <i>z</i>)
<br />    real,intent(in) ::  x, y, z
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Set up scaling factors in <i>x</i>, <i>y</i>, and <i>z</i> axis. The scaling is applied relative to the current transformation matrix; ie. the
        scaling is accumulative.
      </blockquote><a name="3"></a>
      <h3><a name="3">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c350" width="6%" nowrap="nowrap">x</td>
            <td valign="bottom">scaling factor to apply in X direction to current transformation matrix</td>
          </tr>
          <tr valign="top">
            <td class="c350" width="6%" nowrap="nowrap">y</td>
            <td valign="bottom">scaling factor to apply in Y direction to current transformation matrix</td>
          </tr>
          <tr valign="top">
            <td class="c350" width="6%" nowrap="nowrap">x</td>
            <td valign="bottom">scaling factor to apply in Z direction to current transformation matrix</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        Sample program
        <pre>
   program demo_scale
   use M_drawplus, only : draw_interpret
   character(len=:),allocatable :: draw_cmds(:)
   draw_cmds=[ character(len=128) ::                                      &amp;
   '# set up display                                                    ',&amp;
   'prefsize 300 300;prefposition 200 10;vinit X11;                     ',&amp;
   'set SIZE=1.2                                                        ',&amp;
   'color 3;clear;color 2; ortho2 -SIZE SIZE -SIZE SIZE                 ',&amp;
   'set X=-0.75 Y=0.75                                                  ',&amp;
   '# create an object to repeatedly draw                               ',&amp;
   'makeobj 1                                                           ',&amp;
   'polyfill .true.;color 1; rect 0 0 X Y                               ',&amp;
   'polyfill .false.;linewidth 200;color 2 ;rect 0 0 X Y                ',&amp;
   'closeobj                                                            ',&amp;
   '# draw opbject, rotating coordinate system between instantiations   ',&amp;
   'pushmatrix                                                          ',&amp;
   'scale 1.1 2.0                                                       ',&amp;
   'callobj 1                                                           ',&amp;
   'scale 0.5 0.5                                                       ',&amp;
   'callobj 1                                                           ',&amp;
   'circle 0 0 X/3                                                      ',&amp;
   'popmatrix                                                           ',&amp;
   'color 5;circle 0 0 X/3                                              ',&amp;
   'getkey;vexit                                                        ']
   write(*,'(a)')draw_cmds
   call draw_interpret(draw_cmds,delimiters=';')
   end program demo_scale
<br />
</pre>
      </blockquote><a name="5"></a>
      <h3><a name="5">SEE ALSO</a></h3>
      <blockquote>
        rotate, translate, pushmatrix, popmatrix
      </blockquote>
      <hr />
      <br />
      <div class="c349"><img src="../images/scale.3m_draw.gif" /></div>
    </div>
  </div>
</body>
