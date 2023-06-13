#include <stdio.h>
#include <stdlib.h>
#include "liste.h"

void createLista(lista l) {
	l = (lista)malloc(sizeof(nodo));

	if(l==NULL) {
		fprintf(stderr, "Impossibile allocare la lista\n");
		exit(EXIT_FAILURE);
	}

	l->data = 0;
	l->next = l;
	l->pre = l;
}

int recuperaLunghezzaLista(lista l) {
	int i=0;

	do {
		i++;
	}
	while(l->next != l);

	return i;
}

void inserisciElementoLista(lista l, int distanza, int payload) {
	int i=0;
	lista indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della lista\n");
			exit(EXIT_FAILURE);
		}
		i++;
	}

	indiceMovente->data = payload;
}

int leggiElementoLista(lista l, int distanza) {
	int i=0;
	int data;
	lista indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della lista\n");
			exit(EXIT_FAILURE);
		}
		i++;
	}

	data = indiceMovente->data;

	return data;
}

void inserisciNodoLista(lista l, int distanza, int payload) {
	int i=0;
	lista indiceMovente;
	/* vero che nodo* è lista ma rende più chiaro */
	nodo* nodoDaInserire;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della lista\n");
			exit(EXIT_FAILURE);
		}
		i++;
	}

	nodoDaInserire = (nodo*)malloc(sizeof(nodo));
	nodoDaInserire->data = payload;

	/* nuovo nodo viene da indiceMovente */
	nodoDaInserire->pre = indiceMovente;
	/* nuovo nodo va dove andava indiceMoventen */
	nodoDaInserire->next = indiceMovente->next;
	/* indice movente va a nuvo nodo*/
	indiceMovente->next = nodoDaInserire;
	/* quello che era dopo indiceMovente ora ha come pre il nuovo nodo */
	nodoDaInserire->next->pre = nodoDaInserire;
}

void cancellaNodoLista(lista l, int distanza) {
	int i=0;
	lista indiceMovente;

	if(distanza < 0) {
		fprintf(stderr, "La distanza deve essere almeno 0\n");
		exit(EXIT_FAILURE);
	}

	indiceMovente = l;
	while(i!=distanza) {
		if(indiceMovente->next == l) {
			fprintf(stderr, "Distanza maggiore della lunghezza della lista\n");
			exit(EXIT_FAILURE);
		}
		i++;
	}

	indiceMovente->pre->next = indiceMovente->next;
	indiceMovente->next->pre = indiceMovente->pre;

	free(indiceMovente);
}

void inserisciNodoFondoLista(lista l, int payload) {
	nodo *nuovoNodo;

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

void stampaLista(lista l) {
	lista indiceMovente;

	indiceMovente = l;
	do {
		fprintf(stdout, "%d -> ", indiceMovente->data);
	}
	while(indiceMovente->next != l);

	fprintf(stdout, "\n");
}

