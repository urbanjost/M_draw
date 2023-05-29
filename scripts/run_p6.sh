#!/bin/bash
NAME=$1
shift
export M_DRAW_FONTPATH=$HOME/.local/lib/hershey
export M_DRAW_DEVICE=p6  M_DRAW_OUTPUT="|ppmtogif  >$NAME.gif" 
fpm run --example --target $NAME $* 
