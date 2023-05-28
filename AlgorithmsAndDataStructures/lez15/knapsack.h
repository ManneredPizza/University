#ifndef __knapsack_h
#define __knapsack_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "alloc.h"

#define ROW_LENGTH 256


typedef struct _datiKP datiKP;
struct _datiKP
{
  int n;
  int V;
  vint phi;
  vint v;
};

typedef struct _soluzioneKP soluzioneKP;
struct _soluzioneKP
{
  int f;
  vboolean x;
};

/* Carica dal file filedati l'istanza I del problema dello zaino */

/* Carica da filedati l'istanza I del problema dello zaino */
void CaricaDatiKP (char *filedati, datiKP *pI);

/* Distrugge l'istanza I */
void DistruggeDatiKP (datiKP *pI);

/* Crea una soluzione vuota */
void CreaSoluzioneKP (int n, soluzioneKP *pS);

/* Distrugge la soluzione S */
void DistruggeSoluzioneKP(soluzioneKP *pS);

/* Stampa la soluzione */
void StampaSoluzioneKP (int n, soluzioneKP *pS);


#endif
