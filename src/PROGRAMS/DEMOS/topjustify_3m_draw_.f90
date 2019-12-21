          program demo_topjustify
          use M_draw
          use M_draw, only : page
          implicit none
          real    :: x1, x2, y1, y2
          real    :: scl, ax, bx
          integer :: key
             call prefsize(1200,120)
             call vinit(' ')
             x1=0; x2=40; y1=0; y2=4; scl=1.9
             call page(x1,x2,y1,y2)
             call textsize(0.9*scl,1.4*scl)
             call font("times.rb")
             call linewidth(200)
             AX=(x1+x2)/2+0.3; BX=y1+3.3
             call move2(AX,BX)
             call topjustify()
             call color(D_BLUE)
             call drawstr("topjustify()")
             call color(D_RED)
             call move2(AX-1.0,BX)
             call draw2(AX+1.0,BX)
             call move2(AX,BX-1.0)
             call draw2(AX,BX+1.0)
             call vflush()
             key=getkey()
             call vexit()
          end program demo_topjustify
