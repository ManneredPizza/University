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

void inserisciElementoLista(pizza l, int distanza, int payload) {
	int i=0;
	ingrediente indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della pizza\n");
			exit(EXIT_FAILURE);
		}
		i++;
		indiceMovente = indiceMovente->next;
	}

	indiceMovente->data = payload;
}

int leggiElementoLista(pizza l, int distanza) {
	int i=0;
	int data;
	ingrediente indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della pizza\n");
			exit(EXIT_FAILURE);
		}
		i++;
		indiceMovente = indiceMovente->next;
	}

	data = indiceMovente->data;

	return data;
}

void inserisciNodoLista(pizza l, int distanza, int payload) {
	int i=0;
	ingrediente indiceMovente;
	/* vero che nodo* è pizza ma rende più chiaro */
	ingrediente nodoDaInserire;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della pizza\n");
			exit(EXIT_FAILURE);
		}
		i++;
		indiceMovente = indiceMovente->next;
	}

	nodoDaInserire = (nodo*)malloc(sizeof(nodo));
	nodoDaInserire->data = payload;

	/* nuovo nodo viene da indiceMovente */
	nodoDaInserire->pre = indiceMovente;
	/* nuovo nodo va dove andava indiceMovente */
	nodoDaInserire->next = indiceMovente->next;
	/* indice movente va a nuvo nodo */
	indiceMovente->next = nodoDaInserire;
	/* quello che era dopo indiceMovente ora ha come pre il nuovo ingrediente */
	nodoDaInserire->next->pre = nodoDaInserire;
}

void cancellaNodoLista(pizza l, int distanza) {
	int i=0;
	ingrediente indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della pizza\n");
			exit(EXIT_FAILURE);
		}
		i++;
		indiceMovente = indiceMovente->next;
	}

	indiceMovente->pre->next = indiceMovente->next;
	indiceMovente->next->pre = indiceMovente->pre;

	free(indiceMovente);
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

void stampaNomiLista(pizza l, tabella nome) {
	ingrediente indiceMovente;

	indiceMovente = l;
	do {
        fprintf(stdout, "%s ", leggiValoreTabella(nome, indiceMovente->data));
		indiceMovente = indiceMovente->next;
	}
	while(indiceMovente != l);

	fprintf(stdout, "\n");
}

void stampaLista(pizza l) {
	ingrediente indiceMovente;

	indiceMovente = l;
	do {
		fprintf(stdout, "%d -> ", indiceMovente->data);
		indiceMovente = indiceMovente->next;
	}
	while(indiceMovente != l);

	fprintf(stdout, "\n");
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
