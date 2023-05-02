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

/* Ordina il vettore di interi V fra gli indici s e d con l'algoritmo QuickSort */
void QuickSort (vint V, int s, int d);

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
  QuickSort(V,1,n);

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


/* Scambia i numeri interi a e b */
void Scambia (int *pa, int *pb)
{
  int temp;

  temp = *pa;
  *pa = *pb;
  *pb = temp;
}

/* Partiziona il vettore di interi V compreso fra gli indici s e d
   in un primo sottovettore V[s,q] di elementi <= pivot e un secondo sottovettore
   V[q+1,d] di elementi > pivot */
int Partition (vint V, int s, int d)
{
  int d1; /* indice destro del primo sottovettore */
  int i;  /* indice dell'elemento considerato via via */


  /* Il pivot e' V[s] e il primo sottovettore va da V[s] a V[s] */
  d1 = s;

  /* Scorre il vettore assegnando gli elementi via via al primo o secondo sottovettore */
  for (i = s+1; i <= d; i++)
    if (V[i] <= V[s])
    {
      d1++;
      Scambia(&V[i],&V[d1]);
    }

  /* Porta il pivot nella posizione finale del primo sottovettore e la restituisce */
  Scambia(&V[s],&V[d1]);

  return d1;
}

/* Ordina il vettore di interi V fra gli indici s e d con l'algoritmo QuickSort */
void QuickSort (vint V, int s, int d)
{
  int q; /* indice dell'elemento pivot nel vettore V ordinato */

  if (s < d)
  {
    q = Partition(V,s,d);
    QuickSort(V,s,q-1);
    QuickSort(V,q+1,d);
  }
}
