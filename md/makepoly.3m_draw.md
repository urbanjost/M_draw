<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c206">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>makepoly(3f)</b> - [M_draw:POLYGONS] opens polygon constructed by a series of move-draws and closed by closepoly <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>makepoly</b>()
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>makepoly</b>(3f)</td>
            <td>opens up a polygon which will then be constructed by a series of move-draws and closed by a closepoly.</td>
          </tr>
        </table>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_makepoly
   use :: M_draw
   implicit none
   integer,parameter :: wide=640, tall=640
   integer :: rows, xoff, yoff, box_sz
   integer :: i20, i30, ncols, nrows, ilines
   real    :: bottom, left, sun_radius, planet_radius, planet_offset
   integer :: ipaws
      call prefsize(wide,tall)
      call vinit(' ') ! start graphics using device $M_DRAW_DEVICEDEVICE
      call ortho2(0.0, real(wide), 0.0, real(tall) )
      ! call linewidth(3) ! really slows down pbm driver because all lines are polygons
      call color(D_WHITE)
      call clear()
      call color(D_BLACK)
      rows=1
      box_sz=MIN(wide,tall)/rows       ! size of biggest box to use and get specified number of rows
      nrows = tall/box_sz              ! number of rows of objects to draw
      ncols = wide/box_sz              ! number of columns of objects to draw
      xoff = (wide - ncols * box_sz)/2 ! initial x offset to begin row at to center drawings
      yoff = (tall - nrows * box_sz)/2 ! initial x offset to begin column at to center drawings
      sun_radius = 148
      planet_radius = 1
      do ilines = 1, 300
         do i20 = 1, ncols
            left = (i20-1)*box_sz+xoff
            do i30 = 1, nrows
               bottom = (i30-1)*box_sz+yoff
               call color(D_BLACK)
            call makepoly()
               call rect(left,bottom,left+box_sz,bottom+box_sz)
            call closepoly()
               planet_offset= sun_radius
                  call color(mod(ilines,15)+1)
                  call hypoc(left + box_sz/2.0, bottom + box_sz/2.0, &amp;
               &amp; sun_radius, planet_radius, planet_offset, &amp;
               &amp; box_sz/2.0, ilines,  &amp;
               &amp; 0.0, 0.0, 1)
            enddo
         enddo
         ipaws=getkey()
      enddo
      call vexit()
   contains
   !
   !  Make shapes using hypocycloidal curves.
   !
   subroutine hypoc(xcenter,ycenter,sunr0,planet0,offset0,radius,ilines,ang,angs,ifill)
   use M_draw
   implicit none
   real,parameter     :: PI= 3.14159265358979323846264338327950288419716939937510
   real,intent(in)    :: xcenter, ycenter      ! center of curve
   real,intent(in)    :: sunr0,planet0,offset0 ! radii of sun, planet, and planet offset
   real,intent(in)    :: radius                ! radius to fit the shape to (no fit if radius is 0)
   integer,intent(in) :: ilines                ! number of points to sample along curve
   real,intent(in)    :: ang                   ! angle to rotate the shape by, to orientate it.
   real,intent(in)    :: angs                  ! angle to start sampling points at; ccw is +; 0 is East
   integer,intent(in) :: ifill                 ! 1 make a filled polygon, 2 make a hatched polygon
   integer            :: i10
   real               :: ang1, con1, con2, factor
   real               :: offset, planet, r, sunr, u
   real               :: xpoin, xpoin1, ypoin, ypoin1
      sunr=sunr0
      offset=offset0
      planet=planet0
      if(ilines.eq.0.0) return
      if(planet.eq.0.0) return
      if(sunr.eq.0.0)   return
      if(radius.ne.0.and.sunr-planet+offset.ne.0)then
         factor=radius/(sunr-planet+offset)
         sunr=factor*sunr
         planet=factor*planet
         offset=factor*offset
      endif
      u=0.0+ang
      con1=PI*2.*(sunr/planet)/real(ilines)
      con2=(1.0-planet/sunr)*u
      xpoin1=(sunr-planet)*cos(planet*u/sunr)+offset*cos(con2)
      ypoin1=(sunr-planet)*sin(planet*u/sunr)-offset*sin(con2)
      ang1=atan2(ypoin1,xpoin1)+angs
      r=sqrt(xpoin1**2+ypoin1**2)
      xpoin1=r*cos(ang1)+xcenter
      ypoin1=r*sin(ang1)+ycenter
      select case(ifill)
      case(:0)
      case(1:)
         call makepoly()
      end select
      call move2(xpoin1,ypoin1)
      do i10=1,ilines
         u=con1*i10+ang
         con2=(1.0-planet/sunr)*u
         if(con2.ge.2**24) con2=amod(con2,PI)
         xpoin=(sunr-planet)*cos(planet*u/sunr)+offset*cos(con2)
         ypoin=(sunr-planet)*sin(planet*u/sunr)-offset*sin(con2)
         ang1=atan2(ypoin,xpoin)+angs
         r=sqrt(xpoin**2+ypoin**2)
         xpoin=r*cos(ang1)+xcenter
         ypoin=r*sin(ang1)+ycenter
         call draw2(xpoin,ypoin)
      enddo
      call draw2(xpoin1,ypoin1)
      if(ifill.gt.0)then
        call closepoly()
      endif
   end subroutine hypoc
   end program demo_makepoly
</pre>
      </blockquote>
      <hr />
      <br />
      <div class="c206"><img src="../images/makepoly.3m_draw.gif" /></div>
    </div>
  </div>
</body>
