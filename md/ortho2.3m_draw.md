<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c226">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>ortho2(3f)</b> - [M_draw:PROJECTION] define the area of the virtual world coordinates to map to the viewport <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="3">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>ortho2</b>(<i>left</i>, <i>right</i>, <i>bottom</i>, <i>top</i>)
<b>real,intent</b>(<i>in</i>) :: <i>left</i>, <i>right</i>, <i>bottom</i>, <i>top</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Defines the section of the virtual world coordinates to map to the viewport. That is, Define x (<i>left</i>, <i>right</i>), and y (<i>bottom</i>,
        <i>top</i>) clipping planes.</p>
        <p>All the projection routines define a new transformation matrix, and consequently the world units. Parallel projections are defined by ortho2.</p>
      </blockquote>
      <hr />
      <br />
      <div class="c226"><img src="../images/ortho2.3m_draw.gif" /></div>
    </div>
  </div>
</body>
