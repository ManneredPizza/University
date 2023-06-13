#ifndef __LISTE_H
#define __LISTE_H

typedef struct _nodo nodo;
typedef nodo *pizza;
typedef nodo *ingrediente;
struct _nodo {
    int data;
    ingrediente next;
    ingrediente pre;
};
typedef pizza *menu;

void createLista(pizza l);

void creaMenuLista(menu m, int lunghezzaMaxMenu);

int recuperaLunghezzaLista(pizza l);

void inserisciElementoLista(pizza l, int distanza, int payload);

int leggiElementoLista(pizza l, int distanza);

/* li inserice sempre DOPO l'elemento di indice distanza */
void inserisciNodoLista(pizza l, int distanza, int payload);

void cancellaNodoLista(pizza l, int distanza);

void inserisciNodoFondoLista(pizza l, int payload);

void stampaLista(pizza l);

#endif
