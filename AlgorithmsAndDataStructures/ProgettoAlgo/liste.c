#include <stdio.h>
#include <stdlib.h>
#include "liste.h"

pizza creaLista(int payload) {
	pizza l;

	l = (pizza)malloc(sizeof(nodo));

	if(l==NULL) {
		fprintf(stderr, "Impossibile allocare la pizza\n");
		exit(EXIT_FAILURE);
	}

	l->data = payload;
	l->next = l;
	l->pre = l;

	return l;
}

void creaMenuLista(menu *m, int lunghezzaMaxMenu) {
	m->listaPizze = (pizza*)malloc(lunghezzaMaxMenu*sizeof(pizza));
	m->lunghezzaMaxMenu = lunghezzaMaxMenu;

	if(m==NULL) {
		fprintf(stderr, "Impossibile allocare il menu\n");
		exit(EXIT_FAILURE);
	}
}

void nuovaPizzaInMenu(menu *m, int index) {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index] = (pizza)malloc(sizeof(nodo));

	if(m->listaPizze[index]==NULL) {
		fprintf(stderr, "Impossibile allocare la pizza\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index]->data = 0;
	m->listaPizze[index]->next = m->listaPizze[index];
	m->listaPizze[index]->pre = m->listaPizze[index];
}

pizza leggiPizzaDaMenu(menu *m, int index)  {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	return m->listaPizze[index];
}

void cambiaPizza(menu *m, int index, pizza p) {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index] = p;
}

int recuperaLunghezzaLista(pizza l) {
	int i=1;
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->next != l) {
		i++;
		indiceMovente = indiceMovente->next;
	}

	return i;
}

ingrediente nextIngredienteLista(ingrediente l) {
	return l->next;
}

void inserisciElementoLista(pizza l, int payload) {
	if(l==NULL) {
		fprintf(stderr, "Il puntatore alla pizza non può essere nullo\n");
		exit(EXIT_FAILURE);
	}

	l->data = payload;
}

int leggiElementoLista(pizza l) {
	if(l==NULL) {
		fprintf(stderr, "Il puntatore alla pizza non può essere nullo\n");
		exit(EXIT_FAILURE);
	}

	return l->data;
}

void eliminaElementoLista(ingrediente del) {
	if(del == NULL) {
		return;
	}
	del->pre->next = del->next;
	del->next->pre = del->pre;

	free(del);
}

void inserisciNodoFondoLista(pizza l, int payload) {
	ingrediente nuovoNodo;

	nuovoNodo = (nodo*)malloc(sizeof(nodo));

	nuovoNodo->data = payload;

	/* il precedente del nuovo sarà il vecchio ultimo */
	nuovoNodo->pre = l->pre;
	/* il successivo del nuovo sarà il primo */
	nuovoNodo->next = l;
	/* il successivo del'ultimo sarà il nuovo */
	nuovoNodo->pre->next = nuovoNodo;
	/* il precedente del primo sarà l'ultimo */
	l->pre = nuovoNodo;
}

void creaCopiaLista(pizza copyTo, pizza copyFrom) {
	ingrediente indiceMoventeCopyFrom;

	indiceMoventeCopyFrom = copyFrom;

	copyTo->data = indiceMoventeCopyFrom->data;

	while(indiceMoventeCopyFrom->next != copyFrom) {
		indiceMoventeCopyFrom = indiceMoventeCopyFrom->next;
		inserisciNodoFondoLista(copyTo, indiceMoventeCopyFrom->data);
	}
}

ingrediente indiceDatoContenutoInLista(pizza l, int needle) {
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->data != needle) {
		if(indiceMovente->next == l) return NULL;
		indiceMovente = indiceMovente->next;
	}
	return indiceMovente;
}

void cancellaLista(pizza l) {
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->next != l) {
		indiceMovente = indiceMovente->next;
		free(indiceMovente->pre);
	}

	free(indiceMovente);
}

void cancellaMenu(menu *m) {
	free(m->listaPizze);
}
