#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"

void inizializzaTabella(tabella *t) {
	t->V = (char **)malloc(sizeof(char*));
	t->V[0] = (char*)malloc((LUNGHEZZA_ELEMENTO + 1)*sizeof(char));
	t->maxLength = ROW_LENGTH;
	t->length = 0;
}


void inserimentoElemento(char *elemento, tabella *t) {
    if(sprintf(t->V[t->length], "%s", elemento) > 0) {
        if(t->length == t->maxLength-1) {
            fprintf(stdout, "Max lunghezza raggiunta%d\n", ROW_LENGTH);
            return;
        }
        t->length++;
        t->V = (char **)realloc(t->V, sizeof(char*)*(t->length+1));
        t->V[t->length] = (char*)malloc((LUNGHEZZA_ELEMENTO + 1)*sizeof(char));
    }
    else {
        fprintf(stderr, "Impossibile inserire ingrediente vuoto\n", ROW_LENGTH);
        exit(EXIT_FAILURE);
    }
}

int trovaIndiceDaContenuto(char *elemento, tabella *t) {
    int i;

    for(i=0; i<t->length; i++) {
        if(strcmp(elemento, t->V[i]) == 0) {
            return i;
        }
    }
    return -1;
}

void stampaTabella(tabella t) {
	int i;

	for(i=0; i<t.length; i++) {
		fprintf(stdout, "%s\n", t.V[i]);
	}
}
