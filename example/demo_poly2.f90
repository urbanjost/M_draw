          program demo_poly2
          use M_draw
          integer :: i,j, icolor, ipaws
          real    :: xx,yy
             call prefsize(512,512)
             call vinit(' ') ! start graphics using device $M_draw_DEVICE
             call ortho2(0.0,256.0,0.0,256.0)
             call linewidth(1)
             call polyfill(.true.)
             ! step thru a series of rectangular cells
             icolor=0
             xx=0.0
             do i=1,16
                yy=0.0
                do j=1,16
                   yy=yy+16.0
                   icolor=icolor+1
                   call setcolor(icolor,xx,yy)
                enddo
                xx=xx+16.0
             enddo
             ipaws=getkey()
             call vexit()
          contains

          subroutine setcolor(iset,xx,yy)
          integer,intent(in) :: iset
          real,intent(in)    :: xx,yy
          character(len=80)  :: echoname
          real    :: points(2,100)
          if(iset.gt.255)return
          ! determine coordinates of next square
          points(1:2,1)=[xx,      yy      ]
          points(1:2,2)=[xx,      yy+16.0 ]
          points(1:2,3)=[xx+16.0, yy+16.0 ]
          points(1:2,4)=[xx+16.0, yy      ]
          points(1:2,5)=[xx,      yy      ]
          ! get some nice RGB values to try from named colors known by M_color module
          call color(icolor)
          ! fill the rectangle in that color
          call poly2(5,points)
          end subroutine setcolor

          end program demo_poly2
