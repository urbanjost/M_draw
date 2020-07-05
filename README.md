# NAME
![sample](images/M_draw.gif)
## M_draw - low level vector graphics library

## DESCRIPTION
This is the base graphics library intended for use with Fortran
although largely written in C. It is based on the public domain
VOGLE graphics library. It allows for creating vector-based 
graphics with a variety of output devices.

## BUILDING THE MODULES
     git clone https://github.com/urbanjost/M_draw.git
     cd M_draw/src
     # change Makefile if not using gfortran(1)
     make

This will compile the Fortran module and C code  and basic example
programs that exercise the routines.

## RUNNING AN EXAMPLE
Before running the example programs you must specify the location
of the font definition files. For example:

     # where M_draw is assumed to located
     cd ~github/M_draw
     # the hershey directory can be moved, and typically
     # is in /usr/share/hershey on GNU/Linux platforms
     export M_DRAW_FONTPATH=`pwd`/src/hershey
     export M_DRAW_DEVICE='X11 640 480'
     # run an example program
     src/PROGRAMS/fballs

## USER DOCUMENTATION
   - a simple [index](https://urbanjost.github.io/M_draw/) to
     the individual manpages in HTML form

   - A single page that uses javascript to combine all the HTML
     descriptions of the manpages is at 
     [BOOK_M_draw](https://urbanjost.github.io/M_draw/BOOK_M_draw.html).

   - Or all the HTML appended together is in 
     [M_draw](https://urbanjost.github.io/M_draw/M_draw.html)

## ADDITIONAL DIRECTORY DESCRIPTIONS
There are 
    - manpages in the man/man3 directory 
    - HTML documentation in the docs/ directory.
    - demo programs extracted from the man pages in the demos/ directory

## UNIT TESTS
There are no automated unit tests per-se. Running the example programs
and demo programs ensures the library is functioning.
