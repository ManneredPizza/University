#include "grafi-ma.h"

grafo creaGrafo(int n) {
	grafo G;
	int i;
	int j;
	
	G.n = n;
	G.m = 0;

	G.matriceAdiacenza = (boolean **)malloc(sizeof(boolean*)*n);
	for(i=0; i<n; i++) {
		G.matriceAdiacenza[i] = (boolean *)malloc(sizeof(boolean)*n);
		for(j=0; j<n; j++) {
			G.matriceAdiacenza[i][j] = FALSE;
		}
	}

	return G;
}

void distruggiGrafo(grafo *G) {
	int i;

	for(i=0; i<G->n; i++) {
		free(G->matriceAdiacenza[i]);
	}

	free(G->matriceAdiacenza);
}

void insArco(grafo *G, int a, int b) {
	if(esisteArco(*G, a, b) == TRUE) {
		fprintf(stderr, "Arco gia' esistente\n");
		return;
	}

	G->matriceAdiacenza[a-1][b-1] = TRUE;
	G->m++;
}

void cancArco(grafo *G, int a, int b) {
	if(esisteArco(*G, a, b) == FALSE) {
		fprintf(stderr, "Arco non esistente\n");
		return;
	}

	G->matriceAdiacenza[a-1][b-1] = FALSE;
	G->m--;
}

boolean esisteArco(grafo G, int a, int b) {
	if(a < 1 || a > G.n || b < 1 || b > G.n) {
		fprintf(stderr, "Devi fornire valori di nodi tra 1 e %d, mentre fornita la coppia (%d, %d)\n", G.n, a, b);
		exit(EXIT_FAILURE);
	}
	if(G.m == 0) {
		return FALSE;
	}

	return G.matriceAdiacenza[a-1][b-1];
}

void stampaGrafo(grafo G) {
	int i, j;

	for(i=0; i<G.n; i++) {
		for(j=0; j<G.n; j++) {
			if(G.matriceAdiacenza[i][j] != FALSE) {
				fprintf(stdout, "(%d,%d) ", i+1, j+1);
			}
		}
	}

	fprintf(stdout, "\n");
}

void stampaSottGrafo(grafo sottG, int *lista) {
	int i, j;

	for(i=0; i<sottG.n; i++) {
		for(j=0; j<sottG.n; j++) {
			if(sottG.matriceAdiacenza[i][j] != FALSE) {
				fprintf(stdout, "(%d,%d) ", lista[i], lista[j]);
			}
		}
	}

	fprintf(stdout, "\n");
}
