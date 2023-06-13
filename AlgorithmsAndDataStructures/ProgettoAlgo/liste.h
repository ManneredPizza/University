#ifndef __LISTE_H
#define __LISTE_H

typedef struct _nodo nodo;
typedef nodo *lista;
struct _nodo {
    int data;
    lista next;
    lista pre;
};

void createLista(lista l);

int recuperaLunghezzaLista(lista l);

void inserisciElementoLista(lista l, int distanza, int payload);

int leggiElementoLista(lista l, int distanza);

/* li inserice sempre DOPO l'elemento di indice distanza */
void inserisciNodoLista(lista l, int distanza, int payload);

void cancellaNodoLista(lista l, int distanza);

void inserisciNodoFondoLista(lista l, int payload);

void stampaLista(lista l);

#endif
