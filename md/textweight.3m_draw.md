<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c394">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>textweight(3f)</b> - [M_draw:TEXT] Defines the weight of the fonts. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>textweight</b>(<i>ival</i>)
integer <i>ival</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Defines the weight of the fonts. Currently, the predefined constants in C and Fortran are D_NORMAL and D_BOLD; which correspond to 0 and</p>
        <table cellpadding="3">
          <!-- tsb: Defines the weight of the fonts. Currently, the predefined constants
 -->
          <tr valign="top">
            <td width="4%">1.</td>
            <td>This is not the same as using linethickess to change the appearance of a software font. The font is redrawn multiple times with a slight
            offset to create the bold appearance.</td>
          </tr>
        </table>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_textweight
   use M_draw
   implicit none
   real,parameter :: w=40.0
   integer        :: key
      call prefsize(600,600)
      call vinit(' ')
      call color(D_BLACK)
      call clear()
      call color(D_YELLOW)
      call page(-w,w,-w,w)
      call font("times.rb")
      call linewidth(180)
      call textsize(15.0,15.0)
      call centertext(.true.)
      call linewidth(0);call color(D_BLUE)
      call move2(0.0, W/2.0)
<br />      call textweight(0)
      call drawstr('NORMAL')
<br />      call linewidth(0);call color(D_MAGENTA)
      call move2(0.0, 0.0-W/2.0)
<br />      call textweight(1)
      call drawstr('BOLD')
<br />      call vflush()
      key=getkey()
      call vexit()
   end program demo_textweight
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c394"><img src="../images/textweight.3m_draw.gif" /></div>
    </div>
  </div>
</body>
