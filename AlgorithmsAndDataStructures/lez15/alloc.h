#ifndef __alloc_h
#define __alloc_h

#include <stdio.h>
#include <stdlib.h>

#define boolean int
#define TRUE  1
#define FALSE 0

typedef int * vint;
typedef vint * mint;
typedef boolean * vboolean;


/* Alloca una matrice di int con nr righe e nc colonne */
mint int2alloc (int nr, int nc);

/* Dealloca una matrice di int con nr righe */
void int2free (mint *pF, int nr);

#endif
