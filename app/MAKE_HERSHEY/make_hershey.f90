program make_hershey
implicit none
! @(#) Makes the binary Hershey font file for M_DRAW
character(len=:),allocatable :: var
character(len=:),allocatable :: bdir
integer                      :: howbig, stat
character(len=:),allocatable :: ENV
   var='BUILD_DIR'
   ! get length required to hold value
   call get_environment_variable(var, length=howbig,status=stat)
   if(howbig==0.and.stat.eq.0)stat=1
   select case (stat)
   case (1)
    print *, "$BUILD_DIR is not defined in the environment.  Set it to directory to put hershey/ directory in"
    bdir='./src/lib'
   case (2)
    print *, "This processor doesn't support environment variables.  Boooh!";stop 2
   case default
      ! make string to hold value of sufficient size
      allocate(character(len=howbig) :: bdir)
      ! get value
      call get_environment_variable(var, bdir)
      ! print environment variable name value
      write (*,'(a,"=""",a,"""")')var,trim(bdir)
   end select
   ENV='set -x;export BUILD_DIR='//bdir//';'
   call execute_command_line(ENV//'if test ! -d $BUILD_DIR/hershey;&
                             &then mkdir -p $BUILD_DIR/hershey; &
                             &chmod a+xr $BUILD_DIR/hershey; fi')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/astrol.hmp    "$BUILD_DIR/hershey/astrology"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/scripts.hmp   "$BUILD_DIR/hershey/cursive"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/cyrilc.hmp    "$BUILD_DIR/hershey/cyrillic"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/romans.hmp    "$BUILD_DIR/hershey/futura.l"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/romand.hmp    "$BUILD_DIR/hershey/futura.m"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/gotheng.hmp   "$BUILD_DIR/hershey/gothic.eng"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/gothger.hmp   "$BUILD_DIR/hershey/gothic.ger"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/gothita.hmp   "$BUILD_DIR/hershey/gothic.ita"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/greeks.hmp    "$BUILD_DIR/hershey/greek"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/japan.hmp     "$BUILD_DIR/hershey/japanese"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/marker.hmp    "$BUILD_DIR/hershey/markers"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/marker2.hmp   "$BUILD_DIR/hershey/markers"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/lowmat.hmp    "$BUILD_DIR/hershey/math.low"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/uppmat.hmp    "$BUILD_DIR/hershey/math.upp"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/meteo.hmp     "$BUILD_DIR/hershey/meteorology"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/music.hmp     "$BUILD_DIR/hershey/music"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/scriptc.hmp   "$BUILD_DIR/hershey/script"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/symbol.hmp    "$BUILD_DIR/hershey/symbolic"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/greekc.hmp    "$BUILD_DIR/hershey/times.g"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_aa.hmp  "$BUILD_DIR/hershey/orall_aa"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ac.hmp  "$BUILD_DIR/hershey/orall_ac"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ae.hmp  "$BUILD_DIR/hershey/orall_ae"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ag.hmp  "$BUILD_DIR/hershey/orall_ag"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ab.hmp  "$BUILD_DIR/hershey/orall_ab"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ad.hmp  "$BUILD_DIR/hershey/orall_ad"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_af.hmp  "$BUILD_DIR/hershey/orall_af"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ah.hmp  "$BUILD_DIR/hershey/orall_ah"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.or  src/fonts/orall_ai.hmp  "$BUILD_DIR/hershey/orall_ai"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/italicc.hmp   "$BUILD_DIR/hershey/times.i"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/italict.hmp   "$BUILD_DIR/hershey/times.ib"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/romanc.hmp    "$BUILD_DIR/hershey/times.r"')
   call execute_command_line(ENV//'fpm run h2v -- src/data/hersh.oc  src/fonts/romant.hmp    "$BUILD_DIR/hershey/times.rb"')
!   h2v $DATA  $INPUT  $FONTLIB/$OUTPUT
   call execute_command_line(ENV//'chmod a+r $BUILD_DIR/hershey/*')
end program make_hershey
