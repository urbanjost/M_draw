################################################################################
include ../makefiles/INSTALL.mk
SHELL = /bin/sh
################################################################################
all:
	@banner.sh "hershey"                                           
	cd src; make -f Makefile \
			FONTLIB="$(INSTALL)/hershey" \
			LIB="$(INSTALL)/libGPF.a" \
			BINDIR="$(PUTBIN)" \
################################################################################
