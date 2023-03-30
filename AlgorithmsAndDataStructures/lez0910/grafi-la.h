#ifndef __GRAFILA_H
#define __GRAFILA_H

#include <stdio.h>
#include <stdlib.h>

#include "listaarchi.h"


#define TRUE  1
#define FALSE 0
typedef int boolean;


typedef struct _grafo grafo;

struct _grafo
{
  int n;
  int m;
  listaarchi L;
};


/* Crea un grafo G di n nodi, senza archi */
void creagrafo(int n, grafo *pG);

/* Disstrugge il grafo G */
void distruggegrafo(grafo *pG);

/* Aggiunge l'arco (o,d) al grafo G
   N.B.: non verifica che l'arco sia nuovo! */
void insarco(nodo o, nodo d, grafo *pG);

/* Cancella l'arco (o,d) dal grafo G (non fa nulla se non esiste) */
void cancarco(nodo o, nodo d, grafo *pG);

/* Determina se l'arco (o,d) appartiene al grafo G */
boolean esistearco(nodo o, nodo d, grafo *pG);

/* Stampa a video il grafo G */
void stampagrafo(grafo *pG);

/* Restituisce la posizione del primo arco del grafo G */
posarco primoarco(grafo *pG);

/* Restituisce la posizione dell'arco successivo a pa nel grafo G */
posarco succarco(grafo *pG, posarco pa);

/* Determina se la posizione pa e' fuori della lista degli archi del grafo G */
boolean finearchi(grafo *pG, posarco pa);

/* Restituisce gli estremi *po e *pd dell'arco in posizione pa nel grafo G */
void leggeestremiarco(grafo *pG, posarco pa, nodo *po, nodo *pd);

#endif
