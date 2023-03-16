#ifndef __TABELLA_H
#define __TABELLA_H

#define ROW_LENGTH 256

struct _tabella {
	int *V;
	int maxLength;
	int length;
};
typedef struct _tabella tabella;

void inizializzaTabella(tabella *t);

void letturaDaFile(FILE *fpNumeri, tabella *t);

int trovaIndiceMassimo(tabella t, int n);

void scambia(int *a, int *b);

void stampaTabella(tabella t);

#endif
