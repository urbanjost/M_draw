#include <stdlib.h>
#include <stdio.h>
#include "draw.h"

#define	XCOORD(x)	((x) - 'R')
#define	YCOORD(y)	('R' - (y))	/* invert as in tv coords */

/*
int getcharacter (FILE * fp, int *no, int *pairs, char *buf);
*/

/*
 * getcharacter
 *
 *	read in a character line from a hershey font file
 */
int getcharacter (FILE * fp, int *no, int *pairs, char *buf) {
   int i;
   char *p, tmp[10];

   /*
    * read in the numbers
    */
   for (i = 0; i < 5; i++) {
      if ((tmp[i] = fgetc (fp)) == '\n')	/* take care of the odd blank line */
	 tmp[i] = fgetc (fp);
      if (feof (fp))
	 return (0);
   }
   tmp[5] = 0;
   sscanf (tmp, "%d", no);

   for (i = 0; i < 3; i++) {
      tmp[i] = fgetc (fp);
      if (feof (fp))
	 return (0);
   }
   tmp[3] = 0;
   sscanf (tmp, "%d", pairs);


   /*
    * read in the pairs
    */
   for (p = buf, i = 0; i < 2 * *pairs; i++, p++)
      if ((*p = fgetc (fp)) == '\n')
	 *p = fgetc (fp);

   *p = 0;

   fgetc (fp);			/* skip newline at end */

   return (1);
}

/*
 * newpage
 *
 *	draw up a new page with title, boxes, etc..
 */
void newpage (char *fname, int pageno) {
   char str[100];

   draw_centertext (0);

   draw_textsize (0.07, 0.07);

   draw_move2 (-0.91, 0.9);
   draw_drawstr ("Hershey Character File: ");
   draw_drawstr (fname);

   draw_move2 (0.45, 0.9);
   sprintf (str, "Page No: %d", pageno);
   draw_drawstr (str);

   draw_textsize (0.03, 0.03);

   draw_centertext (1);
}

/*
 * display the hershey data set in the input file.
 */
int main (int ac, char *av[]) {
   FILE *fp;
   int charno, numpairs, page;
   char device[20], buf[1000], *p, str[100];
   float x, y, ox, oy;

   if (ac < 2) {
      fprintf (stderr, "hdisp: usage hdisp datafile\n");
      exit (1);
   }

   if ((fp = fopen (av[1], "r")) == NULL) {
      fprintf (stderr, "hdisp: unable to open file %s\n", av[1]);
      exit (1);
   }

   fprintf (stderr, "Enter device name: ");
   gets (device);

   draw_vinit (device);

   draw_color (BLACK);
   draw_clear ();

   ox = -0.8;
   oy = 0.75;

   page = 1;

   draw_color (WHITE);

   newpage (av[1], page);

   while (getcharacter (fp, &charno, &numpairs, buf)) {

      if (buf[2] != 0) {
	 p = &buf[2];		/* skip the width bytes */

	 x = XCOORD ((int) *p++) / 280.0;
	 y = YCOORD ((int) *p++) / 280.0;
	 draw_move2 (ox + x, oy + y);

	 while (*p != 0) {
	    if (*p == ' ') {
	       p += 2;
	       x = XCOORD ((int) *p++) / 280.0;
	       y = YCOORD ((int) *p++) / 280.0;
	       draw_move2 (ox + x, oy + y);
	    } else {
	       x = XCOORD ((int) *p++) / 280.0;
	       y = YCOORD ((int) *p++) / 280.0;
	       draw_draw2 (ox + x, oy + y);
	    }
	 }
      }

      draw_move2 (ox, oy - 0.11);
      sprintf (str, "(%d)", charno);
      draw_drawstr (str);

      ox += 0.22;
      if (ox > 0.9) {
	 oy -= 0.22;
	 ox = -0.8;
      }
      if (oy < -0.9) {
	 oy = 0.75;
	 draw_getkey ();

	 draw_color (BLACK);
	 draw_clear ();

	 draw_color (WHITE);

	 newpage (av[1], ++page);
      }
   }

   draw_getkey ();

   draw_vexit ();

   return (0);
}
