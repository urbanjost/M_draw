<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c1">
      </div><a name="0"></a>

      <h3><a name="0">NAME</a></h3>

      <blockquote>
        <b>rotate(3f)</b> - [M_draw:TRANSFORMATION] Set up a rotation in axis axis where axis is one of 'x','y', or 'z'.
      </blockquote><a name="contents" id="contents"></a>

      <h3><a name="6">SYNOPSIS</a></h3>

      <blockquote>
        <pre>
subroutine <b>rotate</b>(<i>angle</i>, <i>axis</i>)
real <i>angle</i>
character <i>axis</i>
</pre>
      </blockquote><a name="2"></a>

      <h3><a name="2">DESCRIPTION</a></h3>

      <blockquote>
        <p>Set up a rotation of coordinate system along specified <i>axis</i>, relative to current coordinate system.</p>
      </blockquote><a name="3"></a>

      <h3><a name="3">OPTIONS</a></h3>

      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">angle</td>

            <td valign="bottom">Angle in degrees to rotate coordinate system, with clockwise angles being positive.</td>
          </tr>

          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">axis</td>

            <td valign="bottom">Which <i>axis</i> to perform rotation about. Allowed values are 'x',</td>
          </tr>

        </table>
      </blockquote><a name="4"></a>

      <h3><a name="4">EXAMPLE</a></h3>

      <blockquote>
        Sample usage
        <pre>
   program demo_rotate
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
   'callobj 1                                                           ',&amp;
   'rotate 45 z                                                         ',&amp;
   'callobj 1                                                           ',&amp;
   'rotate 45 z                                                         ',&amp;
   'callobj 1                                                           ',&amp;
   'circle 0 0 X/3                                                      ',&amp;
   'getkey;vexit                                                        ']
   write(*,'(a)')draw_cmds
   call draw_interpret(draw_cmds,delimiters=';')
   end program demo_rotate
<br />
</pre>
      </blockquote><a name="5"></a>

      <h3><a name="5">SEE ALSO</a></h3>

      <blockquote>
        translate, pushmatrix, popmatrix, scale
      </blockquote>
      <hr />
      <div class="c1"><img src="../images/rotate.3m_draw.gif" /></div>
    </div>
  </div>
</body>
</html>
