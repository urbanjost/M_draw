#@(#) make(1) rules for maintaining a FORTRAN90/C library. Makefile started by makeout(1) 2019-12-21 20:55:08

# name of library to build of the form lib$NAME.a
LIBNAME=M_draw
# directory to place output files in
INSTALL=./lib/
LIBRARY=$(INSTALL)lib$(LIBNAME).a

# platform-specific values you will probably change
LIBS := -Llib -lM_draw -lX11 
CC := cc
CFLAGS := -O
FC := gfortran
FFLAGS := -O -J $(INSTALL)
LDFLAGS := -I $(INSTALL)
AR=ar
ARFLAGS=rU
RANLIB=ranlib

PROGFILES = $(wildcard ../PROGRAMS/DEMOS/*.f90) $(wildcard ../PROGRAMS/EXAMPLES/*.f90)
CPROGFILES = ../PROGRAMS/MAKE_HERSHEY/h2v.c

PROG = ${PROGFILES:.f90=}
CPROG = ${CPROGFILES:.c=}

SRCS = $(wildcard ./*.f90) $(wildcard ./*.c ) $(wildcard ./*.h )
# create a list of corresponding object files
COBJS_FILES = $(wildcard ./*.c )
FOBJS_FILES = $(wildcard ./*.f90 )
OBJS = $(patsubst %.c,%.o,$(COBJS_FILES)) $(patsubst %.f90,%.o,$(FOBJS_FILES))
LIBOBJS = $(patsubst %.f90,$(LIBRARY)(%.o),$(SRCS)) $(patsubst %.c,$(LIBRARY)(%.o),$(SRCS))

# set the '.RECIPEPREFIX' variable to an alternate character
.RECIPEPREFIX = >
#-------------------------------------------------------------------------------
# list what to run and then do any teardown. Do not leave this empty
all: directorysetup $(LIBRARY) $(CPROG) $(PROG)
>   bash hershey.sh
>   @echo "That's all Folks!"
#-------------------------------------------------------------------------------
# what to do before you start compiling
directorysetup:
>   @ echo "MAKING LIBRARY:   $(LIBRARY)" 
>   @ [ -d "$(INSTALL)" ] || \
>     (echo "making directory $(INSTALL)"; \
>     mkdir -p $(INSTALL))
#-------------------------------------------------------------------------------
# what to do after you have built the library
$(LIBRARY): $(LIBOBJS)
>   @ $(RANLIB) $(LIBRARY)
>   @ echo "TARGETS FOR $(LIBRARY) UP TO DATE"
#------------------------------------------------------------------------------
$(PROG): $(LIBRARY)
>   -$(FC) $(LDFLAGS) $@.f90 -o $@ $(LIBS)||echo "ouch: $@.f90 "
#$(PROG): $(OBJS)
#>   -$(FC) $(LDFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)||echo "ouch: $@.f90 "

$(OBJS): draw.h

# Need rule for M_draw.mod

.phony: clean
clean:
>   rm -f $(PROG) $(CPROG) $(OBJS) *.mod hershey/*
>   rm -f -i $(LIBRARY) $(INSTALL)/*.mod

.SUFFIXES: $(SUFFIXES) .f90 .F90 .c
#.f90.o:
#>   $(FC) $(FFLAGS) -c $<
#.F90.o:
#>   $(FC) $(FFLAGS) -c $<
.f90.a:
>   $(FC) -c $(FFLAGS) $< -o $%
>   @ $(AR) $(ARFLAGS) $(LIBRARY) $% 
>   @ $(AR) $(ARFLAGS) $(LIBRARY) $<  # optionally store the source code too
>   @ /bin/rm -f ${?F:.f90=.o} $%
.c.a:
>   $(CC) -c $(CFLAGS) $< -o $%
>   @ $(AR) $(ARFLAGS) $(LIBRARY) $% 
>   @ $(AR) $(ARFLAGS) $(LIBRARY) $<  # optionally store the source code too
>   @ /bin/rm -f ${?F:.c=.o} $%
