#include <stdio.h>
#include <stdlib.h>
#include "matrice.h"
#include "matriceSimmetrica.h"

void inizializzaMatriceSimmetrica(matriceSimmetrica *m, int size) {
	m->size = size;
    m->data = (riga)calloc((size * (size + 1)) / 2, sizeof(int));
    if(m->data == NULL) {
    	fprintf(stderr, "Impossibile allocare la memoria\n");
    	exit(EXIT_FAILURE);
    }
}

void inserisciValoreMatriceSimmetrica(matriceSimmetrica *m, int row, int col, int valore) {
	int index;

	if(row >= m->size || col >= m->size) {
		fprintf(stderr, "Indici row o col troppo grandi\n");
		exit(EXIT_FAILURE);
	}

    if (row >= col) { /* siamo nella triangolare inferiore */
		index = (row * (row + 1)) / 2 + col;
        m->data[index] = valore;
    } 
	else { /* siamo nella triangolare sup. */
        index = (col * (col + 1)) / 2 + row;
        m->data[index] = valore;
    }
}

int leggiValoreMatriceSimmetrica(matriceSimmetrica m, int row, int col) {
	int index;

	if(row >= m.size || col >= m.size) {
		fprintf(stderr, "Indici row o col troppo grandi\n");
		exit(EXIT_FAILURE);
	}

    if (row >= col) { /* siamo nella triangolare inferiore */
		index = (row * (row + 1)) / 2 + col;
        return m.data[index];
    } 
	else { /* siamo nella triangolare sup. */
        index = (col * (col + 1)) / 2 + row;
        return m.data[index];
    }
}

int leggiGrandezzaMatriceSimmetrica(matriceSimmetrica m) {
	return m.size;
}

void stampaMatriceSimmetrica(matriceSimmetrica m) {
	int i,j;

	for(i=0; i<m.size; i++) {
		for(j=0; j<=i; j++) {
			fprintf(stdout, "%d\t", m.data[i*(i+1)/2+j]);
		}
		fprintf(stdout, "\n");
	}
}

void cancellaMatriceSimmetrica(matriceSimmetrica *m) {
    free(m->data);
}
