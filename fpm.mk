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
> if test ! -d $$(BUILD_DIR); then mkdir -p $$(BUILD_DIR); chmod a+xr $$(BUILD_DIR); fi
> fpm --args 'src/data/hersh.oc  src/fonts/astrol.hmp    $(BUILD_DIR/hershey/astrology'
> fpm --args 'src/data/hersh.oc  src/fonts/scripts.hmp   $(BUILD_DIR/hershey/cursive'
> fpm --args 'src/data/hersh.oc  src/fonts/cyrilc.hmp    $(BUILD_DIR/hershey/cyrillic'
> fpm --args 'src/data/hersh.oc  src/fonts/romans.hmp    $(BUILD_DIR/hershey/futura.l'
> fpm --args 'src/data/hersh.oc  src/fonts/romand.hmp    $(BUILD_DIR/hershey/futura.m'
> fpm --args 'src/data/hersh.oc  src/fonts/gotheng.hmp   $(BUILD_DIR/hershey/gothic.eng'
> fpm --args 'src/data/hersh.oc  src/fonts/gothger.hmp   $(BUILD_DIR/hershey/gothic.ger'
> fpm --args 'src/data/hersh.oc  src/fonts/gothita.hmp   $(BUILD_DIR/hershey/gothic.ita'
> fpm --args 'src/data/hersh.oc  src/fonts/greeks.hmp    $(BUILD_DIR/hershey/greek'
> fpm --args 'src/data/hersh.or  src/fonts/japan.hmp     $(BUILD_DIR/hershey/japanese'
> fpm --args 'src/data/hersh.oc  src/fonts/marker.hmp    $(BUILD_DIR/hershey/markers'
> fpm --args 'src/data/hersh.oc  src/fonts/marker2.hmp   $(BUILD_DIR/hershey/markers   '
> fpm --args 'src/data/hersh.oc  src/fonts/lowmat.hmp    $(BUILD_DIR/hershey/math.low'
> fpm --args 'src/data/hersh.oc  src/fonts/uppmat.hmp    $(BUILD_DIR/hershey/math.upp'
> fpm --args 'src/data/hersh.oc  src/fonts/meteo.hmp     $(BUILD_DIR/hershey/meteorology'
> fpm --args 'src/data/hersh.oc  src/fonts/music.hmp     $(BUILD_DIR/hershey/music'
> fpm --args 'src/data/hersh.oc  src/fonts/scriptc.hmp   $(BUILD_DIR/hershey/script'
> fpm --args 'src/data/hersh.oc  src/fonts/symbol.hmp    $(BUILD_DIR/hershey/symbolic'
> fpm --args 'src/data/hersh.oc  src/fonts/greekc.hmp    $(BUILD_DIR/hershey/times.g'
> fpm --args 'src/data/hersh.or  src/fonts/orall_aa.hmp  $(BUILD_DIR/hershey/orall_aa'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ac.hmp  $(BUILD_DIR/hershey/orall_ac'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ae.hmp  $(BUILD_DIR/hershey/orall_ae'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ag.hmp  $(BUILD_DIR/hershey/orall_ag'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ab.hmp  $(BUILD_DIR/hershey/orall_ab'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ad.hmp  $(BUILD_DIR/hershey/orall_ad'
> fpm --args 'src/data/hersh.or  src/fonts/orall_af.hmp  $(BUILD_DIR/hershey/orall_af'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ah.hmp  $(BUILD_DIR/hershey/orall_ah'
> fpm --args 'src/data/hersh.or  src/fonts/orall_ai.hmp  $(BUILD_DIR/hershey/orall_ai'
> fpm --args 'src/data/hersh.oc  src/fonts/italicc.hmp   $(BUILD_DIR/hershey/times.i'
> fpm --args 'src/data/hersh.oc  src/fonts/italict.hmp   $(BUILD_DIR/hershey/times.ib'
> fpm --args 'src/data/hersh.oc  src/fonts/romanc.hmp    $(BUILD_DIR/hershey/times.r'
> fpm --args 'src/data/hersh.oc  src/fonts/romant.hmp    $(BUILD_DIR/hershey/times.rb'
> chmod a+r $FONTLIB/$OUTPUT
#-------------------------------------------------------------------------------
clean:
> -/bin/rm -f core 
#-------------------------------------------------------------------------------
clobber: clean
> /bin/rm -f -i $(LIBRARY) $(INSTALL)/*.mod
#------------------------------------------------------------------------------
