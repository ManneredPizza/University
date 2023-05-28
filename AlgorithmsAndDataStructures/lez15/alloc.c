#include "alloc.h"


/* Alloca una matrice di int con nr righe e nc colonne */
mint int2alloc (int nr, int nc)
{
  mint M;
  int i;


  M = (mint) calloc(nr,sizeof(vint));
  if (M == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di una matrice di interi!\n");
    exit(EXIT_FAILURE);
  }
  for (i = 0; i < nr; i++)
  {
    M[i] = (vint) calloc(nc,sizeof(int));
    if (M[i] == NULL)
    {
      fprintf(stderr,"Errore nell'allocazione del vettore M[%d]!\n",i);
      exit(EXIT_FAILURE);
    }
  }

  return M;
}


/* Dealloca una matrice di int con nr righe */
void int2free (mint *pF, int nr)
{
  int i;


  for (i = 0; i < nr; i++)
    free((*pF)[i]);
  free(*pF);
  *pF = NULL;
}
