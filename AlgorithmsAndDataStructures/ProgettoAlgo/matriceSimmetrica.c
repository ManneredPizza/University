#include <stdio.h>
#include <stdlib.h>
#include "matrice.h"
#include "matriceSimmetrica.h"

/* istanzia un vettore di lunghezza size(size+1)/2 inizializzando tutte le entrate a 0 */
void inizializzaMatriceSimmetrica(matriceSimmetrica *m, int size) {
	m->size = size;
    m->data = (riga)calloc((size * (size + 1)) / 2, sizeof(int));
    if(m->data == NULL) {
    	fprintf(stderr, "Impossibile allocare la memoria\n");
    	exit(EXIT_FAILURE);
    }
}

/* data row e col inserisce il valore nella matrice */
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

/* data row e col legge il valore della matrice */
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

/* ritorna la dimensione di un lato della matrice simmetrica */
int leggiGrandezzaMatriceSimmetrica(matriceSimmetrica m) {
	return m.size;
}

/* dealloca lo spazio della matrice */
void cancellaMatriceSimmetrica(matriceSimmetrica *m) {
    free(m->data);
}
