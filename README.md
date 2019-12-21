# M_draw
## low level graphics library

This is the base graphics library intended for use with Fortran
although largely written in C. It is based on the public domain
VOGLE graphics library. It allows for creating vector-based 
graphics with a variety of output devices.

Before running the example programs you must specify the location
of the font definition files. For example:

   ># where /M_draw is located
   >TOP=/github
   ># the hershey directory can be moved, and typically
   ># is in /usr/share/hershey on GNU/Linux platforms
   >export M_DRAW_FONTPATH=$TOP/M_draw/src/hershey
   >export M_DRAW_DEVICEDEVICE='X11 640 480'
   ># run an example program
   >src/PROGRAMS/fballs

