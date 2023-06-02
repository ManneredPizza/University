#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"
#include "matrice.h"

void interpretaLineaComando(int argc, char *argv[], char *nomeFileIngredienti, char *nomeFilePreferenze);
void letturaElementiDaFile(char *nomeFile, tabella *t, tabella *listaIngredienti);

int main(int argc, char *argv[]) {
    char nomeFileIngredienti[ROW_LENGTH];
    char nomeFileClienti[ROW_LENGTH];
    tabella ingredienti;
    tabella clienti;

    /* Lettura dati da linea di comando */
    interpretaLineaComando(argc, argv, nomeFileIngredienti, nomeFileClienti);

    /* Lettura lista ingredienti */
    letturaElementiDaFile(nomeFileIngredienti, &ingredienti, NULL);

    /* Lettura lista preferenze */
    letturaElementiDaFile(nomeFileClienti, &clienti, &listaIngredienti);

    stampaTabella(ingredienti);
    /*  */
    return EXIT_SUCCESS;
}

void interpretaLineaComando(int argc, char *argv[], char *nomeFileIngredienti, char *nomeFilePreferenze) {
    if (argc != 3) {
        fprintf(stderr, "Errore nella linea di comando!\n");
        exit(EXIT_FAILURE);
    }

    strcpy(nomeFileIngredienti,argv[1]);
    strcpy(nomeFilePreferenze,argv[2]);
}

void letturaElementiDaFile(char *nomeFile, tabella *t, tabella *listaIngredienti) {
    FILE *file;
    int numeroElementi;
    int i;
    char elemento[LUNGHEZZA_ELEMENTO];

    file = fopen(nomeFile, "r");
    if(file == NULL) {
        fprintf(stderr, "Errore nell'apertura del file\n");
        exit(EXIT_FAILURE);
    }

    fscanf(file, "%d", &numeroElementi);

    inizializzaTabella(t);

    for(i=0; i<numeroElementi; i++) {
        fscanf(file, "%s", elemento);
        inserimentoElemento(elemento, t);

        if(listaIngredienti != NULL) {
            /* ho altre 3 righe da gestire, Richiesta, Gradito, Escluso */
            printf("d");
        }
    }
}
