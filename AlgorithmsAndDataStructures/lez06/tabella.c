#include <stdio.h>
#include <stdlib.h>
#include "tabella.h"

void inizializzaTabella(tabella *t) {
	t->V = (int *)malloc(sizeof(int));
	t->maxLength = ROW_LENGTH;
	t->length = 1;
}

void letturaDaFile(FILE *fpNumeri, tabella *t) {
	while(fscanf(fpNumeri, "%d", &(t->V[t->length-1])) == 1) {
		t->length++;
		t->V = (int *)realloc(t->V, sizeof(int)*t->length);

		if(t->length == t->maxLength) {
			fprintf(stdout, "Max lunghezza raggiunta, continuo esecuzione alla lettura della riga %d\n", ROW_LENGTH);
			break;
		}
	}

	t->length--;
}

int trovaIndiceMassimo(tabella t, int n) {
	int index=0;
	int i=0;

	for( ; i<=n; i++) {
		if(t.V[i] > t.V[index]) {
			index = i;
		}
	}

	return index;
}

void scambia(int *a, int *b) {
	int temp;

	temp = *a;
	*a = *b;
	*b = temp;
}

void stampaTabella(tabella t) {
	int i;

	for(i=0; i<t.length; i++) {
		fprintf(stdout, "%d\n", t.V[i]);
	}
}
