<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c209">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>mapcolor(3f)</b> - [M_draw:COLOR] set a color index using RGB values <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="5">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>mapcolor</b>(<i>indx</i>, <i>red</i>, <i>green</i>, <i>blue</i>)
<b>integer,intent</b>(<i>in</i>) :: <i>indx</i>, <i>red</i>, <i>green</i>, <i>blue</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Set the color map index <i>indx</i> to the color represented by (<i>red</i>, <i>green</i>, <i>blue</i>). If the device has no color map this call
        does nothing.</p>
        <p>rgb values are <i>in</i> the range of 0 to 255.</p>
      </blockquote><a name="3"></a>
      <h3><a name="3">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c210" width="6%" nowrap="nowrap">INDX</td>
            <td valign="bottom">color index number, <i>in</i> range 0 to 255</td>
          </tr>
          <tr valign="top">
            <td class="c210" width="6%" nowrap="nowrap">RED</td>
            <td valign="bottom"><i>red</i> component of color being defined, <i>in</i> range 0 to 255</td>
          </tr>
          <tr valign="top">
            <td class="c210" width="6%" nowrap="nowrap">GREEN</td>
            <td valign="bottom"><i>green</i> component of color being defined, <i>in</i> range 0 to 255</td>
          </tr>
          <tr valign="top">
            <td class="c210" width="6%" nowrap="nowrap">BLUE</td>
            <td valign="bottom"><i>blue</i> component of color being defined, <i>in</i> range 0 to 255</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        Color wheel EXAMPLE:
        <pre>
   program demo_mapcolor
   !   good program to exercise color tables, and look at differences
   !   when actual output device has a color table that is dynamic,
   !   or only has a small color table (a frame in this program takes
   !   at least SLICES*RINGS colors to produce accurately).
   use M_draw
   use m_color, only : hue
   use M_units, only : cosd, sind
   implicit none
      real                 :: lightstep
      integer              :: ii,iframe
      integer,parameter    :: SLICES=30
      integer,parameter    :: RINGS=  8
      real                 :: LIGHTNESS
      integer,parameter    :: BOX=1200
      integer              :: ipaws
      integer              :: istart, iend
      character(len=20)    :: device
      call prefsize(BOX,BOX)
      call vinit(' ') ! start graphics using device $M_DRAW_DEVICEDEVICE
      call polyfill(.true.)
      call color(D_BLACK)
      call clear()
      call color(D_WHITE)
      call page(-110./2.,85./2.,-110./2.,110./2.)
      LIGHTNESS=100.0
      lightstep=-5
<br />      call vgetdev(device)
      select case(device)
      case ('p6','p3','ppm') ! just do one wheel
         istart=10
         iend=10
         LIGHTNESS=50.0
      case default           ! do many lightnesses
         istart=1
         iend=19
      end select
<br />      do ii=istart,iend
         iframe=ii
         call color(D_BLACK)
         call clear()
         call color(D_WHITE)
         call wheel()
         LIGHTNESS=LIGHTNESS+LIGHTSTEP
         ipaws=getkey()
      enddo
      call vexit()
   contains
   !=======================================================================--------
   subroutine wheel() ! draw an entire wheel
      character(len=40) :: inline
      real              :: hue_val
      integer           :: ii
      call textang(0.0)
      call color(D_WHITE)
      call textsize(5.0,6.0)
      call font('times.r')
      call move2(0.0,103.0/2.0)
      call centertext(.true.)
      call linewidth(30)
      call drawstr('COLOR WHEEL')
      call linewidth(0)
      call textsize( 2.5,2.5)
      call font('futura.l')
      call move2(0.0,90.0/2.0)
      write(inline,'("lightness=",f6.2)')LIGHTNESS
      call linewidth(30)
      call drawstr(inline)
      call linewidth(0)
      call textsize(1.5,1.5)
      hue_val=0
      do ii=SLICES, 1,-1
         call slice(hue_val)
      enddo
      call centertext(.false.)
   end subroutine wheel
   !=======================================================================--------
   subroutine slice(hue_val) ! draw a slice
      integer           :: buffer
      real              :: hue_val, ang_inc
      character(len=40) :: inline
      real              :: step
      real              :: X1, X2, X3, X4
      real              :: Y1, Y2, Y3, Y4
      !
      integer           :: maxcolors, current_color
      integer           :: ir, ig, ib
      real              :: r,g,b
      real              :: saturation
      !
      integer           :: status
      integer           :: icount
      real              :: angle1, angle2
      real              :: radius1, radius2, radius3, radius4
      !
      integer,save      :: color_count=0
      !
      buffer=8
      ANG_INC=360.0/SLICES
      angle1=hue_val-ANG_INC/2
      angle2=angle1+ANG_INC
      saturation=100
      radius1=32
      radius3=radius1+4
      radius4=radius1+7
      ! draw tic from wheel to start of angle label
      call color(D_WHITE)
      call linewidth(40)
      call move2( radius1*cosd(hue_val), radius1*sind(hue_val) )
      call draw2( radius3*cosd(hue_val), radius3*sind(hue_val) )
      ! draw degree label at tic
      call textang(hue_val)
      call move2( radius4*cosd(hue_val), radius4*sind(hue_val) )
      write(inline,'(i0)')nint(hue_val)
      call linewidth(20)
      call drawstr(inline)
      call linewidth(0)
      step=radius1/real(RINGS)
      radius2=radius1-step
      ! draw a chunk in a slice
      MAXCOLORS=(256)-buffer
      do icount=RINGS+1,2,-1
         CURRENT_COLOR=MOD(color_count,MAXCOLORS)+buffer  ! add buffer to leave base colors alone
         color_count=color_count+1
         ! fancy mapcolor
         call hue("hls",hue_val,LIGHTNESS,saturation,"rgb",r,g,b,status)
         ir=int(r*255.0/100.0+0.50)
         ig=int(g*255.0/100.0+0.50)
         ib=int(b*255.0/100.0+0.50)
         call mapcolor(CURRENT_COLOR,ir,ig,ib)
         call color(CURRENT_COLOR)
         !
         X1=cosd(angle1)*radius2
         Y1=sind(angle1)*radius2
         X2=cosd(angle1)*radius1
         Y2=sind(angle1)*radius1
         !
         X3=cosd(angle2)*radius2
         Y3=sind(angle2)*radius2
         X4=cosd(angle2)*radius1
         Y4=sind(angle2)*radius1
         !
         call makepoly()
         call move2(X1,Y1)
         call draw2(X2,Y2)
         call draw2(X4,Y4)
         call draw2(X3,Y3)
         call closepoly()
         !
         saturation=saturation-100.0/RINGS
         radius1=radius2
         radius2=radius1-step
      enddo
      hue_val=hue_val+ANG_INC
   end subroutine slice
   end program demo_mapcolor
<br />
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c209"><img src="../images/mapcolor.3m_draw.gif" /></div>
    </div>
  </div>
</body>
