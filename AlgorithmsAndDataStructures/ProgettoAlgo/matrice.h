#ifndef __MATRICE_H
#define __MATRICE_H

#define ROW_LENGTH 256

struct _matrice {
	int *row;
	int rowLength;
	int length;
};
typedef struct _matrice matrice;

void inizializzaMatrice(matrice *m, );

void inserimentoRiga(int *payload, matrice *m);

void stampaMatrice(matrice m);

#endif
