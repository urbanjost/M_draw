<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c333">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>rotate(3f)</b> - [M_draw:TRANSFORMATION] Set up a rotation in axis axis where axis is one of 'x','y', or 'z'. <b></b>
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
            <td class="c334" width="6%" nowrap="nowrap">angle</td>
            <td valign="bottom">Angle in degrees to rotate coordinate system, with clockwise angles being positive.</td>
          </tr>
          <tr valign="top">
            <td class="c334" width="6%" nowrap="nowrap">axis</td>
            <td valign="bottom">Which <i>axis</i> to perform rotation about. Allowed values are 'x',</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        Sample usage program demo_rotate use M_drawplus, only : draw_interpret <b>character</b>(len=:),allocatable :: <b>draw_cmds</b>(:)
        <blockquote>
          <table cellpadding="3">
            <!-- tsb: Sample usage
 -->
            <tr valign="top">
              <td colspan="2"><b>draw_cmds=[</b> <b>character</b>(len=128) :: <!-- Consumed .TP -->
              <br />
              <b>'# set up display</b></td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'prefsize 300 300;prefposition 200 10;vinit X11;</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'set SIZE=1.2</td>
            </tr>
            <tr valign="top">
              <td colspan="2"><b>'color 3;clear;color 2; ortho2</b> <b>-SIZE</b> SIZE <b>-SIZE</b> SIZE</td>
            </tr>
            <tr valign="top">
              <td colspan="2"><b>'set X=</b><b>-0.75</b> Y=0.75</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'# create an object to repeatedly draw</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'makeobj 1</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'polyfill .true.;color 1; rect 0 0 X Y</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'polyfill .false.;linewidth 200;color 2 ;rect 0 0 X Y</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'closeobj</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'# draw opbject, rotating coordinate system between instantiations</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'callobj 1</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'rotate 45 z</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'callobj 1</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'rotate 45 z</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'callobj 1</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'circle 0 0 X/3</td>
            </tr>
            <tr valign="top">
              <td class="c335" colspan="2">'getkey;vexit</td>
            </tr>
            <tr valign="top">
              <td width="6%"></td>
              <td><b>write</b>(*,'(a)')draw_cmds call <b>draw_interpret</b>(draw_cmds,delimiters=';') end program demo_rotate</td>
            </tr>
          </table>
        </blockquote>
      </blockquote><a name="5"></a>
      <h3><a name="5">SEE ALSO</a></h3>
      <blockquote>
        translate, pushmatrix, popmatrix, scale
      </blockquote>
      <hr />
      <br />
      <div class="c333"><img src="../images/rotate.3m_draw.gif" /></div>
    </div>
  </div>
</body>
