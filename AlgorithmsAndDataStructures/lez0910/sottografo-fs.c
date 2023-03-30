/* sottografo.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "grafo-fs.h"


#define ROW_LENGTH 256


/* Prototipi delle procedure secondarie e definizione di tipi */

typedef int *vint;
typedef boolean *vboolean;

/* Legge da linea di comando il nome del file che contiene il grafo
   e gli indici dei nodi del sottografo */
void InterpretaLineaComando (int argc, char *argv[], char *filedati, vint *pS, int *pns);

/* Carica il grafo G dal file filedati */
void CaricaGrafo (char *filedati, grafo *pG);

/* Stampa a video il sottografo indotto sul grafo G dal sottoinsieme S di ns nodi */
void StampaSottografoIndotto (grafo *pG, vint S, int ns);

/* Determina se l'intero o appartiene alla tabella S di lunghezza ns */
boolean appartienetabella (int o, vint S, int ns);


/* Programma principale */
int main (int argc, char *argv[])
{
  char filedati[ROW_LENGTH];
  vint S;
  int ns;
  grafo G;


  /* Legge da linea di comando il nome del file che contiene il grafo
     e gli indici dei nodi del sottografo */
  InterpretaLineaComando(argc,argv,filedati,&S,&ns);

  /* Carica il grafo da file */
  CaricaGrafo(filedati,&G);

  /* Stampa a video il grafo */
  printf("G = ");
  stampagrafo(&G);
  printf("\n");

  /* Stampa a video il sottografo indotto */
  printf("G_S = ");
  StampaSottografoIndotto(&G,S,ns);
  printf("\n");

  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */

/* Legge da linea di comando il nome del file che contiene il grafo
   e gli indici dei nodi del sottografo */
void InterpretaLineaComando (int argc, char *argv[], char *filedati, vint *pS, int *pns)
{
  int p;

  /* Controlla il numero degli argomenti */
  if (argc < 2)
  {
    fprintf(stderr,"Errore nella linea di comando!\n");
    exit(EXIT_FAILURE);
  }

  /* Determina il nome del file dei dati */
  strcpy(filedati,argv[1]);

  /* Determina il numero di nodi del sottografo indotto */
  *pns = argc-2;

  /* Alloca il vettore dei nodi del sottografo indotto */
  *pS = (vint) calloc(*pns+1,sizeof(int));
  if (*pS == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore dei nodi del sottografo indotto!\n");
    exit(EXIT_FAILURE);
  }

  /* Riempie il vettore dei nodi del sottografo indotto */
  for (p = 1; p <= *pns; p++)
    if (sscanf(argv[p+1],"%d",&(*pS)[p]) != 1)
    {
      fprintf(stderr,"Errore nel formato della linea di comando!\n");
      exit(EXIT_FAILURE);
    }
}


/* Carica il grafo G dal file filedati */
void CaricaGrafo (char *filedati, grafo *pG)
{
  FILE *fp;
  int n;
  int o, d;


  /* Apre il file */
  fp = fopen(filedati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"Errore nell'apertura del file %s!\n",filedati);
    exit(EXIT_FAILURE);
  }

  /* Conta i nodi del grafo: legge gli archi e salva il massimo indice */
  n = 0;
  while (fscanf(fp," (%d ,%d )",&o,&d) == 2)
  {
    if (o > n) n = o;
    if (d > n) n = d;
  }

  /* Torna all'inizio del file */
  rewind(fp);

  /* Crea un grafo vuoto di n nodi */
  creagrafo(n,pG);

  /* Scorre gli archi inserendoli nel grafo */
  while (fscanf(fp," (%d ,%d )",&o,&d) == 2)
    insarco(o,d,pG);

  /* Chiude il file */
  fclose(fp);
}


/* Stampa a video il sottografo indotto sul grafo G dal sottoinsieme S di ns nodi */
void StampaSottografoIndotto (grafo *pG, vint S, int ns)
{
  nodo o, d;
  int io;/*, id;*/
  posarco pa;
  vboolean VS;

  /* Algoritmo 1 (scorrimento doppio dei nodi di N e valutazione di appartenenza
     di o e d a S e di (o,d) ad A) */
  /*for (o = 1; o <= pG->n; o++)
    for (d = 1; d <= pG->n; d++)
      if ( appartienetabella(o,S,ns) && appartienetabella(d,S,ns) &&
           esistearco(o,d,pG) ) printf("(%d,%d) ",o,d);
  */

  /* Algoritmo 2 (scorrimento dei nodi origine di N e valutazione di appartenenza di o a S
     scorrimento dei nodi destinazione di N e valutazione di appartenenza di d a S e di (o,d) ad A */
  /*for (o = 1; o <= pG->n; o++)
    if (appartienetabella(o,S,ns))
      for (d = 1; d <= pG->n; d++)
        if ( appartienetabella(d,S,ns) && esistearco(o,d,pG) ) printf("(%d,%d) ",o,d);*/

  /* Algoritmo 3 (scorrimento doppio degli indici in S, traduzione in nodi
     e valutazione di appartenenza di (o,d) ad A */
  /*for (io = 1; io <= ns; io++)
    for (id = 1; id <= ns; id++)
      if ( esistearco(S[io],S[id],pG) ) printf("(%d,%d) ",S[io],S[id]);*/

  /* Algoritmo 4 (scorrimento degli archi in A, determinazione degli estremi
     e valutazione di appartenenza di o e d a S) */
  /*for (pa = primoarco(pG); !finearchi(pG,pa); pa = succarco(pG,pa))
  {
    leggeestremiarco(pG,pa,&o,&d);
    if ( appartienetabella(o,S,ns) && appartienetabella(d,S,ns) ) printf("(%d,%d) ",o,d);
  }*/

  /* Algoritmo 4 (scorrimento degli archi in A, determinazione degli estremi
     e valutazione di appartenenza di o e d a S)
     con S implementato come vettore di incidenza */

  VS = (vboolean) calloc(pG->n+1,sizeof(boolean));
  if (VS == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore di incidenza di S!\n");
    exit(EXIT_FAILURE);
  }
  for (io = 1; io <= ns; io++)
    VS[S[io]] = TRUE;

  for (io = 1; io <= ns; io++)
  {
    o = S[io];
    for (pa = primoarcoFS(pG,o); !finearchiFS(pG,o,pa); pa = succarcoFS(pG,o,pa))
    {
      d = leggedestarco(pG,o,pa);
      if ( VS[d] ) printf("(%d,%d) ",o,d);
    }
  }

  free(VS);
}


/* Determina se l'intero o appartiene alla tabella S di lunghezza ns */
boolean appartienetabella (int o, vint S, int ns)
{
  int i;

  for (i = 1; i <= ns; i++)
    if (o == S[i]) return TRUE;

  return FALSE;
}
