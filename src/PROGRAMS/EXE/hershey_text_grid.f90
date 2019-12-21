      program grid
!     @(#) print ASCII grid for hand drawing new characters
!     RR is the "center"
!     See hershey files for details on why this would be handy
!     Approximately prints square on most printers using
!     a fixed-space font
      parameter(ix=32)
      parameter(iy=33)
      character*4 array(ix,iy)
      ixoff=ichar('R')-ix/2-1
      iyoff=ichar('R')-iy/2-1
      do i10=1,ix
         do i20=1,iy
            array(i10,i20)='  '//char(i10+ixoff)//char(i20+iyoff)
         enddo
      enddo
      do i30=1,iy
         write(*,'(/,1000a:)')(array(ii,i30),ii=1,ix)
      enddo
      end program grid
