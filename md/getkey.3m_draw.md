<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c158">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>getkey(3f)</b> - [M_draw:INTERACTIVE] Return ASCII ordinal of next key typed <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
integer function <b>getkey</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Return the ASCII ordinal of the next key typed at the keyboard. If the device has no keyboard <b>getkey</b>(3) returns <b>-1</b>.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
     program demo_getkey
     use :: M_draw
     use :: M_units, only : cosd, sind
     use :: M_time, only : system_sleep
     !! set up drawing environment
     call prefsize(600,600)
     call voutput('+')
     call vinit(' ') ! start graphics using device $M_DRAW_DEVICEDEVICE
     call ortho2(-300.0,300.0,-300.0,300.0)
     call textsize(500.0,500.0)
     call linewidth(130)
     call centertext(.true.)
     call color(D_BLACK)
     call clear()
     write(*,*)'press any character to see it displayed in the default font'
     write(*,*)'Enter "q" to quit'
     do
       ichar=getkey()
       if(ichar.lt.0)then
          write(*,*)'this device does not support getkey'
          exit
       elseif(ichar.ne.0)then
          call color(D_BLACK)
          call clear()
          call color(D_BLUE)
          call move2(0.0,0.0)
          call drawstr(char(ichar))
       endif
       if(char(ichar).eq.'q')then
          write(*,*)'press any key to exit'
          ichar=getkey()
          exit
       endif
     enddo
     call vexit()
     end program demo_getkey
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c158"><img src="../images/getkey.3m_draw.gif" /></div>
    </div>
  </div>
</body>
