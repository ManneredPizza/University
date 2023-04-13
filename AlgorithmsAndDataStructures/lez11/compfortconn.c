/* compconn.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "grafo-fs.h"


#define ROW_LENGTH 256


/* Prototipi delle procedure secondarie e definizione di tipi */

typedef int *vint;

/* Legge dalla linea di comando il file che contiene il grafo */
void InterpretaLineaComando (int argc, char *argv[], char *filedati);

/* Carica dal file filedati il grafo G, assumendo che sia orientato o no secondo il valore di Orientato */
void CaricaGrafo (char *filedati, grafo *pG, boolean Orientato);

/* Stampa le nc componenti conservate nel vettore C di lunghezza n */
void StampaComponenti (int nc, vint C, int n);

/* Determina le nc componenti fortemente connesse del grafo G nel vettore C */
void ComponentiFortementeConnesse (grafo *pG, vint C, int *pnc);

/* Visita in modo ricorsivo in profondita' il grafo G a partire dalla sorgente s marcando i vertici visitati in C con l'indice c */
void DFSricorsiva (grafo *pG, nodo s, vint C, int c);

/* Costruisce il grafo GT trasposto del grafo G */
void CostruisceGrafoTrasposto (grafo *pG, grafo *pGT);

/* Interseca i vettori di incidenza U1 e U2 di lunghezza n e copia in V i loro valori comuni */
void Intersezione (vint U1, vint U2, vint V, int n);


/* Programma principale */
int main (int argc, char *argv[])
{
  char filedati[ROW_LENGTH];
  grafo G;
  vint C;
  int nc;


  /* Legge da linea di comando il file che contiene il grafo da visitare */
  InterpretaLineaComando(argc,argv,filedati);

  /* Carica il grafo */
  CaricaGrafo(filedati,&G,TRUE);

  /* Stampa a video il grafo */
  printf("Grafo: ");
  stampagrafo(&G);
  printf("\n");

  /* Crea una soluzione C vuota */
  nc = 0;
  C = (vint) calloc(G.n+1,sizeof(int));
  if (C == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore C!\n");
    exit(EXIT_FAILURE);
  }

  /* Determina le nc componenti fortemente connesse del grafo G nel vettore C */
  ComponentiFortementeConnesse(&G,C,&nc);

  /* Stampa le componenti fortemente connesse del grafo G */
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
  nodo o, d;
  int n;


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


/* Stampa le nc componenti conservate nel vettore di marcatura C di lunghezza n */
void StampaComponenti (int nc, vint C, int n)
{
  int v, c;

  printf("%d componenti\n",nc);
  printf("C = [ ");
  for (v = 1; v <= n; v++)
    printf("%d ",C[v]);
  printf("]\n");

  for (c = 1; c <= nc; c++)
  {
    printf("U[%d] = ",c);
    for (v = 1; v <= n; v++)
      if (C[v] == c) printf("%d ",v);
    printf("\n");
  }
}


/* Determina le nc componenti connesse del grafo G nel vettore C */
void ComponentiFortementeConnesse (grafo *pG, vint C, int *pnc)
{
  nodo s, v;
  vint U1, U2;
  grafo GT;


  U1 = (vint) calloc(pG->n+1,sizeof(int));
  if (U1 == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore U1!\n");
    exit(EXIT_FAILURE);
  }

  U2 = (vint) calloc(pG->n+1,sizeof(int));
  if (U2 == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore U2!\n");
    exit(EXIT_FAILURE);
  }

  /* Costruisce il grafo trasposto */
  CostruisceGrafoTrasposto(pG,&GT);

  *pnc = 0;
  for (s = 1; s <= pG->n; s++)
    if (C[s] == 0)
    {
      (*pnc)++;

      /* Visita il grafo */
      for (v = 1; v <= pG->n; v++)
        U1[v] = 0;
      DFSricorsiva(pG,s,U1,*pnc);

      /* Visita il grafo */
      for (v = 1; v <= pG->n; v++)
        U2[v] = 0;
      DFSricorsiva(&GT,s,U2,*pnc);

      /* Interseca i vettori di incidenza U1 e U2 e copia in C i loro valori comuni */
      Intersezione(U1,U2,C,pG->n);
    }

  free(U1);
  free(U2);
  distruggegrafo(&GT);
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


/* Costruisce il grafo GT trasposto del grafo G */
void CostruisceGrafoTrasposto (grafo *pG, grafo *pGT)
{
  nodo o, d;
  posarco pa;


  /* Crea un grafo con lo stesso numero di nodi di G */
  creagrafo(pG->n,pGT);

  /* Scorre gli archi di G e aggiunge a GT gli archi opposti */
  for (o = 1; o <= pG->n; o++)
    for (pa = primoarcoFS(pG,o); !finearchiFS(pG,o,pa); pa = succarcoFS(pG,o,pa))
    {
      d = leggedestarco(pG,o,pa);
      insarco(d,o,pGT);
    }
}


/* Interseca i vettori di incidenza U1 e U2 di lunghezza n e copia in V i loro valori comuni */
void Intersezione (vint U1, vint U2, vint V, int n)
{
  int i;


  for (i = 1; i <= n; i++)
    if ( (U1[i] > 0) && (U2[i] > 0) ) V[i] = U1[i];
}







