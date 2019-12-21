<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c435">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>voutput(3f)</b> - [M_draw:DEVICE] Redirect output from *next* vinit to file <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>voutput</b>(<i>path</i>)
character*(*) <i>path</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Redirect output from *next* <b>vinit</b>() to file given by <i>path</i>. This routine only applies to device drivers that write to stdout e.g.
        PostScript and hpgl.</p>
        <p>The special file names are</p>
        <blockquote>
          <table cellpadding="3">
            <tr valign="top">
              <td width="3%">-</td>
              <td>is standard output</td>
            </tr>
            <tr valign="top">
              <td width="3%">+</td>
              <td>is standard error</td>
            </tr>
            <tr valign="top">
              <td width="3%">|</td>
              <td> command will create a pipe to "command"</td>
            </tr>
          </table>
        </blockquote>
        <p>If the open of the file fails, an attempt is made to append to file "M_draw_OUTPUT". If this fails, standard output is used.</p>
        <p>When <b>vinit</b>() is called if <b>voutput</b>() has not been called then the environment variable M_draw_OUTPUT is checked and if it is defined
        and not a null string then <b>voutput</b>() is called with the M_draw_OUTPUT variable's value.</p>
        <p>A common use of the |command option is to automatically call programs that convert PPM files to other common pixmap formats or converts the GNU
        metafile to other formats (typically via the GNU plotutils plot program).</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_voutput
   use M_draw
   implicit none
   ! want a 400x400 raster output
   call prefsize(400,400)
   ! convert PPM to a GIF file using ppmtogif(1)
   call voutput('|ppmtogif &gt;voutput.3m_draw.gif')
   ! start graphics using PPM device
   call vinit('p6')
   ! draw a filled circle
   call color(D_RED)
   call polyfill(.true.)
   call circle(0.0,0.0,1.0)
   !
   call vexit()
   end program demo_voutput
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c435"><img src="../images/voutput.3m_draw.gif" /></div>
    </div>
  </div>
</body>
