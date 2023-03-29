#ifndef __GRAFIMA_H
#define __GRAFIMA_H

#include <stdio.h>
#include <stdlib.h>

#define ROW_LENGTH 256

#define TRUE 1
#define FALSE 0

typedef struct _grafo grafo;
typedef int boolean;

struct _grafo {
	int n; /* numero nodi */
	int m; /* numero archi */
	boolean **matriceAdiacenza;
};

grafo creaGrafo(int n);

void distruggiGrafo(grafo *G);

void insArco(grafo *G, int a, int b);

void cancArco(grafo *G, int a, int b);

boolean esisteArco(grafo G, int a, int b);

void stampaGrafo(grafo G);

void stampaSottGrafo(grafo sottG, int *lista);

#endif
