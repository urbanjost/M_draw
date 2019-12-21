<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c1">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>M_draw(3fm)</b> - [M_draw::INTRO] The M_draw graphics library <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="5">DESCRIPTION</a></h3>
      <blockquote>
        <p>M_draw is a portable public-domain device-independent graphics library intended for being called from Fortran that is based on VOGLE (from the
        The University of Melbourne) that is loosely based on the Silicon Graphics Iris GL library. It was also partly inspired by the DIGS library
        developed at the U.S. Naval Academy under the guidance of Prof David Rogers.</p>
        <p>Many output devices are available:</p>
        <blockquote>
          <table cellpadding="3">
            <!-- tsb: Many output devices are available:
 -->
            <tr valign="top">
              <td width="3%">o</td>
              <td>FrameMaker MIF 3.0 (Maker Interchange File) driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>Adobe PDF driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>HTML5 Canvas driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>SVG driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>A PCL5/HPGL2 driver that supports <b>prefsize</b>() calls.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>Monochrome PBM (Poskanzer bitmap P1 and P4 formats) and X11 bitmap driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>Color PBM (Poskanzer pixmap P3 and P6 formats). If you have the pbmplus package you can use it to make M_draw appear to write any format
              pbmplus writes (assuming your system supports the <b>popen</b>(3c) function).</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>A clear-text CGM (Computer Graphics Metafile) driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>A different (color) PostScript driver.</td>
            </tr>
            <tr valign="top">
              <td width="3%">o</td>
              <td>A driver for Microsoft VML (Vector Markup Language)</td>
            </tr>
          </table>
        </blockquote>
        <p>M_draw is intended to produce simple graphics composed of line drawings and polygon fills in two and three dimensions. It handles circles,
        curves, arcs, patches, polygons, and software text in a device independent fashion. Simple hidden line removal is also available via polygon
        backfacing. Access to hardware text and double buffering of drawings depends on the driver.</p>
        <p>M_draw is is callable from C and Fortran; but M_draw is only supported in Fortran (the C components are being
        converted to Fortran).</p>
        <p>The original VOGLE source's ownership statement</p>
        <pre>
      This software is public domain and may be used for any purpose commercial
      or otherwise. It is offered without any guarantee as to its suitability
      for any purpose or as to the sanity of its writers. The authors do ask
      that the source is passed on to anyone that requests a copy, and that
      people who get copies don't go round claiming they wrote it. Use at your
      own risk.
<br />
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">LIBRARY FUNCTION DESCRIPTIONS</a></h3><a name=""></a>
      <h4><a name="">DEVICE ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>vinit</b>(device)</td>
            <td>Initialise device</td>
          </tr>
          <tr valign="top">
            <td width="6%" nowrap="nowrap"><b>vexit</b>()</td>
            <td valign="bottom">Reset window/terminal (must be last routine called)</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>voutput</b>(path)</td>
            <td>Redirect output from *next* vinit to file</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>vnewdev</b>(device)</td>
            <td>Reinitialize to use new device without changing</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>vgetdev</b>(device)</td>
            <td>Get name of current device</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>pushdev</b>(device)</td>
            <td>push current device onto a stack</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>popdev</b>(device)</td>
            <td>pop device from stack created by pushdev.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getdepth</b>()</td>
            <td>Return number of bit planes (color planes)</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">ROUTINES FOR SETTING UP WINDOWS</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>prefposition</b>(x, y)</td>
            <td>Specify preferred position of window</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>prefsize</b>(width, height)</td>
            <td>Specify preferred width and height of window</td>
          </tr>
        </table>Some devices are basically window oriented - like sunview and X11. You can give M_draw some information on the window that it will use with
        these routines. These can make your code very device independent. Both routines take arguments which are in device space. (0, 0) is the top left
        hand corner in device space. To have any effect these routines must be called before vinit. For the X11 device, an entry may be made in your
        .Xdefaults file or loaded in with the <b>xrdb</b>(1) command:
        <pre>
      xrdb &lt;&lt;\end_of_file
      ! X11 Windows fonts to use for "small" and "large" fonts
      M_draw*smallfont: fixed
      M_draw*largefont: 9x15
      ! title on decoration bar for the window
      M_draw*title: My M_draw program
      ! window geometry and position,
      ! overridden by prefsize(3c) and prefposition(3c)
      M_draw.Geometry: =500x500-10+20
      end_of_file
<br />
</pre>(where you specify your geometry as you please).
      </blockquote><a name=""></a>
      <h4><a name="">CLIPPING ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>clipping</b>(onoff)</td>
            <td>Turn clipping on or off</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">COLOR ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="6%" nowrap="nowrap"><b>clear</b>()</td>
            <td valign="bottom">Clears screen to current color</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>color</b>(col)</td>
            <td>Set current color <b>mapcolor</b>(indx, red, green, blue) Set color map index</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">INTERACTIVE ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>getkey</b>()</td>
            <td>Return ASCII ordinal of next key typed</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>checkkey</b>()</td>
            <td>Returns zero if no key is pressed or ASCII ordinal</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getstring</b>(bcol, string)</td>
            <td>Read in a string, echoing it in current font</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>locator</b>(xaddr, yaddr)</td>
            <td>Find out where cursor is</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>slocator</b>(xaddr, yaddr)</td>
            <td>Find out where cursor is in screen coordinates</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">FLUSHING</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>vsetflush</b>(yesno)</td>
            <td>Set global flushing status</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>vflush</b>()</td>
            <td>Call device flush or syncronisation routine</td>
          </tr>
          <tr>
            <td colspan="2">On some devices (particularly X11) considerable speedups in display can be achieved by not flushing each graphics primitive call
            to the actual display until necessary. M_draw automatically delays flushing in the following cases:</td>
          </tr>
          <tr>
            <td width="6%"></td>
            <td>
              <table width="100%" cellpadding="3">
                <tr valign="top">
                  <td width="3%">o</td>
                  <td>Within a <b>callobj</b>() call.</td>
                </tr>
                <tr valign="top">
                  <td width="3%">o</td>
                  <td>Within curves and patches.</td>
                </tr>
                <tr valign="top">
                  <td width="3%">o</td>
                  <td>Within Hershey software text.</td>
                </tr>
                <tr valign="top">
                  <td width="3%">o</td>
                  <td>When double buffering (the flush is only done within swapbuffers).</td>
                </tr>
              </table><!-- .PP -->
            </td>
          </tr>
        </table>There are two user routines that can be used to control flushing.
      </blockquote><a name=""></a>
      <h4><a name="">VIEWPORT ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>viewport</b>(left, right, bottom, top)</td>
            <td>Specify which part of screen to draw in</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>pushviewport</b>()</td>
            <td>Save current viewport</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>popviewport</b>()</td>
            <td>Retrieve last viewport</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getviewport</b>(left, right, bottom,top)</td>
            <td>Returns limits of current viewport in screen coordinates</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>expandviewport</b>()</td>
            <td>use the entire device viewport</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>unexpandviewport</b>()</td>
            <td>undo <b>expandviewport</b>(3f)</td>
          </tr>
        </table>
      </blockquote>
      <blockquote>
        Viewpoint routines alter the current transformation matrix.
      </blockquote><a name=""></a>
      <h4><a name="">GETTING THE ASPECT DETAILS</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>getaspect</b>()</td>
            <td>Returns the ratio height over width of the display device.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getfactors</b>(wfact, hfact)</td>
            <td>Returns width over <b>min</b>(width of device, height of device) and height over <b>min</b>(width of device, height of device).</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getdisplaysize</b>(w, h)</td>
            <td>Returns width and height of device in device units</td>
          </tr>
        </table>
      </blockquote>
      <blockquote>
        Often the screen is not perfectly square and it would be nice to use the extra space without having to turn clipping off. The following routines are
        provided to get the values needed to adjust the calls to viewport, etc as needed.
      </blockquote><a name=""></a>
      <h4><a name="">ATTRIBUTE STACK ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>pushattributes</b>()</td>
            <td>Save the current attributes on the attribute stack.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>popattributes</b>()</td>
            <td>Restore attributes to what they were at last <b>pushattributes</b>().</td>
          </tr>
        </table>
      </blockquote>
      <blockquote>
        The attribute stack contains details such as current color, filling, hatching, centered, fixedwidth, text height, text width, and the current font.
        If you need to prevent object calls from changing these, use pushattributes before the call and popattributes after.
      </blockquote><a name=""></a>
      <h4><a name="">PROJECTION ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>ortho</b>(left, right, bottom, top,near,far)</td>
            <td>Define x,y,z clipping planes.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>ortho2</b>(left, right, bottom, top)</td>
            <td>Define x and y clipping planes.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>perspective</b>(fov, aspect, near, far)</td>
            <td>Specify perspective viewing pyramid</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>window</b>(left, right, bot, top, near,far)</td>
            <td>Specify a perspective viewing pyramid</td>
          </tr>
        </table>
      </blockquote>
      <blockquote>
        All the projection routines define a new transformation matrix, and consequently the world units. Parallel projections are defined by ortho or
        ortho2. Perspective projections can be defined by perspective and window.
      </blockquote><a name=""></a>
      <h4><a name="">MATRIX STACK ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>pushmatrix</b>()</td>
            <td>Save the current transformation matrix on the matrix stack.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>popmatrix</b>()</td>
            <td>Reinstall the last matrix pushed</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">VIEWPOINT ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>polarview</b>(dist, azim, inc, twist)</td>
            <td>Specify the viewer's position in polar coordinates</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>up</b>(x, y, z)</td>
            <td>Specify the world up.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>lookat</b>(vx, vy, vz, px, py, pz,twist)</td>
            <td>Specify the viewer's position</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">MOVE ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>move</b>(x, y, z)</td>
            <td>Move current graphics position to (x, y, z)</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rmove</b>(deltax, deltay, deltaz)</td>
            <td>Relative move</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>move2</b>(x, y)</td>
            <td>Move graphics position to point (x, y)</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rmove2</b>(deltax, deltay)</td>
            <td>Relative move in world units.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>smove2</b>(x, y)</td>
            <td>Move current graphics position in screen coordinates (<b>-1.0</b> to 1.0).</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rsmove2</b>(deltax, deltay)</td>
            <td>Relative move in screen units (<b>-1.0</b> to 1.0).</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">LINESTYLE ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>linewidth</b>()</td>
            <td>set line width in rasters</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>dashcode</b>()</td>
            <td>set dash pattern length</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>linestyle</b>()</td>
            <td>set the line dash pattern</td>
          </tr>
        </table>Linestyles are specified by giving a nominal length of a single dash and a character string consisting of 1's and 0's (zeros) that specify
        when to draw a dash and when not to draw a dash. Linestyles will follow curves and "go around" corners. If a linestyle is set or reset, the
        accumulated information as to where on a curve (or line) a dash is to be draw is also reset.
        <p>For EXAMPLE, with a nominal view of <b>-1</b> to 1, setting the dash length to 0.5, and the linestyle to '11010' would draw a <b>line</b>(or
        curve) with a 1.0 unit solid part, followed by a 0.5 unit blank part followed by a 0.5 unit solid part followed by a 0.5 unit blank part. The
        linestyle would then repeat itself.</p>
        <p>The dash sizes are affected by the current viewport/transformation scaling factors, meaning that in perspective, the dashes look smaller the
        farther away they are.</p>
      </blockquote><a name=""></a>
      <h4><a name="">DRAW ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>draw</b>(x, y, z)</td>
            <td>Draw from current graphics position to (x, y, z)</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rdraw</b>(deltax, deltay, deltaz)</td>
            <td>Relative draw</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>draw2</b>(x, y)</td>
            <td>Draw from current graphics position to point (x, y)</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rdraw2</b>(deltax,deltay)</td>
            <td>Relative draw</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>sdraw2</b>(x, y)</td>
            <td>Draw in screen coordinates (<b>-1.0</b> to 1.0).</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rsdraw2</b>(deltax, deltay)</td>
            <td>Relative draw in screen units (<b>-1.0</b> to 1.0).</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">ARCS AND CIRCLES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>circleprecision</b>(nsegs)</td>
            <td>Set number of line segments in a circle. Default is 32.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>arc</b>(x, y, radius, startang, endang)</td>
            <td>Draw an arc in world units.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>sector</b>(x, y, radius, startang,endang)</td>
            <td>Draw a sector. Note: sectors are polygons.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>circle</b>(x, y, radius)</td>
            <td>Draw a circle. Note: circles are polygons.</td>
          </tr>
        </table>When creating arcs and sectors note that angles are measured in degrees; where <b>zero</b>(0) is the positive X axis in a right-handed
        Cartesian coordinate system and positive angles sweep counterclockwise. If filling sectors or circles (As described in the section on polygons)
        hatch pitch is measured in world coordinates and is initially set to 0.1. The initial hatch angle is <b>zero</b>(0).
      </blockquote><a name=""></a>
      <h4><a name="">CURVE ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>curvebasis</b>(basis)</td>
            <td>Define a basis matrix for a curve.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>curveprecision</b>(nsegs)</td>
            <td>Define number of line segments used to draw a curve.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rcurve</b>(geom)</td>
            <td>Draw a rational curve.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>curve</b>(geom)</td>
            <td>Draw a curve.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>curven</b>(n, geom)</td>
            <td>Draw n - 3 overlapping curve segments. Note: n must be at least 4.</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">RECTANGLES AND GENERAL POLYGON ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>rect</b>(x1, y1, x2, y2)</td>
            <td>Draw a rectangle.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>polyfill</b>(onoff)</td>
            <td>Set the polygon fill flag</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>polyhatch</b>(onoff)</td>
            <td>Set the polygon hatch flag</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>hatchang</b>(angle)</td>
            <td>Set the angle of the hatch lines.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>hatchpitch</b>(pitch)</td>
            <td>Set the distance between hatch lines.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>poly2</b>(n, points)</td>
            <td>Construct an (x, y) polygon from an array of points</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>poly</b>(n, points)</td>
            <td>Construct a polygon from an array of points</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>makepoly</b>()</td>
            <td>opens polygon constructed by a series of move-draws and closed by closepoly</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>closepoly</b>()</td>
            <td>Terminates a polygon opened by makepoly.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>backface</b>(onoff)</td>
            <td>Turns on culling of backfacing polygons.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>backfacedir</b>(clockwise)</td>
            <td>Sets backfacing direction to clockwise or anti-clockwise</td>
          </tr>
          <tr>
            <td colspan="2">A polygon is composed of a number of coplanar line segments connected end to end to form a closed shape.</td>
          </tr>
          <tr>
            <td colspan="2">In M_draw curves are estimated by a series of line segments, and thus may be included easily into polygons.</td>
          </tr>
          <tr valign="top">
            <td class="c2" colspan="1">Regular</td>
            <td>A polygon with all sides and interior angles the same. Regular polygons are always convex. See Regular Polygons</td>
          </tr>
          <tr valign="top">
            <td class="c2" colspan="1">Irregular</td>
            <td>Each side may a different length, each angle may be a different measure. The opposite of a regular polygon. See Irregular Polygons</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">Convex</td>
            <td valign="bottom">All interior angles less than 180 ,and all vertices 'point outwards' away from the interior. The opposite of concave.
            Regular polygons are always convex. See Convex Polygons</td>
          </tr>
          <tr valign="top">
            <td class="c2" colspan="1">Concave</td>
            <td>One or more interior angles greater than 180 . Some vertices push 'inwards' towards the interior of the polygon. The opposite of
            convex.</td>
          </tr>
          <tr valign="top">
            <td class="c2" colspan="1">Self-intersecting or Crossed</td>
            <td>A polygon where one or more sides crosses back over another side, creating multiple smaller polygons. Most of the properties and theorems
            concerning polygons do not apply to this shape. It is best considered as several separate polygons. A polygon that in not self-intersecting in
            this way is called a simple polygon.</td>
          </tr>
        </table>
      </blockquote>
      <p><a name=""></a></p>
      <h4><a name="">TEXT ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>font</b>(fontname)</td>
            <td>set the current font</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>numchars</b>()</td>
            <td>return number of characters in the current SOFTWARE font.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>textsize</b>(width, height)</td>
            <td>set maximum size of a character in the current SOFTWARE font.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>textang</b>(ang)</td>
            <td>set the SOFTWARE text angle.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>fixedwidth</b>(onoff)</td>
            <td>turns fixedwidth mode on or off for SOFTWARE fonts.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getcharsize</b>(c, width, height)</td>
            <td>get the width and height of a character.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getfontdec</b>()</td>
            <td>return size of maximum font descender</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getfontsize</b>(width, height)</td>
            <td>get maximum width and height of a character in a font.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>drawchar</b>(c)</td>
            <td>draw the character c and update current position.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>drawstr</b>(str)</td>
            <td>draw the text in string at the current position.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>strlength</b>(str)</td>
            <td>return the length of the string s</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>boxtext</b>(x, y, l, h, s)</td>
            <td>stretch and draw the SOFTWARE string s so that it fits in the imaginary box</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>boxfit</b>(x, y, l, h, s)</td>
            <td>resize the SOFTWARE text size so it fits in a box</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>textjustify</b>(val)</td>
            <td>general text justification</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>leftjustify</b>()</td>
            <td>left justify text</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rightjustify</b>()</td>
            <td>right justify text</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>topjustify</b>()</td>
            <td>top justify text</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>bottomjustify</b>()</td>
            <td>bottom justify text</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>centertext</b>(onoff)</td>
            <td>turns centertext mode on or off for SOFTWARE fonts.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>xcentertext</b>()</td>
            <td>center text in the X direction</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>ycentertext</b>()</td>
            <td>center text in the Y direction</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>textslant</b>()</td>
            <td>defines the obliqueness of the fonts.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>textweight</b>()</td>
            <td>defines the weight of the fonts.</td>
          </tr>
        </table>M_draw supports hardware and software fonts. The software fonts are based on the character set digitized by Dr Allen V. Hershey while
        working at the U. S. National Bureau of Standards. Exactly what hardware fonts are supported depends on the device, but it is guaranteed that the
        names "large" and "small" will result in something readable. For X11 displays the default large and small fonts used by the program can be
        overridden by placing the following defaults in the ~/.Xdefaults file:
        <pre>
     draw.smallfont: X11-font-name
     draw.largefont: X11-font-name
<br />
</pre>It is noted here that hardware text is always assumed to be drawn parallel to the (x, y) plane, using whatever the current z coordinate is. The
following software fonts are supported:
        <pre>
      astrology       cursive         cyrillic        futura.l
      futura.m        gothic.eng      gothic.ger      gothic.ita
      greek           markers         math.low        math.upp
      meteorology     music           script          symbolic
      times.g         times.i         times.ib        times.r
      times.rb        japanese
<br />
</pre>A markers font "markers" is also provided for doing markers - you need to have centertext mode on for this to give sensible results when placing the
markers.
        <p>If the environment variable "M_DRAW_FONTPATH" is set M_draw looks for the software fonts in the directory given by this value.</p>
        <p>the default font is futura.l</p>
      </blockquote><a name=""></a>
      <h4><a name="">TRANSFORMATION ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>translate</b>(x, y, z)</td>
            <td>Set up a translation.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>scale</b>(x, y, z)</td>
            <td>Set up scaling factors in x, y, and z axis.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rotate</b>(angle, axis)</td>
            <td>Set up a rotation in axis axis where axis is one of 'x','y', or 'z'.</td>
          </tr>
        </table>All transformations are cumulative, so if you rotate something and then do a translate you are translating relative to the rotated axes. If
        you need to preserve the current transformation matrix use <b>pushmatrix</b>(), do the drawing, and then call <b>popmatrix</b>() to get back where
        you were before.
        <p>When doing transformations, ensure your objects remain in the viewing volume or they will be clipped. See routines such as <b>ortho</b>(3) for
        more information.</p>
      </blockquote><a name=""></a>
      <h4><a name="">PATCH ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>patchbasis</b>(tbasis, ubasis)</td>
            <td>Define the t and u basis matrices of a patch.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>patchprecision</b>(tseg, useg)</td>
            <td>Set minimum number of line segments making up curves in a patch.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>patchcurves</b>(nt, nu)</td>
            <td>Set the number of curves making up a patch.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>rpatch</b>(gx, gy, gz, gw)</td>
            <td>Draws a rational patch in the current basis, according to the geometry matrices gx, gy, gz, and gw.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>patch</b>(gx, gy, gz)</td>
            <td>Draws a patch in the current basis, according to the geometry matrices gx, gy, and gz.</td>
          </tr>
        </table>
      </blockquote><a name=""></a>
      <h4><a name="">POINT ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>point</b>(x, y, z)</td>
            <td>Draw a point at x, y, z</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>point2</b>(x, y)</td>
            <td>Draw a point at x, y.</td>
          </tr>
        </table>points are drawn with the current color and linewidth. Points are currently device-specific and may appear as circles, squares, or not at
        all; as they are generated by a zero-length vector using the hardware line style.
      </blockquote><a name=""></a>
      <h4><a name="">OBJECT ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>makeobj</b>(n)</td>
            <td>Commence the object number n.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>closeobj</b>()</td>
            <td>Close the current object.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>genobj</b>()</td>
            <td>Returns a unique object identifier.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getopenobj</b>()</td>
            <td>Return the number of the current object.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>callobj</b>(n)</td>
            <td>Draw object number n.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>isobj</b>(n)</td>
            <td>Returns non-zero if there is an object of number n.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>delobj</b>(n)</td>
            <td>Delete the object number n.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>loadobj</b>(n, filename)</td>
            <td>Load the object in the file filename as object number n.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>saveobj</b>(n, filename)</td>
            <td>Save object number n into file filename. Does NOT save objects called inside object n.</td>
          </tr>
        </table>Objects are graphical entities created by the drawing routines called between makeobj and closeobj. Objects may be called from within other
        objects. When an object is created most of the calculations required by the drawing routines called within it are done up to where the calculations
        involve the current transformation matrix. So if you need to draw the same thing several times on the screen but in different places it is faster to
        use objects than to call the appropriate drawing routines each time. Objects also have the advantage of being savable to a file, from where they can
        be reloaded for later reuse. Routines which draw or move in screen coordinates, or change device, cannot be included in objects.
      </blockquote><a name=""></a>
      <h4><a name="">DOUBLE BUFFERING</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>backbuffer</b>()</td>
            <td>Draw in the backbuffer. Returns <b>-1</b> if the device is not up to it.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>frontbuffer</b>()</td>
            <td>Draw in the front buffer. This will always work.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>swapbuffers</b>()</td>
            <td>Swap the front and back buffers.</td>
          </tr>
        </table>Where possible M_draw allows for front and back buffers to enable things like animation and smooth updating of the screen. The routine
        backbuffer is used to initialise double buffering.
      </blockquote><a name=""></a>
      <h4><a name="">POSITION ROUTINES</a></h4>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td colspan="1"><b>getgp</b>(x, y, z)</td>
            <td>Gets the current graphics position</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getgpt</b>(x, y, z, w)</td>
            <td>Gets the current transformed graphics position in world coords.</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>getgp2</b>(x, y)</td>
            <td>Gets the current graphics position</td>
          </tr>
          <tr valign="top">
            <td colspan="1"><b>sgetgp2</b>(x, y)</td>
            <td>Gets the current screen graphics position in screen coords (<b>-1</b> to 1)</td>
          </tr>
        </table>
      </blockquote><a name="3"></a>
      <h3><a name="3">EXAMPLE</a></h3>
      <blockquote>
        Sample program:
        <pre>
   program demo_M_draw
   use M_draw
   use M_draw,    only  : D_BLACK,   D_WHITE
   use M_draw,    only  : D_RED,     D_GREEN,    D_BLUE
   use M_draw,    only  : D_YELLOW,  D_MAGENTA,  D_CYAN
   use M_units,    only : cosd, sind
   implicit none
   integer  :: ipaws
   real     :: x1, y1
   integer  :: icolor
   integer  :: i,j
<br />      ! initialize image
      call prefsize(400,400)  ! set size before starting
      call vinit(' ')         ! start graphics using device $M_DRAW_DEVICEDEVICE
      call textsize(10.0,10.0)
      call mapcolor( 0,   255,255,255 )  !white
      call mapcolor( 1,   255,  0,  0 )  !red
      call mapcolor( 2,     0,255,  0 )  !green
      call mapcolor( 3,   255,255,  0 )  !yellow
      call mapcolor( 4,     0,  0,255 )  !blue
      call mapcolor( 5,   255,  0,255 )  !magenta
      call mapcolor( 6,     0,255,255 )  !cyan
      call mapcolor( 7,     0,  0,  0 )  !black
      call mapcolor( 8,     0,155,  0 )
      call mapcolor( 9,   155,155,155 )
      call mapcolor(10,   155,255,255 )
      call mapcolor(11,   155,155,  0 )
      call mapcolor(12,     0,  0,155 )
      call mapcolor(13,   155,  0,155 )
      call mapcolor(14,     0,155,155 )
      call mapcolor(15,   100,100,100 )
      call mapcolor(16,   155,100,100 )
      call color(D_BLACK)
      call clear()            ! clear to color 0
      call color(D_WHITE)
<br />      ! map area of virtual world to specified device area
      ! notice Y-axis for viewport is zero at TOP
      ! define the virtual world area we want to work in
      call page(0.0,  400.0,    0.0, 400.0)
      ! the drawing routines use these world units
<br />      ! put some colored boxes into pixmap by address
      ! so show how the pixel map can be edited easily with
      ! other routines that can manipulate a pixel array.
      ! The P_pixel array was created when vinit(3f) was called
      call polyfill(.true.)
      icolor=1
      do i=0,3
         do j=0,3
            x1=j*100.0
            y1=i*100.0
            icolor=icolor+1
            call color(icolor)
            call rect(x1,y1,x1+100.0,y1+100.0)
         enddo
      enddo
      call polyfill(.false.)
<br />      ! draw polar grids
      call linewidth(100)
<br />      call linewidth(100)
      call color(14)
      call target(200.0,200.0,200.0)
<br />      call linewidth(75)
      call color(0)
      call target(100.0,200.0,50.0)
<br />      ! draw some lines
      call color(D_RED)
      call linewidth(200)
      call line(1.0,1.0,400.0,400.0)
<br />      call color(D_BLUE)
      call linewidth(250)
      call line(350.0,200.0,350.0,300.0)
<br />      ! print some text
      call color(1)
      call linewidth(125)
      call font('futura.l')
      call hershey(40.0, 40.0,35.0,'Hello World',0.0)
      call color(7)
      call linewidth(25)
      call hershey(40.0, 80.0,35.0,'Hello World',0.0)
      call linewidth(100)
      call hershey(40.0,120.0,35.0,'Hello World',30.0)
<br />      call hershey(  40.0,350.0,35.0,'Hello World',0.0)
      call font('futura.m')
      call hershey(  40.0,310.0,35.0,'Hello World',0.0)
      call font('times.r')
      call hershey( 350.0,400.0,35.0,'Hello World',90.0)
      call linewidth(50)
      call font('times.i')
      call hershey(200.0,120.0,15.0,'Hello World',20.0)
<br />      ipaws=getkey()
      call vexit()
<br />      contains
<br />      subroutine target(xc,yc,rc)
      use M_units,    only : cosd, sind
      real     :: xc,yc,rc
      integer  :: i
      real     :: x,y
         do i=0,360,10
            x=rc*cosd(i)
            y=rc*sind(i)
            call line(xc,yc,xc+x,yc+y)
         enddo
         do i=1,int(rc),10
            call circle(xc,yc,real(i))
         enddo
      end subroutine target
<br />      subroutine line(x1,y1,x2,y2)
      real,intent(in) :: x1,y1,x2,y2
      call move2(x1,y1)
      call draw2(x2,y2)
      end subroutine line
<br />      subroutine hershey(x,y,height,itext,theta)
      real,intent(in)               :: x,y
      real,intent(in)               :: height
      character(len=*),intent(in)   :: itext
      real,intent(in)               :: theta
      call move2(x,y)
      call textang(theta)
      call textsize(height,height)
      call drawstr(itext)
      end subroutine hershey
   end program demo_M_draw
<br />
</pre>
      </blockquote><a name="4"></a>
      <h3><a name="4">BUGS</a></h3>
      <blockquote>
        <p>Polygon hatching will give unexpected results unless the polygon is initially defined in the X-Y plane.</p>
        <p>Double buffering isn't supported on all devices.</p>
        <p>We don't recommend the use of the smove/sdraw routines.</p>
        <p>The yobbarays may be turned on or they may be turned off.</p>
        <p>When creating an object, current position and text size are not actually changed so almost any query routine to get position or font size or
        whatever will not work properly.</p>
        <p>If call <b>vexit</b>(3f) and then call <b>vinit</b>(3f) everything should probably be reset to initial values at program startup, such as
        linewidth, current font, and color. It is currently left up to the output device initialization routine. It should not be. To minimize the issue,
        call all the push* routines after a <b>vinit</b>(3f) and call all the pop* routines before <b>vexit</b>(3f).</p>
        <p>Exactly what attributes should and should not be reset with a <b>vnewdev</b>(3f) is questionable.</p>
      </blockquote>
      <hr />
      <br />
      <div class="c1"><img src="../images/M_draw.3m_draw.gif" /></div>
    </div>
  </div>
</body>
