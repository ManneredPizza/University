#include <stdio.h>
#include <stdlib.h>
#include "tabella.h"

/* dichiarazione prototipi funzioni */
FILE *letturaDaTerminale(int argc, char *argv[]);
void insericeOrdinato(tabella *t, int min, int partenza);
void insertionSort(tabella *t);

int main(int argc, char *argv[]) {
	/* parte dichiarativa */
	tabella t;
	FILE *fpNumeri;

	fpNumeri = letturaDaTerminale(argc, argv);

	inizializzaTabella(&t);

	letturaDaFile(fpNumeri, &t);

	insertionSort(&t);

	stampaTabella(t);

	fclose(fpNumeri);

	return EXIT_SUCCESS;
}

FILE *letturaDaTerminale(int argc, char *argv[]) {
	FILE *fpNumeri = NULL;

	if(argc != 2) {
		fprintf(stderr, "Errore numero argomenti\n");
		exit(EXIT_FAILURE);
	}

	fpNumeri = fopen(argv[1], "r");

	if(fpNumeri == NULL) {
		fprintf(stderr, "Errore apertura file\n");
		exit(EXIT_FAILURE);
	}

	return fpNumeri;
}

void insericeOrdinato(tabella *t, int min, int partenza) {
	int i=partenza;

	for( ; (i >= 0) && (t->V[i] > min); i--) {
		t->V[i+1] = t->V[i];
	}

	t->V[i+1] = min;
}

void insertionSort(tabella *t) {
	int j=1;
	int x;
	
	for( ; j<t->length; j++) {
		x = t->V[j];
		insericeOrdinato(t, x, j-1);
	}
}