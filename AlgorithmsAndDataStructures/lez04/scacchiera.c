#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "scacchiera.h"

void inizializzaScacchiera(Scacchiera S) {
    int i;
    int j;
    for(i=0; i<BOARD_SIZE; i++) {
        for(j=0; j<BOARD_SIZE; j++) {
            S[i][j] = LIBERO;
        }
    }

    S[BOARD_SIZE/2-1][BOARD_SIZE/2-1] = BIANCO;
    S[BOARD_SIZE/2][BOARD_SIZE/2] = BIANCO;

    S[BOARD_SIZE/2-1][BOARD_SIZE/2] = NERO;
    S[BOARD_SIZE/2][BOARD_SIZE/2-1] = NERO;
}

void stampaScacchiera(Scacchiera S) {
    int i;
    int j;

    fprintf(stdout, "\t");
    for(i=0; i<BOARD_SIZE; i++)
        fprintf(stdout, "%c\t", 'a'+i);

    fprintf(stdout, "\n");
    for(i=0; i<BOARD_SIZE; i++) {
        fprintf(stdout, "%d\t", i+1);
        for(j=0; j<BOARD_SIZE; j++) {
            fprintf(stdout, "%c\t", S[i][j]);
        }
        fprintf(stdout, "\n");
    }
    fprintf(stdout, "\n");
}

void stampaStatoScacchiera(Scacchiera S) {
    int i;
    int j;
    int numNeri = 0;
    int numBianchi = 0;

    for(i=0; i<BOARD_SIZE; i++) {
        for(j=0; j<BOARD_SIZE; j++) {
            if(S[i][j] == BIANCO)
                numBianchi++;
            if(S[i][j] == NERO)
                numNeri++;
        }
    }

    fprintf(stdout, "%d pedine bianche\n", numBianchi);
    fprintf(stdout, "%d pedine nere\n", numNeri);

    if(numBianchi > numNeri)
        fprintf(stdout, "Vince il Bianco\n");
    else if(numNeri > numBianchi)
        fprintf(stdout, "Vince il Nero\n");
    else
        fprintf(stdout, "Pareggio\n");
}

int numeroCelleValideIntorno(int riga, int colonna, Scacchiera S) {
    /* capire come controllare in maniera efficiente l'intorno dato un punto di partenza valido */

    return 0;
}

boolean verificaStallo(Scacchiera S, char giocatore) {
    int i;
    int j;

    for(i=0; i<BOARD_SIZE; i++) {
        for(j=0; j<BOARD_SIZE; j++) {
            if(S[i][j] == LIBERO)
                continue;
            if(numeroCelleValideIntorno(i, j, S) > 0)
                return FALSE;
        }
    }

    return TRUE;
}

/* da aggiungere controllo errori in caso posizioneS non punti ad un vettore di 2 elementi */
posizione daScacchieraACoppia(char *posizioneS) {
    posizione p;

    if(posizioneS == NULL) {
        fprintf(stderr, "Il puntatore posizioneS non punta a nulla\n");
        exit(EXIT_FAILURE);
    }

    p.riga = posizioneS[MOVE_LENGTH-1] - '1';
    p.colonna = posizioneS[MOVE_LENGTH-2] - 'a';

    return p;
}

boolean verificaValiditaMossa(int riga, int colonna, Scacchiera S) {
    /* capire come controllare la validita' di una mossa */
    /* Se la sequenza di mosse non `e corretta, si deve stampare a video la mossa non lecita e il giocatore a cui `e stata attribuita */

    return TRUE;
}

void eseguiMossa(char *posizioneS, char giocatore, Scacchiera S) {
    posizione p;

    p = daScacchieraACoppia(posizioneS);

    if(verificaValiditaMossa(p.riga, p.colonna, S) == FALSE) {
        fprintf(stderr, "Mossa %s eseguita da %c non e' valida\n", posizioneS, giocatore);
        exit(EXIT_FAILURE);
    }

    S[p.riga][p.colonna] = giocatore;
}
