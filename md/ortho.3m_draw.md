<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c223">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>ortho(3f)</b> - [M_draw:PROJECTION] Define x,y,z clipping planes. <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="3">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>ortho</b>(<i>left</i>, <i>right</i>, <i>bottom</i>, <i>top</i>, <i>near_d</i>, <i>far_d</i>)
real <i>left</i>, <i>right</i>, <i>bottom</i>, <i>top</i>, <i>near_d</i>, <i>far_d</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Define x (<i>left</i>, <i>right</i>), y (<i>bottom</i>, <i>top</i>), and z (near, far) clipping planes. The near and far clipping planes are
        actually specified as distances along the line of sight. These distances can also be negative. The actual location of the clipping planes is z =
        -<i>near_d</i> and z = -<i>far_d</i>.</p>
      </blockquote>
      <hr />
      <br />
      <div class="c223"><img src="../images/ortho.3m_draw.gif" /></div>
    </div>
  </div>
</body>
