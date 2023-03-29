#include "grafi-ma.h"

typedef int* vint;

/*

	derivano da +1 e -1 per stampa a video e colorre righe matrici

*/

grafo letturaDaFile(int argc, char *argv[]);

void letturaDaTerminale(int argc, char *argv[], vint *lista);

void creaSottografo(vint lista, grafo *sottG, grafo G);

int main(int argc, char *argv[]) {
	grafo G;
	grafo sottG;
	vint lista=NULL;

	G = letturaDaFile(argc, argv);

	letturaDaTerminale(argc, argv, &lista);

	sottG = creaGrafo(argc-2);

	creaSottografo(lista, &sottG, G);

	stampaGrafo(G);

	stampaSottGrafo(sottG, lista);

	distruggiGrafo(&G);

	distruggiGrafo(&sottG);

	return EXIT_SUCCESS;
}

grafo letturaDaFile(int argc, char *argv[]) {
	FILE *fp;
	grafo G;
	int o, r;
	int n;

	if(argc < 2) {
		fprintf(stderr, "Errore inserimento dati in chiamata\n");
		exit(EXIT_FAILURE);
	}

	fp = fopen(argv[1], "r");
	if(fp == NULL) {
		fprintf(stderr, "Impossibile aprire il file\n");
		exit(EXIT_FAILURE);
	}
	
	/* cerco il max */
	n=0;
	while(fscanf(fp, "(%d , %d ) ", &o, &r) == 2) {
		if(o > n) n=o;
		if(r > n) n=r;
	}

	rewind(fp);

	G = creaGrafo(n);

	while(fscanf(fp, "(%d , %d ) ", &o, &r) == 2) {
		insArco(&G, o, r);
	}

	return G;
}

void letturaDaTerminale(int argc, char *argv[], vint *lista) {
	int i=0;

	if(argc < 3) {
		fprintf(stderr, "Un sottografo deve avere almeno 1 nodo\n");
		exit(EXIT_FAILURE);
	}

	/* parto dall'idea che non si inserisca due volte lo stesso nodo */
	*lista = (vint)malloc(sizeof(int)*(i+1));
	for( ; i<argc-2; i++) {
		if(i != 0) {
			*lista = (vint)realloc(*lista, sizeof(int)*(i+1));
		}

		sscanf(argv[i+2], "%d", *lista+i);
	}
}

void creaSottografo(vint lista, grafo *sottG, grafo G) {
	int i, j;

	for(i=0; i<sottG->n; i++) {
		for(j=0; j<sottG->n; j++) {
			if(esisteArco(G, lista[i], lista[j]) == TRUE) {
				insArco(sottG, i+1, j+1);
				sottG->m++;
			}
		}
	}
}
