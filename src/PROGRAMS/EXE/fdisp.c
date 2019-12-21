#include <stdlib.h>
#include <stdio.h>
#include "draw.h"

/*
 *	displays every character in a hershey font at 64 characters
 * per screen. Note: this program reads the binary format as created
 * by h2v.
 */
int
main(int ac, char *av[])
{
	char	dev[50];
	int	i, nchars;
	float	x, y;

	if (ac != 2) {
		fprintf(stderr, "fdisp: usage fdisp fontname\n");
		exit(1);
	}

	fprintf(stderr,"Enter device name: ");
	gets(dev);

	draw_vinit(dev);
	draw_color(BLACK);
	draw_clear();

	draw_color(GREEN);

	draw_font(av[1]);

	nchars = draw_numchars();

	draw_textsize(0.2, 0.2);

	x = -0.94;
	y = 0.77;
	for (i = 0; i < nchars; i++) {
		draw_move2(x, y);
		draw_drawchar(' ' + i);
		x += 0.25;
		if (x > 0.86) {
			y -= 0.25;
			if (y < -1.1) {
				draw_getkey();
				draw_color(BLACK);
				draw_clear();
				draw_color(GREEN);
				y = 0.77;
			}
			x = -0.94;
		}
	}

	draw_getkey();

	draw_vexit();

	return(0);
}

