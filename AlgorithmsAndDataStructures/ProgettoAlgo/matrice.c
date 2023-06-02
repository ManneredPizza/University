#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"

void inizializzaMatrice(matrice *m) {
    t->V = (char **)malloc(sizeof(char*));
	t->V[0] = (char*)malloc((LUNGHEZZA_ELEMENTO + 1)*sizeof(char));
	t->maxLength = ROW_LENGTH;
	t->length = 0;
}

void inserimentoRiga(int *payload, matrice *m);

void stampaMatrice(matrice m);
