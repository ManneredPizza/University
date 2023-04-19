#ifndef __albero_h
#define __albero_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

#define boolean int
#define TRUE  1
#define FALSE 0

#define EMPTY_TREE NULL
#define EMPTY_VALUE NULL

#define MIN_INT -99999;
#define MAX_INT 99999;

typedef struct _nodo nodo;
struct _nodo {
	int val;
	nodo *Ts;
	nodo *Td;
	nodo *padre;
};

typedef nodo *ABR;


ABR creaABR();

void distruggeABR(ABR *pT);

boolean ABRvuoto(ABR T);

boolean memberABR(int i, ABR T);

ABR insertABR(int i, ABR T);

ABR deleteABR(int i, ABR T);

int minABR(ABR T);

int maxABR(ABR T);

void stampaABR(ABR T);


#endif
