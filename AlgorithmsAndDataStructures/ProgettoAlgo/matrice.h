#ifndef __MATRICE_H
#define __MATRICE_H

typedef int* riga;
struct _matrice {
	riga *mat;
	int rowLength; /* numero colonne */
	int numberOfRows; /* numero righe */
};
typedef struct _matrice matrice;

void inizializzaMatrice(matrice *m, int numberOfRows, int rowLength);

void inserimentoRigaMatrice(int *payload, matrice *m);

void inserimentoElementoMatrice(matrice *m, int riga, int colonna, int payload);

int numeroColonneNonVuote(matrice m, riga *elenco);

void invertiColonneMatrice(matrice *m, int i, int max);

void copiaColonnePorzioneMatrice(matrice *mDest, int lowDest, matrice mOrigin, int lowOrigin, int highOrigin);

void copiaColonnaInRiga(riga *dest, riga *origin, int minRow, int n, int col);

int confrontaRigaColonna(riga r1, riga *r2, int minRow, int n, int col);

void stampaMatrice(matrice m);

void calcellaMatrice(matrice *m);

#endif
