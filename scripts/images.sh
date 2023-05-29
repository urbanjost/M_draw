for NAME in arc backface bottomjustify boxtext callobj centertext checkkey circle circleprecision clear color curve dashcode draw2 drawchar drawstr expandviewport fixedwidth font getgp2 getkey getstring hatchang hatchpitch invokeobj isobj leftjustify linestyle linewidth loadobj locator lookat makepoly mapcolor M_draw move2 page patch perspective point2 point poly2 poly polyfill polyhatch prefposition prefsize print rdraw2 rect rightjustify rmove2 rotate saveobj scale sector slocator strlength textang textjustify textsize textslant textweight topjustify translate unexpandviewport vexit viewport vinit voutput window xcentertext ycentertext
do
if [ -r ../docs/images/$NAME.gif ]
then
   (
      echo FOUND
      ls -ld ../docs/images/$NAME.gif
   )|xargs
else
   echo $NAME not present
   runpbm demo_$NAME
fi
done
