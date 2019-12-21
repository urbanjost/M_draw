<?
<body>
  <a name="top" id="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c300">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>pushdev(3f)</b> - [M_draw:DEVICE] push current device onto a stack <b></b>
      </blockquote><a name="contents" id="contents"></a>
      <h3><a name="3">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
subroutine <b>pushdev</b>(<i>device</i>)
character *(*) <i>device</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Initialize a new <i>device</i> without changing attributes, viewport etc, but save the previously initialised <i>device</i> on a stack.
        <p>Note, this is intended to completely change the <i>device</i>, it will not work if you <b>pushdev</b>() the same <i>device</i> that you are
        already running. (This will be fixed at a later date).</p>
      </blockquote>
      <hr />
      <br />
      <div class="c300"><img src="../images/pushdev.3m_draw.gif" /></div>
    </div>
  </div>
</body>
