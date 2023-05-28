#ifndef __grafo_la_h
#define __grafo_la_h

#include <stdio.h>
#include <stdlib.h>

#include "listaarchi.h"


#define TRUE  1
#define FALSE 0
#define boolean int


typedef struct _grafo grafo;

struct _grafo
{
  int n;
  int m;
  listaarchi L;
};


/* Crea un grafo *pG di n nodi, senza archi */
void creagrafo (int n, grafo *pG);

/* Distrugge il grafo *pG */
void distruggegrafo (grafo *pG);

/* Aggiunge l'arco (o,d) di costo c al grafo *pG (non fa nulla se gia' esiste) */
void insarco (nodo o, nodo d, int c, grafo *pG);

/* Cancella l'arco (o,d) dal grafo *pG (non fa nulla se non esiste) */
void cancarco (nodo o, nodo d, grafo *pG);

/* Determina se l'arco (o,d) appartiene al grafo *pG */
boolean esistearco (nodo o, nodo d, grafo *pG);

/* Stampa a video il grafo G */
void stampagrafo (grafo *pG);

/* Restituisce la posizione del primo arco del grafo *pG */
posarco primoarco (grafo *pG);

/* Restituisce la posizione dell'arco successivo a pa nel grafo *pG */
posarco succarco (grafo *pG, posarco pa);

/* Determina se la posizione pa e' fuori della lista degli archi del grafo *pG */
boolean finearchi (grafo *pG, posarco pa);

/* Restituisce gli estremi *po e *pd dell'arco in posizione pa nel grafo *pG */
void leggeestremiarco (grafo *pG, posarco pa, nodo *po, nodo *pd);

/* Restituisce il costo dell'arco in posizione pa nel grafo *pG */
int leggecosto (grafo *pG, posarco pa);

#endif
