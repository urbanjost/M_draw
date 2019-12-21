#!/bin/sh
cat >splitor.f <<\EOF
      program drawchars
C     @(#) script that made .hmp font files for oriental characters
      character*1000 chars
      icount=0
20    continue
      chars(:)=' '
40     continue  ! get new character
      istart=1
      iend=istart+63
      read(*,101,end=999)inum,ipairs,chars(istart:iend)
101   format(i5,i3,a)
      if(inum.eq.0)goto 40  ! blank line
      icount=icount+1
      ileft=ipairs-32
10    continue
      if(ileft.gt.0)then ! get another line
         istart=iend+1
         iend=istart+71
         ileft=ileft-36
         read(*,'(a)')chars(istart:iend)
         goto 10
      endif
      !write(*,202)inum,ipairs,chars(1:ipairs*2)
202   format('#for char ',i5,' with ',i3,' pairs:',a)
       write(*,*)icount,' # ',inum,0
      goto 20
999   continue
      write(*,*)'# number of character=',icount,'#'
      end
EOF
rm -f a.out
g77 splitor.f
rm -f splitor.f
./a.out < ../data/hersh.or >list.xx
rm -f ./a.out
split -l 94 list.xx orall_
rm list.xx
export name
for name in orall_??
do
   echo $name
   ( echo 6200 0; sed -e 's/.*# *//' <$name ) >../fonts/$name.hmp
   h2v ../data/hersh.or ../fonts/$name.hmp $M_DRAW_FONTPATH/$name
   rm $name
done
exit
