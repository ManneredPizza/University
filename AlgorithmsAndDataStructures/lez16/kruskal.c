/* kruskal.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>


#define ROW_LENGTH 256

#include "grafo-la.h"
#include "alloc.h"


typedef nodo * vnodo;
typedef posarco * vposarco;

typedef struct _soluzioneMSTP soluzioneMSTP;
struct _soluzioneMSTP
{
  int f;
  int dim;
  int nl;
  vnodo v1;
  vnodo v2;
};

/* Prototipi delle procedure secondarie */

void InterpretaLineaComando (int argc, char *argv[], char *filedati);

/* Carica da filedati il grafo G */
void CaricaDati (char *filedati, grafo *pG);

/* Crea una soluzione vuota */
void CreaSoluzione (int n, soluzioneMSTP *pS);

/* Distrugge la soluzione S */
void DistruggeSoluzione (soluzioneMSTP *pS);

/* Stampa la soluzione */
void StampaSoluzione (soluzioneMSTP *pS);

/* Risolve l'istanza G del MSTP con l'algoritmo di Kruskal restituendo la soluzione S */
void Kruskal (grafo *pG, soluzioneMSTP *pS);

/* Crea un heap indiretto di lunghezza n attraverso il vettore di posizioni Pos sui lati del grafo G */
void creaheapindiretto (vposarco Pos, int n, grafo *pG);

/* Aggiorna l'heap indiretto di lunghezza n descritto dal vettore di posizioni Pos
   sui lati del grafo G a partire dalla posizione i */
void aggiornaheapindiretto (vposarco Pos, int n, grafo *pG, int i);

/* Trova la componente cui appartiene l'elemento i nella foresta con bilanciamento descritta da padre e num */
int Find (int i, vint padre, vint num);

/* Unisce le componenti radicate in c1 e c2 nella foresta con bilanciamento descritta da padre e num
   (non controlla che siano diverse!) */
void Union (int c1, int c2, vint padre, vint num);

/* Scambia i valori di due variabili di tipo posarco a e b */
void Scambia (posarco *pa, posarco *pb);


/* Programma principale */
int main (int argc, char *argv[])
{
  /* Parte dichiarativa */
  char filedati[ROW_LENGTH];
  grafo G;
  soluzioneMSTP S;
  clock_t inizio, fine;
  double tempo;


  /* Parte esecutiva */
  InterpretaLineaComando(argc,argv,filedati);

  /* Carica i dati */
  CaricaDati(filedati,&G);

  /* Crea una soluzione vuota */
  CreaSoluzione(G.n-1,&S);

  /* Risolve il problema dell'albero ricoprente minimo sul grafo G */
  inizio = clock();
  Kruskal(&G,&S);
  fine = clock();
  tempo = ((double) (fine - inizio))/CLOCKS_PER_SEC;

  /* Stampa il tempo di calcolo e la soluzione */
  printf("CPU = %f\n",tempo);
  StampaSoluzione(&S);

  /* Dealloca le strutture dati dinamiche */
  distruggegrafo(&G);
  DistruggeSoluzione(&S);

  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */

void InterpretaLineaComando (int argc, char *argv[], char *filedati)
{
  if (argc != 2)
  {
    fprintf(stderr,"Errore nella linea di comando!\n");
    fprintf(stderr,"%s [filedati]\n",argv[0]);
    exit(EXIT_FAILURE);
  }

  strcpy(filedati,argv[1]);
}


/* Carica da filedati il grafo G */
void CaricaDati (char *filedati, grafo *pG)
{
  FILE *fp;
  int n, m, e;
  nodo u, v;
  int c;


  fp = fopen(filedati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"Errore nell'apertura del file %s!\n",filedati);
    exit(EXIT_FAILURE);
  }

  if (fscanf(fp,"%*s %*s %d",&n) != 1)
  {
    fprintf(stderr,"Errore nella lettura del numero di vertici!\n");
    exit(EXIT_FAILURE);
  }

  creagrafo(n, pG);

  if (fscanf(fp,"%*s %*s %d",&m) != 1)
  {
    fprintf(stderr,"Errore nella lettura del numero di lati!\n");
    exit(EXIT_FAILURE);
  }

  for (e = 1; e <= m; e++)
  {
    if (fscanf(fp," (%d ,%d ) %d",&u,&v,&c) != 3)
    {
      fprintf(stderr,"Errore nella lettura di un lato!\n");
      exit(EXIT_FAILURE);
    }
    insarco(u, v, c, pG);
  }

  fclose(fp);
}


/* Crea una soluzione vuota */
void CreaSoluzione (int n, soluzioneMSTP *pS)
{
  pS->f = 0;
  pS->dim = n;
  pS->nl = 0;
  pS->v1 = (vint) calloc(pS->dim+1,sizeof(int));
  if (pS->v1 == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore dei primi estremi!\n");
    exit(EXIT_FAILURE);
  }
  pS->v2 = (vint) calloc(pS->dim+1,sizeof(int));
  if (pS->v2 == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore dei secondi estremi!\n");
    exit(EXIT_FAILURE);
  }
}


/* Distrugge la soluzione S */
void DistruggeSoluzione (soluzioneMSTP *pS)
{
  pS->f = 0;
  pS->dim = pS->nl = 0;
  free(pS->v1);
  pS->v1 = NULL;
  free(pS->v2);
  pS->v2 = NULL;
}


/* Stampa la soluzione */
void StampaSoluzione (soluzioneMSTP *pS)
{
  int i;

  printf("f* = %d\n",pS->f);
  printf("x* = ");
  for (i = 1; i <= pS->nl; i++)
    printf(" (%d,%d)",pS->v1[i],pS->v2[i]);
  printf("\n");
}


/* Risolve l'istanza G del MSTP con l'algoritmo di Kruskal restituendo la soluzione S */
void Kruskal (grafo *pG, soluzioneMSTP *pS)
{
  vposarco Pos;
  posarco pa, paMin;
  vint padre, num;
  int i;
  int mEst;
  nodo u, v;
  int cu, cv;


  /* Costruisce un heap indiretto (vettore di posizioni dei lati del grafo) */
  Pos = (vposarco) malloc((pG->m+1)*sizeof(*Pos));
  if (Pos == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione dell'heap indiretto sui lati!\n");
    exit(EXIT_FAILURE);
  }
  for (i = 1, pa = primoarco(pG); !finearchi(pG, pa); i++, pa = succarco(pG, pa))
    Pos[i] = pa;

  creaheapindiretto(Pos,pG->m,pG);

  /* Costruisce una foresta con bilanciamento sui vertici del grafo */
  padre = intalloc(pG->n+1);
  num = intalloc(pG->n+1);
  for (i = 1; i <= pG->n; i++)
  {
    padre[i] = i;
    num[i] = 1;
  }


  /* Finche' ci sono lati da esplorare in E' e la soluzione e' incompleta */
  mEst = pG->m;
  while ( (mEst > 0) && (pS->nl < pG->n-1) )
  {
    /* Trova il lato di costo minimo in E' */
    paMin = Pos[1];

    /* Cancella il lato da E' */
    Pos[1] = Pos[mEst];
    mEst--;
    aggiornaheapindiretto(Pos,mEst,pG,1);

    /* Se i due estremi del lato stanno in componenti distinte della foresta con bilanciamento */
    leggeestremiarco(pG,paMin,&u,&v);
    cu = Find(u,padre,num);
    cv = Find(v,padre,num);
    if (cu != cv)
    {
      /* Aggiunge il lato alla soluzione corrente */
      pS->nl++;
      pS->v1[pS->nl] = u;
      pS->v2[pS->nl] = v;
      pS->f += leggecosto(pG,paMin);

      /* Unisce le due componenti della foresta */
      Union(cu,cv,padre,num);
    }
  }

  /* Dealloca l'heap indiretto e la foresta con bilanciamento */
  free(Pos);
  intfree(&padre);
  free(num);
}


/* Crea un heap indiretto di lunghezza n attraverso il vettore di posizioni Pos sui lati del grafo G */
void creaheapindiretto (vposarco Pos, int n, grafo *pG)
{
  int i;

  for (i = n/2; i >= 1; i--)
    aggiornaheapindiretto(Pos,n,pG,i);
}


/* Scambia i valori di due variabili di tipo posarco a e b */
void Scambia (posarco *pa, posarco *pb)
{
  posarco temp;

  temp = *pa;
  *pa = *pb;
  *pb = temp;
}


/* Aggiorna l'heap indiretto di lunghezza n descritto dal vettore di posizioni Pos
   sui lati del grafo G a partire dalla posizione i */
void aggiornaheapindiretto (vposarco Pos, int n, grafo *pG, int i)
{
  int s, d;
  int iMin;
  int cs, cd, cMin;


  s = 2*i;
  d = 2*i+1;


  iMin = i;
  cMin = leggecosto(pG,Pos[i]);
  if (s <= n)
  {
    cs = leggecosto(pG,Pos[s]);
    if (cs < cMin)
    {
      iMin = s;
      cMin = cs;
    }
  }
  if (d <= n)
  {
    cd = leggecosto(pG,Pos[d]);
    if (cd < cMin)
    {
      iMin = d;
      cMin = cd;
    }
  }

  if (iMin != i)
  {
    Scambia(&Pos[iMin],&Pos[i]);
    aggiornaheapindiretto(Pos,n,pG,iMin);
  }
}


/* Trova la componente cui appartiene l'elemento i nella foresta con bilanciamento descritta da padre e num */
int Find (int i, vint padre, vint num)
{
  int j, r, pj;

  j = i;
  while (padre[j] != j)
    j = padre[j];
  r = j;

  j = i;
  while (j != r)
  {
    pj = padre[j];
    padre[j] = r;
    j = pj;
  }

  return j;
}


/* Fonde le componenti c1 e c2 nella foresta con bilanciamento descritta da padre e num
   (non controlla che siano diverse!) */
void Union(int c1, int c2, vint padre, vint num)
{
  if (num[c1] < num[c2])
  {
    padre[c1] = c2;
    num[c2] += num[c1];
    num[c1] = 0;
  }
  else
  {
    padre[c2] = c1;
    num[c1] += num[c2];
    num[c2] = 0;
  }
}
