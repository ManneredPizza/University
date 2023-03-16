#include <stdio.h>
#include <stdlib.h>

#define ROW_LENGTH 256

struct _tabella {
	int *V;
	int maxLength;
	int length;
};
typedef struct _tabella tabella;

/* dichiarazione prototipi funzioni */
FILE *letturaDaTerminale(int argc, char *argv[]);
void inizializzaTabella(tabella *t);
void letturaDaFile(FILE *fpNumeri, tabella *t);
void insericeOrdinato(tabella *t, int min, int partenza);
void insertionSort(tabella *t);
void stampaTabella(tabella t);

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

void inizializzaTabella(tabella *t) {
	t->V = (int *)malloc(sizeof(int));
	t->maxLength = ROW_LENGTH;
	t->length = 1;
}

void letturaDaFile(FILE *fpNumeri, tabella *t) {
	while(fscanf(fpNumeri, "%d", &(t->V[t->length-1])) == 1) {
		t->length++;
		t->V = (int *)realloc(t->V, sizeof(int)*t->length);

		if(t->length == t->maxLength) {
			fprintf(stdout, "Max lunghezza raggiunta, continuo esecuzione alla lettura della riga %d\n", ROW_LENGTH);
			break;
		}
	}

	t->length--;
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

void stampaTabella(tabella t) {
	int i;

	for(i=0; i<t.length; i++) {
		fprintf(stdout, "%d\n", t.V[i]);
	}
}
