<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c31">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>boxtext(3f)</b> - [M_draw:TEXT] stretch and draw the SOFTWARE string s so that it fits in the imaginary box <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="5">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>boxtext</b>(<i>x</i>, <i>y</i>, <i>l</i>, <i>h</i>, <i>s</i>)
real <i>x</i>, <i>y</i>, <i>l</i>, <i>h</i>, <i>s</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Draw the string S so that it fits in the imaginary box defined with bottom left hand corner at (<i>x</i>, <i>y</i>), length <i>l</i>, and height
        <i>h</i>. This only applies to software text. The textsize is temporarily resized so that the string fills the specified box.
      </blockquote><a name="3"></a>
      <h3><a name="3">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c32" width="6%" nowrap="nowrap">X,Y</td>
            <td valign="bottom">position of lower left corner of box in world coordinates</td>
          </tr>
          <tr valign="top">
            <td class="c32" width="6%" nowrap="nowrap">L</td>
            <td valign="bottom">length of box in world coordinates</td>
          </tr>
          <tr valign="top">
            <td class="c32" width="6%" nowrap="nowrap">H</td>
            <td valign="bottom">height of box in world coordinates</td>
          </tr>
          <tr valign="top">
            <td class="c32" width="6%" nowrap="nowrap">S</td>
            <td valign="bottom">string to stretch into box and draw</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        Simple program:
        <pre>
    program demo_boxtext
    use M_draw,     only : vinit,vexit,prefsize,vgetdev,clear
    use M_draw,     only : centertext,polyfill,font,linewidth,color
    use M_draw,     only : getkey
    use M_draw,     only : color,rect,boxtext
    use M_draw,     only : D_BLACK,   D_WHITE
    use M_draw,     only : D_RED,     D_GREEN,    D_BLUE
    use M_draw,     only : D_YELLOW,  D_MAGENTA,  D_CYAN
    implicit none
    real              :: x1=0.0,    x2=40.0,    y1=0.0,    y2=7.0
    real              :: xmin=1.0,  xmax=39.0,  ymin=1.0,  ymax=6.0
    integer           :: idum
       call prefsize(int(x2-x1)*25,int(y2-y1)*25)
       call vinit(' ')
       call page(x1,x2,y1,y2)
       call centertext(.true.)
       call font("times.rb")
       call color(D_GREEN)
       call clear()
       call linewidth(200)
       call color(D_CYAN); call polyfill(.false.); call rect(xmin,ymin,xmax,ymax)
       call color(D_WHITE); call polyfill(.true.);  call rect(xmin,ymin,xmax,ymax)
       call color(D_BLACK)
       call boxtext(xmin,ymin,xmax-xmin,ymax-ymin,"This text is in the box")
       idum=getkey()
       call vexit()
    end program demo_boxtext
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c31"><img src="../images/boxtext.3m_draw.gif" /></div>
    </div>
  </div>
</body>
