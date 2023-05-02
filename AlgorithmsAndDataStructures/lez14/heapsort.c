/* sort.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define ROW_LENGTH 256


/* Prototipi delle procedure secondarie e definizione di tipi */

typedef int* vint;

void InterpretaLineaComando (int argc, char *argv[], char *filemosse);

void CaricaVettoreInteri (char *filedati, vint *pV, int *pn);

void StampaVettoreInteri (vint V, int n);

/* Ordina il vettore V di interi di lunghezza n con l'algoritmo HeapSort */
void HeapSort (vint V, int n);


/* Programma principale */
int main (int argc, char *argv[])
{
  char filedati[ROW_LENGTH];
  vint V;
  int n;


  /* Legge da linea di comando il file che contiene i dati */
  InterpretaLineaComando(argc,argv,filedati);

  /* Legge la lunghezze e gli elementi del vettore */
  CaricaVettoreInteri(filedati,&V,&n);

  /* Ordina il vettore */
  HeapSort(V,n);

  /* Stampa il vettore ordinato */
  StampaVettoreInteri(V,n);

  /* Dealloca il vettore (anche per controllare eventuali errori di accesso) */
  free(V);
  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */

/* Legge dalla linea di comando il file che contiene i dati */
void InterpretaLineaComando (int argc, char *argv[], char *filedati)
{
  if (argc != 2)
  {
    fprintf(stderr,"Errore nella linea di comando!\n");
    exit(EXIT_FAILURE);
  }

  strcpy(filedati,argv[1]);
}


/* Carica dal file filedati nel vettore V di dimensione n i numeri da ordinare */
void CaricaVettoreInteri (char *filedati, vint *pV, int *pn)
{
  FILE *fp;
  int i;


  fp = fopen(filedati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"File %s non apribile!\n",filedati);
    exit(EXIT_FAILURE);
  }

  *pn = 0;
  while (fscanf(fp,"%d",&i) == 1)
    (*pn)++;

  *pV = (int *) calloc(*pn+1,sizeof(int));
  if (*pV == NULL)
  {
    fprintf(stderr,"Allocazione fallita!\n");
    exit(EXIT_FAILURE);
  }

  rewind(fp);

  i = 1;
  while (fscanf(fp,"%d",&(*pV)[i]) == 1)
    i++;

  fclose(fp);
}


/* Stampa il vettore */
void StampaVettoreInteri (vint V, int n)
{
  int i;

  for (i = 1; i <= n; i++)
    printf("%d ",V[i]);
  printf("\n");
}


void Scambia (int *pa, int *pb)
{
  int temp;

  temp = *pa;
  *pa = *pb;
  *pb = temp;
}


/* Aggiorna l'heap V di lunghezza n correggendo l'eventuale errore in posizione i */
void aggiornaheap (vint V, int n, int i)
{
  int s, d;
  int iMax;

  /* Identifica i nodi figli di quello potenzialmente scorretto */
  s = 2*i;
  d = 2*i+1;

  /* Determina il massimo fra il padre e i due nodi figli */
  iMax = i;
  if ( (s <= n) && (V[s] > V[iMax]) ) iMax = s;
  if ( (d <= n) && (V[d] > V[iMax]) ) iMax = d;

  /* Se l'heap e' scorretto, scambia padre e figlio e corregge il sottoalbero figlio */
  if (iMax != i)
  {
    Scambia(&V[iMax],&V[i]);
    aggiornaheap(V,n,iMax);
  }
}

/* Trasforma il vettore di interi V di lunghezza n in un max-heap */
void creaheap (vint V, int n)
{
  int i;

  for (i = n/2; i >= 1; i--)
    aggiornaheap(V,n,i);
}


/* Ordina il vettore V di interi di lunghezza n con l'algoritmo HeapSort */
void HeapSort (vint V, int n)
{
  int j;

  creaheap(V,n);
  for (j = n; j > 1; j--)
  {
    Scambia(&V[1],&V[j]);
    aggiornaheap(V,j-1,1);
  }
}
