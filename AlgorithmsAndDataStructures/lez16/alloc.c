#include "alloc.h"


/* Alloca un vettore di int con n elementi */
vint intalloc (int n)
{
  vint V;


  V = (vint) malloc(n*sizeof(*V));
  if (V == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di un vettore di interi!\n");
    exit(EXIT_FAILURE);
  }

  return V;
}


/* Dealloca un vettore di int */
void intfree (vint *pV)
{
  free(*pV);
  *pV = NULL;
}


/* Alloca un vettore di boolean con n elementi */
vboolean booleanalloc (int n)
{
  vboolean V;


  V = (vboolean) malloc(n*sizeof(*V));
  if (V == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di un vettore di boolean!\n");
    exit(EXIT_FAILURE);
  }

  return V;
}


/* Dealloca un vettore di boolean */
void booleanfree (vboolean *pV)
{
  free(*pV);
  *pV = NULL;
}


/* Alloca un vettore di int con n elementi */
vdouble doublealloc (int n)
{
  vdouble V;


  V = (vdouble) malloc(n*sizeof(*V));
  if (V == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di un vettore di double!\n");
    exit(EXIT_FAILURE);
  }

  return V;
}


/* Dealloca un vettore di double */
void doublefree (vdouble *pV)
{
  free(*pV);
  *pV = NULL;
}


/* Alloca una matrice di int con nr righe e nc colonne */
mint int2alloc (int nr, int nc)
{
  mint M;
  int i;


  M = (mint) malloc(nr*sizeof(vint));
  if (M == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di una matrice di interi!\n");
    exit(EXIT_FAILURE);
  }
  for (i = 0; i < nr; i++)
  {
    M[i] = (vint) malloc(nc*sizeof(int));
    if (M[i] == NULL)
    {
      fprintf(stderr,"Errore nell'allocazione del vettore M[%d]!\n",i);
      exit(EXIT_FAILURE);
    }
  }

  return M;
}


/* Dealloca una matrice di int con nr righe */
void int2free (mint *pM, int nr)
{
  int i;


  for (i = 0; i < nr; i++)
    free((*pM)[i]);
  free(*pM);
  *pM = NULL;
}
