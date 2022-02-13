# NAME
![sample](images/M_draw.gif)
## M_draw - low level vector graphics library

## DESCRIPTION
This is a base graphics library intended for use with Fortran
although largely written in C. It is based on the public domain
VOGLE graphics library. It allows for creating vector-based 
graphics with a variety of output devices.

## DOWNLOAD and BUILD with make(1) ![gmake](docs/images/gnu.gif)
     git clone https://github.com/urbanjost/M_draw.git
     cd M_draw/src
     # change Makefile if not using one of the listed compilers
     
     # for gfortran
     make clean
     make F90=gfortran gfortran
     
     # for ifort
     make clean
     make F90=ifort ifort

     # for nvfortran
     make clean
     make F90=nvfortran nvfortran

This will compile the Fortran module and C code  and basic example
programs that exercise the routines.

## DOWNLOAD AND BUILD WITH fpm(1) ![fpm](docs/images/fpm_logo.gif)

Alternatively, download the github repository and build it with
fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )

```bash
     git clone https://github.com/urbanjost/M_draw.git
     cd M_draw
     fpm build
     fpm test  # run unit tests
```

or just list it as a dependency in your fpm.toml project file.

```toml
     [dependencies]
     M_draw        = { git = "https://github.com/urbanjost/M_draw.git" }
```

Note that M_draw.f90 is registered at the [fpm(1) registry](https://fortran-lang.org/packages/fpm)

## RUNNING AN EXAMPLE
Before running the example programs you must specify the location
of the font definition files and a default output device. For example:

     # assuming you are in M_draw/src ...
     export M_DRAW_FONTPATH=`pwd`/hershey
    #Specify a default output device and size
     export M_DRAW_DEVICE='X11 640 480'
     # run an example program
     PROGRAMS/EXAMPLES/fballs

While you are there, you might want to generate a text version of the
documentation as well:

    # show all manpages as text
    env MANWIDTH=80 MANPATH=../man man --regex '.*' |col -b|tee man.txt

## NOTES

The *.o files can be combined into a library file and the library
and module files can be placed in a convenient location for easier
loading.

The hershey/ directory typically is placed in /usr/share/hershey 
or /usr/local/lib on GNU/Linux platforms. Just remember to set
the environment variable M_DRAW_FONTPATH to the directory name.

The build assumes you have the X11 libraries, and does not include
the PC driver often used with Cygwin. 

It is relatively easy to remove a driver such as C-X11.c by going into
C-drivers.c and changing a line like "#define X11" to "#undef X11" and
removing C-X11.c from the Makefile. If anyone is interested about the
CygWin/PC driver let me know; but it is relatively easy to install X11
Windows with CygWin and installing X11 Windows allows you to use many
more CygWin utilities as well.

## DOCUMENTATION   ![docs](docs/images/docs.gif)
### USER 
   - [An overview in HTML](https://urbanjost.github.io/M_draw/M_draw.html)

   - a simple [index](https://urbanjost.github.io/M_draw/) to
     the individual manpages in HTML form

   - A single page that uses javascript to combine all the HTML
     descriptions of the manpages is at 
     [BOOK_M_draw](https://urbanjost.github.io/M_draw/BOOK_M_draw.html).

The overview is maintained manually and may be out of date but covers
the core routines (which are very stable). The other documentation
is auto-generated during a rebuild of this repository, and will
automatically have the latest routines.

## MANPAGES ![manpages](docs/images/manpages.gif) 
Literal man-pages for use on GNU/Linux, Unix and CygWin platforms:
  - [manpages.zip](https://urbanjost.github.io/M_draw/manpages.zip)
  - [manpages.tgz](https://urbanjost.github.io/M_draw/manpages.tgz)


## EXAMPLES AND UNIT TESTS
There are no automated unit tests per-se. Running the example programs
and demo programs ensures the library is functioning. Available 
programs include:

  - confidence tests in the test/ directory use basic programs and are
    a good resource for new users.
  - demo programs extracted from the man pages in the example/ directory

## FUTURE
There are higher-level routines based on this library not yet available
on github. Ultimately the hope is to release this as an fpm package
as described at [https://fortran-lang.org](https://fortran-lang.org)
and then to release the higher-level routines as separate distributions
on top of this.

This version is essentially C code based on the public-domain Vogle
graphics library but the intent is to convert it to a native Fortran
library, which it is very amenable to.

There are a number of programs already using this low-level library
to generate higher-level graphics:
                 ![sample](images/M_slices.gif)

---

 + [CHANGELOG](docs/CHANGELOG.md) provides a history of significant changes
 + [CI/CD BUILD STATUS](docs/STATUS.md)
