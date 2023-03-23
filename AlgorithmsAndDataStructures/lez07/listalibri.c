#include "listalibri.h"

lista crealista() {
	lista l;

	l=malloc(sizeof(elemento));

	if(l==NULL) {
		fprintf(stderr, "Impossibile allocare la listan\n");
		exit(EXIT_FAILURE);
	}

	l->succ = l;
	l->pred = l;
	strcpy(l->autoreTitolo, "");

	return l;
}

void distruggelista(lista *l) {
	posizione p;

	p = primolista(*l);
	while(!listavuota(*l)) {
		/* ove canclista stacca dealloca il primo elemento e sposta l all'elemento successivo */
		canclista(*l, &p);
	}

	free(*l);
}

void leggelista(lista l, posizione p, libro newLibro) {
	strcpy(newLibro, p->autoreTitolo);
}

lista scrivelista(lista l, posizione p, libro newLibro) {
	strcpy(p->autoreTitolo, newLibro);
	return l;
}

boolean listavuota(lista l) {
	return (l->succ == l);
}

posizione primolista(lista l) {
	return l->succ;
}

posizione ultimolista(lista l) {
	return l->pred;
}

posizione succlista(lista l, posizione p) {
	return p->succ;
}

posizione predlista(lista l, posizione p) {
	return p->pred;
}

boolean finelista(lista l, posizione p) {
	return (p == l);
}

lista inslista(lista l, posizione p, libro newLibro) {
	posizione newEl;

	newEl = malloc(sizeof(elemento));
	if(newEl == NULL) {
		fprintf(stderr, "Impossibile allocare la memoria\n");
		exit(EXIT_FAILURE);
	}

	strcpy(newEl->autoreTitolo, newLibro);

	p->pred->succ = newEl;
	newEl->pred = p->pred;
	newEl->succ = p;
	p->pred = newEl;

	return l;
}

lista canclista(lista l, posizione *p) {
	posizione tempP;

	tempP = *p;
	*p = tempP->succ;

	(*p)->pred = *p;

	tempP->succ = tempP;
	tempP->pred = tempP;

	l->succ = *p;

	free(tempP);

	return l;
}

void stampaLista(lista l) {
	posizione p;

	if(listavuota(l)) {
		fprintf(stderr, "La lista e' vuota\n");
		exit(EXIT_FAILURE);
	}

	p = primolista(l);
	while(!finelista(l, p)) {
		fprintf(stdout, "%s\n", p->autoreTitolo);
		fprintf(stdout, "\t|\n");
		fprintf(stdout, "\t|\n");
		fprintf(stdout, "\tv\n");
	}

	fprintf(stdout, "\n");
}
