#ifndef __LISTE_H
#define __LISTE_H

#include "tabella.h"

typedef struct _nodo nodo;
typedef nodo *pizza;
typedef nodo *ingrediente;
struct _nodo {
    int data;
    ingrediente next;
    ingrediente pre;
};
struct _menu {
    pizza *listaPizze;
    int lunghezzaMaxMenu;
};
typedef struct _menu menu;

pizza creaLista(int payload);

void creaMenuLista(menu *m, int lunghezzaMaxMenu);

void nuovaPizzaInMenu(menu *m, int index);

pizza leggiPizzaDaMenu(menu *m, int index);

void cambiaPizza(menu *m, int index, pizza p);

int recuperaLunghezzaLista(pizza l);

ingrediente nextIngredienteLista(ingrediente l);

void inserisciElementoLista(pizza l, int distanza, int payload);

int leggiElementoLista(pizza l, int distanza);

/* li inserice sempre DOPO l'elemento di indice distanza */
void inserisciNodoLista(pizza l, int distanza, int payload);

void cancellaNodoLista(pizza l, int distanza);

void eliminaElementoLista(ingrediente del);

void inserisciNodoFondoLista(pizza l, int payload);

void creaCopiaLista(pizza copyTo, pizza copyFrom);

ingrediente indiceDatoContenutoInLista(pizza l, int needle);

void stampaNomiLista(pizza l, tabella nome);

void stampaLista(pizza l);

void cancellaLista(pizza l);

#endif
