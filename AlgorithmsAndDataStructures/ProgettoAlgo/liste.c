#include <stdio.h>
#include <stdlib.h>
#include "liste.h"

void createLista(pizza l) {
	l = (pizza)malloc(sizeof(nodo));

	if(l==NULL) {
		fprintf(stderr, "Impossibile allocare la pizza\n");
		exit(EXIT_FAILURE);
	}

	l->data = 0;
	l->next = l;
	l->pre = l;
}

void creaMenuLista(menu m, int lunghezzaMaxMenu) {
	m = (menu)malloc(lunghezzaMaxMenu*sizeof(pizza));

	if(m==NULL) {
		fprintf(stderr, "Impossibile allocare il menu\n");
		exit(EXIT_FAILURE);
	}
}

int recuperaLunghezzaLista(pizza l) {
	int i=0;

	do {
		i++;
	}
	while(l->next != l);

	return i;
}

void inserisciElementoLista(pizza l, int distanza, int payload) {
	int i=0;
	pizza indiceMovente;

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
	}

	indiceMovente->data = payload;
}

int leggiElementoLista(pizza l, int distanza) {
	int i=0;
	int data;
	pizza indiceMovente;

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
	}

	data = indiceMovente->data;

	return data;
}

void inserisciNodoLista(pizza l, int distanza, int payload) {
	int i=0;
	pizza indiceMovente;
	/* vero che nodo* è pizza ma rende più chiaro */
	nodo* nodoDaInserire;

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
	pizza indiceMovente;

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
	}

	indiceMovente->pre->next = indiceMovente->next;
	indiceMovente->next->pre = indiceMovente->pre;

	free(indiceMovente);
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
}

void stampaLista(pizza l) {
	pizza indiceMovente;

	indiceMovente = l;
	do {
		fprintf(stdout, "%d -> ", indiceMovente->data);
	}
	while(indiceMovente->next != l);

	fprintf(stdout, "\n");
}

