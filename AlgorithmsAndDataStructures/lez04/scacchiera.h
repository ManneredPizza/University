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

/* prototipi delle funzioni secondarie */
typedef char Scacchiera[BOARD_SIZE][BOARD_SIZE];

/* coppia di numeri utile per la posizione */
typedef struct {
    int riga;
    int colonna;
} posizione;

/* inizializza la scacchiera a solo simboli LIBERO tranne le condizioni di partenza centrali */
void inizializzaScacchiera(Scacchiera S);

/* stampa la scacchiera a schermo*/
void stampaScacchiera(Scacchiera S);

/* stampa numero dei NERI numero dei BIANCHI ed il vincitore */
void stampaStatoScacchiera(Scacchiera S);

/* prende un punto di un giocatore e conta in quanti punti puo' giocare */
int numeroCelleValideIntorno(int riga, int colonna, Scacchiera S);

/* verifica stallo data la scacchiera ed il giocatore */
boolean verificaStallo(Scacchiera S, char giocatore);

/* prende posizioni del tipo a5 e restituisce la coppia (0,4) */
posizione daScacchieraACoppia(char *posizioneS);

/* verifica che la mossa richiesta possa essere eseguita */
boolean verificaValiditaMossa(int riga, int colonna, Scacchiera S);

/* inserisce il giocatore nella posizione richiesta (non ne controlla la validita') */
void eseguiMossa(char *posizioneS, char giocatore, Scacchiera S);

#endif
