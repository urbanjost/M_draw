<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c168">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>getviewport(3f)</b> - [M_draw:VIEWPORT] Returns limits of current viewport in screen coordinates <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="4">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>getviewport</b>(<i>left</i>, <i>right</i>, <i>bottom</i>, <i>top</i>)
<b>real,intent</b>(<i>out</i>) :: <i>left</i>
<b>real,intent</b>(<i>out</i>) :: <i>right</i>
<b>real,intent</b>(<i>out</i>) :: <i>bottom</i>
<b>real,intent</b>(<i>out</i>) :: <i>top</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        <p>Returns the <i>left</i>, <i>right</i>, <i>bottom</i> and <i>top</i> limits of the current viewport in screen coordinates (<b>-1.0</b> to
        1.0).</p>
        <pre>
   If a device has been declared to be real :: array(600,400)
<br />        o-----&gt; X                         (right=600,top=0)
        | #------------------------------------#
        | |                                    |
        | |                                    |
        V |                                    |
        Y |                                    |
          #------------------------------------#
</pre>(<i>left</i>=0,<i>bottom</i>=400)
      </blockquote><a name="3"></a>
      <h3><a name="3">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c169" width="6%" nowrap="nowrap">LEFT</td>
            <td valign="bottom">value for <i>left</i> side</td>
          </tr>
          <tr valign="top">
            <td class="c169" width="6%" nowrap="nowrap">RIGHT</td>
            <td valign="bottom">value for <i>right</i> side</td>
          </tr>
          <tr valign="top">
            <td class="c169" width="6%" nowrap="nowrap">BOTTOM</td>
            <td valign="bottom">value for <i>bottom</i> side</td>
          </tr>
          <tr valign="top">
            <td class="c169" width="6%" nowrap="nowrap">TOP</td>
            <td valign="bottom">value for <i>top</i> side</td>
          </tr>
        </table>
      </blockquote>
      <hr />
      <br />
      <div class="c168"><img src="../images/getviewport.3m_draw.gif" /></div>
    </div>
  </div>
</body>
