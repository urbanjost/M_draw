          program demo_linewidth
          use M_draw,     only : prefsize, vinit, clear, getkey, drawstr
          use M_draw,     only : textsize, ycentertext, rdraw2, rmove2
          use M_draw,     only : move2, draw2, vexit, color, linewidth, font
          use M_draw,     only : D_BLACK,   D_WHITE
          use M_draw,     only : D_RED,     D_GREEN,    D_BLUE
          use M_draw,     only : D_YELLOW,  D_MAGENTA,  D_CYAN
          use M_draw, only : page
          implicit none
          real    :: b=0.5
          integer :: ipaws
          call prefsize(1000,200)
          call vinit(' ') ! start graphics using device $M_draw_DEVICE
          call page(-25.0-b, 25.0+b, -5.0-b, 5.0+b)
          call color(D_YELLOW)
          call clear()
          call textsize(2.4,3.0)
          call font("futura.m")
          call ycentertext()
          ! draw circles with different precisions and label center of circles
          call color(D_WHITE)
          call linewidth(0)
          call move2(-20.0, -3.5)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("0")
          call color(D_RED)
          call linewidth(100)
          call move2(-20.0,0.0)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("100")
          call color(D_GREEN)
          call linewidth(200)
          call move2(-20.0,3.5)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("200")
          call color(D_BLUE)
          call linewidth(300)
          call move2(3.0,-3.5)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("300")
          call color(D_MAGENTA)
          call linewidth(400)
          call move2(3.0,0.0)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("400")
          call color(D_CYAN)
          call linewidth(500)
          call move2(3.0,3.5)
          call rdraw2(10.0,0.0)
          call rmove2(3.0,0.0)
          call linewidth(180)
          call color(D_WHITE)
          call drawstr("500")
          call linewidth(200)
          call color(D_BLUE)
          call move2(-25.0,-5.0)
          call draw2(-25.0,5.0)
          call draw2(25.0,5.0)
          call draw2(25.0,-5.0)
          call draw2(-25.0,-5.0)
          ipaws=getkey()
          ! exit graphics mode
          call vexit()
          end program demo_linewidth