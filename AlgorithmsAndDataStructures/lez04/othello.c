#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "scacchiera.h"

#define ROW_LENGTH 256

/* prototipi delle funzioni secondarie */
void letturaDatiDaTerminale(int argc, char *argv[], char *nomeFileMosse);
void othello(char *nomeFileMosse, Scacchiera S);

int main(int argc, char *argv[]) {
    /* sezione dichiarazioni variabili */
    char nomeFileMosse[ROW_LENGTH];
    Scacchiera S;

    /* leggo nome del file */
    letturaDatiDaTerminale(argc, argv, nomeFileMosse);

    /* set della condizione iniziale */
    inizializzaScacchiera(S);

    othello(nomeFileMosse, S);

    stampaScacchiera(S);

    stampaStatoScacchiera(S);

    return EXIT_SUCCESS;
}

void letturaDatiDaTerminale(int argc, char *argv[], char *nomeFileMosse) {
    if(argc == 1 || argc > 2) {
        fprintf(stderr, "Errore nel numero di dati forniti\n");
        exit(EXIT_FAILURE);
    }
    strcpy(nomeFileMosse, argv[1]);
}

void othello(char *nomeFileMosse, Scacchiera S) {
    FILE *fp_filemosse;
    /* il +1 e' per lo spazio */
    char mossa[MOVE_LENGTH+1];
    char giocatore = NERO;

    fp_filemosse = fopen(nomeFileMosse, "r");

    if(fp_filemosse == NULL) {
        fprintf(stderr, "Errore apertura file \n");
        exit(EXIT_FAILURE);
    }

    while(fscanf(fp_filemosse, "%s", mossa) == 1) {
        if(strcmp(mossa, "--") == 0) {
            if(verificaStallo(S, giocatore) == FALSE) {
                fprintf(stderr, "Chiamato stallo da giocatore %c quando era presente una mossa valida\n", giocatore);
                exit(EXIT_FAILURE);
            }
            continue;
        }

        eseguiMossa(mossa, giocatore, S);

        if(giocatore == NERO)
            giocatore = BIANCO;
        else
            giocatore = NERO;
    }
}
