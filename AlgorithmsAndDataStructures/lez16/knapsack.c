#include "knapsack.h"

/* Carica dal file filedati l'istanza I del problema dello zaino */
void CaricaDatiKP (char *filedati, datiKP *pI)
{
  FILE *fp;
  int i;


  fp = fopen(filedati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"Errore nell'apertura del file %s!\n",filedati);
    exit(EXIT_FAILURE);
  }

  if (fscanf(fp,"%*s %*s %d",&pI->n) != 1)
  {
    fprintf(stderr,"Errore nella lettura del numero di elementi!\n");
    exit(EXIT_FAILURE);
  }

  pI->phi = (int *) calloc(pI->n+1,sizeof(int));
  if (pI->phi == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore dei premi!\n");
    exit(EXIT_FAILURE);
  }

  pI->v = (int *) calloc(pI->n+1,sizeof(int));
  if (pI->v == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione del vettore dei volumi!\n");
    exit(EXIT_FAILURE);
  }

  /* Salta "phi =" */
  fscanf(fp,"%*s %*s");
  for (i = 1; i <= pI->n; i++)
    if (fscanf(fp,"%d",&pI->phi[i]) != 1)
    {
      fprintf(stderr,"Errore nella lettura del vettore dei premi!\n");
      exit(EXIT_FAILURE);
    }

  /* Salta "v =" */
  fscanf(fp,"%*s %*s");
  for (i = 1; i <= pI->n; i++)
    if (fscanf(fp,"%d",&pI->v[i]) != 1)
    {
      fprintf(stderr,"Errore nella lettura del vettore dei volumi!\n");
      exit(EXIT_FAILURE);
    }

  if (fscanf(fp,"%*s %*s %d",&pI->V) != 1)
  {
    fprintf(stderr,"Errore nella lettura della capacita'!\n");
    exit(EXIT_FAILURE);
  }

  fclose(fp);
}


/* Dealloca le strutture dati dinamiche */
void DistruggeDatiKP (datiKP *pI)
{
  free(pI->phi);
  free(pI->v);
  pI->n = 0;
  pI->phi = NULL;
  pI->v = NULL;
  pI->V = 0;
}


/* Crea una soluzione vuota */
void CreaSoluzioneKP (int n, soluzioneKP *pS)
{
  pS->f = 0L;
  pS->x = (vboolean) calloc(n+1,sizeof(boolean));
  if (pS->x == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione della soluzione!\n");
    exit(EXIT_FAILURE);
  }
}


/* Distrugge la soluzione S */
void DistruggeSoluzioneKP (soluzioneKP *pS)
{
  pS->f = 0L;
  free(pS->x);
  pS->x = NULL;
}


/* Stampa la soluzione */
void StampaSoluzioneKP (int n, soluzioneKP *pS)
{
  int i;

  printf("f = %d\n",pS->f);
  printf("x = (");
  for (i = 1; i <= n; i++)
    if (pS->x[i] == TRUE)
      printf(" %d",i);
  printf(" )\n");
}
