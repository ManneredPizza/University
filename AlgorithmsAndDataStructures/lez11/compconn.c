/* compconn.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "grafo-fs.h"
#include "intqueue.h"
#include "intstack.h"


#define ROW_LENGTH 256


/* Prototipi delle procedure secondarie e definizione di tipi */

typedef int *vint;

/* Legge dalla linea di comando il file che contiene il grafo */
void InterpretaLineaComando (int argc, char *argv[], char *filedati);

/* Carica dal file filedati il grafo G, assumendo che sia orientato o no secondo il valore di Orientato */
void CaricaGrafo (char *filedati, grafo *pG, boolean Orientato);

/* Calcola le nc componenti connesse del grafo G e le salva in C */
void ComponentiConnesse (grafo *pG, vint C, int *pnc);

/* Stampa le nc componenti descritte dal vettore di marcatura C di lunghezza n */
void StampaComponenti (int nc, vint C, int n);

/* Visita in ampiezza il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void BFS (grafo *pG, nodo s, vint C, int c);

/* Visita in profondita' il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void DFS (grafo *pG, nodo s, vint C, int c);

/* Visita in modo ricorsivo in profondita' il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void DFSricorsiva (grafo *pG, nodo s, vint C, int c);


/* Programma principale */
int main (int argc, char *argv[])
{
  char filedati[ROW_LENGTH];
  grafo G;
  vint C;
  int nc;


  /* Legge da linea di comando il file che contiene il grafo */
  InterpretaLineaComando(argc,argv,filedati);

  /* Carica il grafo */
  CaricaGrafo(filedati,&G,FALSE);

  /* Stampa a video il grafo */
  printf("G = ");
  stampagrafo(&G);
  printf("\n");

  /* Crea una soluzione C vuota */
  nc = 0;
  C = (vint) calloc(G.n+1,sizeof(int));
  if (C == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore di marcatura C!\n");
    exit(EXIT_FAILURE);
  }

  /* Calcola le nc componenti connesse del grafo G e le salva in C */
  ComponentiConnesse(&G,C,&nc);

  /* Stampa le componenti connesse */
  StampaComponenti(nc,C,G.n);

  /* Dealloca le strutture dati dinamiche */
  distruggegrafo(&G);
  free(C);

  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */

/* Legge dalla linea di comando il file che contiene il grafo */
void InterpretaLineaComando (int argc, char *argv[], char *filedati)
{
  if (argc != 2)
  {
    fprintf(stderr,"Errore nella linea di comando!\n");
    exit(EXIT_FAILURE);
  }

  strcpy(filedati,argv[1]);
}


/* Carica dal file filedati il grafo G, assumendo che sia orientato o no secondo il valore di Orientato */
void CaricaGrafo (char *filedati, grafo *pG, boolean Orientato)
{
  FILE *fp;
  int o, d, n;

  /* Apre il file */
  fp = fopen(filedati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"Errore nell'apertura del file %s!\n",filedati);
    exit(EXIT_FAILURE);
  }

  /* Conta i nodi del grafo */
  n = 0;
  while (fscanf(fp," (%d,%d)",&o,&d) == 2)
  {
    if (o > n) n = o;
    if (d > n) n = d;
  }

  /* Crea il grafo, assumendo che gli indici dei nodi vadano da 1 a n */
  creagrafo(n,pG);

  /* Aggiunge gli archi del grafo */
  rewind(fp);
  while (fscanf(fp," (%d,%d)",&o,&d) == 2)
  {
    insarco(o,d,pG);
    if (!Orientato) insarco(d,o,pG);
  }

  /* Chiude il file */
  fclose(fp);
}


/* Calcola le nc componenti connesse del grafo G e le salva in C */
void ComponentiConnesse (grafo *pG, vint C, int *pnc)
{
  nodo s;


  *pnc = 0;
  for (s = 1; s <= pG->n; s++)
    if (C[s] == 0)
    {
      (*pnc)++;
      /*BFS(pG,s,C,*pnc);*/
      /*DFS(pG,s,C,*pnc);*/
      DFSricorsiva(pG,s,C,*pnc);
    }
}


/* Stampa le nc componenti descritte dal vettore di marcatura C di lunghezza n */
void StampaComponenti (int nc, vint C, int n)
{
  int i, c;


  printf("%d componenti\n",nc);
  printf("C = [ ");
  for (i = 1; i <= n; i++)
    printf("%d ",C[i]);
  printf("]\n");

  for (c = 1; c <= nc; c++)
  {
    printf("U[%d] = ",c);
    for (i = 1; i <= n; i++)
      if (C[i] == c) printf("%d ",i);
    printf("\n");
  }
}


/* Visita in ampiezza il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void BFS (grafo *pG, nodo s, vint C, int c)
{
  intqueue Q;
  nodo v, w;
  posarco pa;


  /* Crea una coda vuota */
  CreateQueue(&Q,pG->n);

  /* Marca la sorgente s e la inserisce nella coda */
  C[s] = c;
  Enqueue(s,&Q);

  /* Finche' la coda non e' vuota */
  while (!IsEmptyQueue(&Q))
  {
    /* Estrae l'elemento in testa alla coda */
    v = Front(&Q);
    Dequeue(&Q);

    /* Scorre i vertici adiacenti a tale elemento */
    for (pa = primoarcoFS(pG,v); !finearchiFS(pG,v,pa); pa = succarcoFS(pG,v,pa))
    {
      /* Se l'elemento adiacente non e' ancora stato visitato */
      w = leggedestarco(pG,v,pa);
      if (C[w] == 0)
      {
        /* Marca l'elemento adiacente e lo inserisce nella coda */
        C[w] = c;
        Enqueue(w,&Q);
      }
    }
  }

  DestroyQueue(&Q);
}


/* Visita in profondita' il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void DFS (grafo *pG, nodo s, vint C, int c)
{
  intstack S;
  nodo v, w;
  posarco pa;


  /* Crea una pila vuota */
  CreateStack(&S,pG->n);

  /* Marca la sorgente s e la inserisce nella pila */
  C[s] = c;
  Push(s,&S);

  /* Finche' la pila non e' vuota */
  while (!IsEmptyStack(&S))
  {
    /* Estrae l'elemento in cima alla pila */
    v = Top(&S);
    Pop(&S);

    /* Scorre i vertici adiacenti a tale elemento */
    for (pa = primoarcoFS(pG,v); !finearchiFS(pG,v,pa); pa = succarcoFS(pG,v,pa))
    {
      /* Se l'elemento adiacente non e' ancora stato visitato */
      w = leggedestarco(pG,v,pa);
      if (C[w] == 0)
      {
        /* Marca l'elemento adiacente e lo inserisce nella pila */
        C[w] = c;
        Push(w,&S);
      }
    }
  }
}


/* Visita in modo ricorsivo in profondita' il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void DFSricorsiva (grafo *pG, nodo s, vint C, int c)
{
  nodo w;
  posarco pa;


  /* Marca la sorgente s */
  C[s] = c;

  /* Scorre i vertici adiacenti alla sorgente */
  for (pa = primoarcoFS(pG,s); !finearchiFS(pG,s,pa); pa = succarcoFS(pG,s,pa))
  {
    /* Se l'elemento adiacente non e' ancora stato visitato */
    w = leggedestarco(pG,s,pa);
    if (C[w] == 0) DFSricorsiva(pG,w,C,c);
  }
}
