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

boolean verificaStallo(Scacchiera S, char giocatore) {
    int i;
    int j; 
    /* non serve a nulla */
    validaMossa vm;

    vm.length = 0;

    for(i=0; i<BOARD_SIZE; i++) {
        for(j=0; j<BOARD_SIZE; j++) {
            if(S[i][j] != LIBERO)
                continue;
            if(verificaValiditaMossa(i, j, giocatore, &vm, S) == TRUE)
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

int verificaDirezione(int rigaOffset, int colonnaOffset, int riga, int colonna, char giocatore, Scacchiera S) {
    int i=rigaOffset;
    int j=colonnaOffset;
    int counter=0;
    boolean found=FALSE;

    /* con questo controllo posso usare lo stesso codice per ogni punto, anche quelli al bordo */
    while(riga+i>=0 && riga+i<BOARD_SIZE && colonna+j<BOARD_SIZE && colonna+j>=0) {
        if(S[riga+i][colonna+j] == LIBERO)
            break;
        if(S[riga+i][colonna+j] == giocatore) {
            found = TRUE;
            break;
        }
        counter++;
        i+=rigaOffset;
        j+=colonnaOffset;
    }

    if(found==TRUE)
        return counter;

    /* anche se incontro un po' di non-giocatore ritorno zero se non trovo giocatore ma un libero */
    return 0;
}  

boolean verificaValiditaMossa(int riga, int colonna, char giocatore, validaMossa *vm, Scacchiera S) {
    /* capire come controllare la validita' di una mossa */
    /* Se la sequenza di mosse non `e corretta, si deve stampare a video la mossa non lecita e il giocatore a cui `e stata attribuita */
    int i;
    int j;
    int counter = 0;
    int parziale;

    if(S[riga][colonna] != LIBERO)
        return FALSE;

    for(i=-1; i<2; i++) {
        for(j=-1; j<2; j++) {
            if(i!=0 || j!=0) {
                parziale = verificaDirezione(i, j, riga, colonna, giocatore, S);
                if(parziale != 0) {
                    (*vm).xOffset[vm->length] = i;
                    (*vm).yOffset[vm->length] = j;
                    vm->length++;
                }
                counter += parziale;
            }
        }
    }
        
    if(counter != 0)
        return TRUE;
    return FALSE;
}

void eseguiMossa(char *posizioneS, char giocatore, Scacchiera S) {
    posizione p;
    validaMossa vm;
    int i;
    int k;

    vm.length = 0;

    p = daScacchieraACoppia(posizioneS);

    if(verificaValiditaMossa(p.riga, p.colonna, giocatore, &vm, S) == FALSE) {
        fprintf(stderr, "Mossa %s eseguita da %c non e' valida\n", posizioneS, giocatore);
        exit(EXIT_FAILURE);
    }

    /* seg fault sicuro, il vettore dinamico non può essere passato */

    S[p.riga][p.colonna] = giocatore;

    for(i=0; i<vm.length; i++) {
        k=1;
        while(S[p.riga+vm.xOffset[i]*k][p.colonna+vm.yOffset[i]*k] != giocatore) {
            S[p.riga+vm.xOffset[i]*k][p.colonna+vm.yOffset[i]*k] = giocatore;
            k++;
        }
    }
}
