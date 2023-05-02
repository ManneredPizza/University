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

/* Ordina il vettore di interi V dall'indice s all'indice d */
void MergeSort (vint V, int s, int d, vint B);

/* Programma principale */
int main (int argc, char *argv[])
{
  char filedati[ROW_LENGTH];
  vint V;
  int n;
  vint B;

  /* Legge da linea di comando il file che contiene i dati */
  InterpretaLineaComando(argc,argv,filedati);

  /* Legge la lunghezze e gli elementi del vettore */
  CaricaVettoreInteri(filedati,&V,&n);

  /* Alloca il vettore ausiliario B che contiene il risultato temporaneo */
  B = malloc((n+1)*sizeof(int));
  if (B == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore ausiliario B!\n");
    exit(EXIT_FAILURE);
  }

  /* Ordina il vettore */
  MergeSort(V,1,n,B);
  free(B);

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


/* Fondere i sottovettori ordinati V[s,m] e V[m+1,d] in un vettore ordinato V[s,d] */
void Merge (vint V, int s, int m, int d, vint B)
{
  int is, id;
  int i, j;


  is = s;
  id = m+1;
  i = 0;
  /* Finche' entrambi i sottovettori sono non vuoti,
     spostiamo in B il minimo dei due primi elementi */
  while ( (is <= m) && (id <= d) )
  {
    i++;
    if (V[is] <= V[id])
    {
      B[i] = V[is];
      is++;
    }
    else
    {
      B[i] = V[id];
      id++;
    }
  }

  /* Completa lo svuotamento del primo sottovettore (se non gia' vuoto) copiandolo in B
     (a ritroso per non sovrascrivere gli elementi ancora da spostare);
     se il secondo sottovettore ha un residuo, i suoi elementi sono gia' nella posizione corretta. */
  for (j = m; j >= is; j--)
    V[j+d-m] = V[j];

  /* Copia B nella parte iniziale di V */
  for (j = 1; j <= i; j++)
    V[j-1+s] = B[j];
}

/* Ordina il vettore di interi V dall'indice s all'indice d */
void MergeSort (vint V, int s, int d, vint B)
{
  int m;


  /* Vettori vuoti o di un solo elemento sono gia' ordinati */
  if (s < d)
  {
    /* Divide: divide il vettore in due meta' uguali V[s,m] e V[m+1,d] */
    m = (s+d)/2;

    /* Impera: risolve i sottoproblemi V[s,m] e V[m+1,d] */
    MergeSort(V,s,m,B);
    MergeSort(V,m+1,d,B);

    /* Combina: combina le soluzioni dei due sottoproblemi nella soluzione complessiva */
    Merge(V,s,m,d,B);
  }
}
