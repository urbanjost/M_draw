#@(#) make(1) rules for maintaining a FORTRAN90/C static library
INCLUDE_FLAGS = $(addprefix -I,$(INCLUDE_DIRS))
ifeq ($(notdir $(basename $(FC))),gfortran)
CC = $(subst gfortran,gcc,$(FC))
CFLAGS = $(subst -fbacktrace,,$(subst -fcheck-array-temporaries,,$(subst -Wimplicit-interface,,$(FFLAGS))))
endif
#-------------------------------------------------------------------------------
# configuration values
#
# name of library to build of the form lib$NAME.a
LIBNAME=M_draw
# directory to place output files in
INSTALL=$(BUILD_DIR)

# set up conditional programming environment macro definitions
FC=gfortran
AR=ar
ARFLAGS=rU
F90FLAGS =  -J $(INSTALL)
RANLIB=ranlib

# source files are assumed to be in subdirectories below where this makefile
# is placed and to end with the suffix .f90 or .F90. The output is assumed
# to be a library file and associated .mod files, which will be placed in
# the $(INSTALL) directory.

# find Fortran and C procedure sources. Note they are assumed to be in subdirectories.
# you can change it as required to find other sources, but this is usually
# a nice scheme

SRCS=$(wildcard src/*.f90) $(wildcard src/*.c)
#-------------------------------------------------------------------------------
# create a list of corresponding object files
LIBRARY=$(INSTALL)/lib$(LIBNAME).a
LIBOBJ_F90=$(patsubst %.f90,$(LIBRARY)(%.o),$(SRCS))
LIBOBJ_C=$(patsubst %.c,$(LIBRARY)(%.o),$(SRCS))
#-------------------------------------------------------------------------------
# set the '.RECIPEPREFIX' variable to an alternate character
.RECIPEPREFIX = >
#-------------------------------------------------------------------------------
.SUFFIXES: .f90 .c
# .f90 -- assume free-format fortran
#-------------------------------------------------------------------------------
# list what to run and then do any teardown. Do not leave this empty
all: directorysetup $(LIBRARY)
> @echo DONE
#-------------------------------------------------------------------------------
# what to do before you start compiling
directorysetup:
> @ echo "MAKING LIBRARY:   $(LIBRARY)" 
> @ echo "SRCS:             $(SRCS)" 
> @ echo "OBJECTS:          $(LIBOBJ_F90)" 
> @ echo "OBJECTS:          $(LIBOBJ_C)" 
> @ [ -d "$(INSTALL)" ] || \
>   (echo "making directory $(INSTALL)"; \
>   mkdir -p $(INSTALL))
#-------------------------------------------------------------------------------
# what to do after you have built the library
$(LIBRARY): $(LIBOBJ_F90) $(LIBOBJ_C)
> @ $(RANLIB) $(LIBRARY)
> @ echo "TARGETS FOR $(LIBRARY) UP TO DATE"
> @ fpm test make_hershey
#-------------------------------------------------------------------------------
.f90.a:
> $(FC) -c $(F90FLAGS) $(INCLUDE_FLAGS) $(FFLAGS) $< -o $%
> @ $(AR) $(ARFLAGS) $(LIBRARY) $% 
> @ $(AR) $(ARFLAGS) $(LIBRARY) $<  # optionally store the source code too
> @ /bin/rm -f ${?F:.f90=.o} $%
#-------------------------------------------------------------------------------
.c.a:
> $(CC) -c $(CFLAGS) $< -o $%
> @ $(AR) $(ARFLAGS) $(LIBRARY) $% 
> @ $(AR) $(ARFLAGS) $(LIBRARY) $<  # optionally store the source code too
> @ /bin/rm -f ${?F:.c=.o} $%
#-------------------------------------------------------------------------------
FONTLIB=$(BUILD_DIR)/hershey
.phony: buildfonts
buildfonts:
> if test ! -d $$(FONTLIB); then mkdir -p $$(FONTLIB); chmod a+xr $$(FONTLIB); fi
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/astrol.hmp    $FONTLIB/astrology'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/scripts.hmp   $FONTLIB/cursive'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/cyrilc.hmp    $FONTLIB/cyrillic'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/romans.hmp    $FONTLIB/futura.l'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/romand.hmp    $FONTLIB/futura.m'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/gotheng.hmp   $FONTLIB/gothic.eng'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/gothger.hmp   $FONTLIB/gothic.ger'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/gothita.hmp   $FONTLIB/gothic.ita'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/greeks.hmp    $FONTLIB/greek'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/japan.hmp     $FONTLIB/japanese'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/marker.hmp    $FONTLIB/markers'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/marker2.hmp   $FONTLIB/markers   '
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/lowmat.hmp    $FONTLIB/math.low'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/uppmat.hmp    $FONTLIB/math.upp'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/meteo.hmp     $FONTLIB/meteorology'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/music.hmp     $FONTLIB/music'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/scriptc.hmp   $FONTLIB/script'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/symbol.hmp    $FONTLIB/symbolic'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/greekc.hmp    $FONTLIB/times.g'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_aa.hmp  $FONTLIB/orall_aa'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ac.hmp  $FONTLIB/orall_ac'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ae.hmp  $FONTLIB/orall_ae'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ag.hmp  $FONTLIB/orall_ag'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ab.hmp  $FONTLIB/orall_ab'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ad.hmp  $FONTLIB/orall_ad'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_af.hmp  $FONTLIB/orall_af'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ah.hmp  $FONTLIB/orall_ah'
> fpm run h2v  --args 'src/data/hersh.or  src/fonts/orall_ai.hmp  $FONTLIB/orall_ai'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/italicc.hmp   $FONTLIB/times.i'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/italict.hmp   $FONTLIB/times.ib'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/romanc.hmp    $FONTLIB/times.r'
> fpm run h2v  --args 'src/data/hersh.oc  src/fonts/romant.hmp    $FONTLIB/times.rb'
> chmod a+r $FONTLIB $FONTLIB/*
#-------------------------------------------------------------------------------
clean:
> -/bin/rm -f core 
#-------------------------------------------------------------------------------
clobber: clean
> /bin/rm -f -i $(LIBRARY) $(INSTALL)/*.mod
#------------------------------------------------------------------------------
