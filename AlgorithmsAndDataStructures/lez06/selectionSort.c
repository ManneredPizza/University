#include <stdio.h>
#include <stdlib.h>
#include "tabella.h"

/* prototipi funzioni */
FILE *letturaDaTerminale(int argc, char *argv[]);
void selectionSort(tabella *t);

int main(int argc, char *argv[]) {
	tabella t;

	FILE *fpNumeri;

	fpNumeri = letturaDaTerminale(argc, argv);

	inizializzaTabella(&t);

	letturaDaFile(fpNumeri, &t);

	selectionSort(&t);

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

void selectionSort(tabella *t) {
	int i;
	int maxI;
	int j;

	for(i=t->length-1; i>0; i--) {
		maxI = trovaIndiceMassimo(*t, i);
		scambia(&(t->V[maxI]), &(t->V[i]));
	}
}
