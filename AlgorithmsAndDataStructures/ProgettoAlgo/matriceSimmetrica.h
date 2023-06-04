#ifndef __MATRICESIMMETRICA_H
#define __MATRICESIMMETRICA_H

struct _matriceSimmetrica {
    int size; /* numero elementi pari a n*(n-1)/2 con n lato se fosse stata completa */
    riga data; /* i dati li metto in riga so quanto occupano intanto */
};
typedef struct _matriceSimmetrica matriceSimmetrica;

void inizializzaMatriceSimmetrica(matriceSimmetrica *m, int size);

void inserisciValoreMatriceSimmetrica(matriceSimmetrica *m, int row, int col, int valore);

int leggiValoreMatriceSimmetrica(matriceSimmetrica m, int row, int col);

int leggiGrandezzaMatriceSimmetrica(matriceSimmetrica m);

void stampaMatriceSimmetrica(matriceSimmetrica m);

void cancellaMatriceSimmetrica(matriceSimmetrica *m);

#endif
