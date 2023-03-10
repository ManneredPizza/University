#ifndef __SCACCHIERA_H
#define __SCACCHIERA_H

typedef int boolean;
#define TRUE 1
#define FALSE 0

#define BOARD_SIZE 8
#define BIANCO 'B'
#define NERO 'N'
#define LIBERO '-'

#define MOVE_LENGTH 2

#define NEIGH_SIZE 8

/* prototipi delle funzioni secondarie */
typedef char Scacchiera[BOARD_SIZE][BOARD_SIZE];

/* coppia di numeri utile per la posizione */
typedef struct {
    int riga;
    int colonna;
} posizione;

/* tiene traccia delle direzioni in cui si devono effettuare le modifiche */
typedef struct {
    int xOffset[NEIGH_SIZE];
    int yOffset[NEIGH_SIZE];
    int length;
} validaMossa;

/* inizializza la scacchiera a solo simboli LIBERO tranne le condizioni di partenza centrali */
void inizializzaScacchiera(Scacchiera S);

/* stampa la scacchiera a schermo*/
void stampaScacchiera(Scacchiera S);

/* stampa numero dei NERI numero dei BIANCHI ed il vincitore */
void stampaStatoScacchiera(Scacchiera S);

/* verifica stallo data la scacchiera ed il giocatore */
boolean verificaStallo(Scacchiera S, char giocatore);

/* prende posizioni del tipo a5 e restituisce la coppia (0,4) */
posizione daScacchieraACoppia(char *posizioneS);

/* dato un vettore verso cui muoversi conta il numero di pedine del colore opposto presenti prima di quella del colore del giocatore */
int verificaDirezione(int rigaOffset, int colonnaOffset, int riga, int colonna, char giocatore, Scacchiera S);

/* verifica che la mossa richiesta possa essere eseguita */
boolean verificaValiditaMossa(int riga, int colonna, char giocatore, validaMossa *vm, Scacchiera S);

/* inserisce il giocatore nella posizione richiesta (non ne controlla la validita') */
void eseguiMossa(char *posizioneS, char giocatore, Scacchiera S);

#endif
