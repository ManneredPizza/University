#include "listalibri-cursori.h"

listalibri crealista ()
{
  listalibri L;
  posizione p;

  L = calloc(LIST_SIZE+2,sizeof(elemento));
  if (L == NULL)
  {
    fprintf(stderr,"Memoria insufficiente per allocare una lista di libri!\n");
    exit(EXIT_FAILURE);
  }

  /* La lista contiene solo la sentinella */
  L[SENTINELLA].succ = SENTINELLA;
  L[SENTINELLA].pred = SENTINELLA;

  /* Gli altri elementi allocati stanno nella "lista libera" */
  for (p = 1; p <= LIST_SIZE; p++)
  {
    L[p+1].pred = p;
    L[p].succ = p+1;
  }
  L[1].pred = SENTINELLA_LIBERA;
  L[SENTINELLA_LIBERA].succ = 1;

  return L;
}

void distruggelista (listalibri *pL)
{
  free(*pL);
  *pL = EMPTY_LIST;
}

void leggelista (listalibri L, posizione p, libro AutoreTitolo)
{
  strcpy(AutoreTitolo,L[p].AutoreTitolo);
}

listalibri scrivelista (listalibri L, posizione p, libro AutoreTitolo)
{
  strcpy(L[p].AutoreTitolo,AutoreTitolo);
  return L;
}

boolean listavuota (listalibri L)
{
  return (L[SENTINELLA].succ == SENTINELLA);
}

posizione primolista (listalibri L)
{
  return L[SENTINELLA].succ;
}

posizione ultimolista (listalibri L)
{
  return L[SENTINELLA].pred;
}

posizione succlista (listalibri L, posizione p)
{
  return L[p].succ;
}

posizione predlista (listalibri L, posizione p)
{
  return L[p].pred;
}

boolean finelista (listalibri L, posizione p)
{
  return (p == SENTINELLA);
}

listalibri inslista (listalibri L, posizione p, libro AutoreTitolo)
{
  posizione q;

  q = L[SENTINELLA_LIBERA].succ;
  /* La lista libera e' vuota: non si possono inserire libri
     NOTA: si potrebbe allargare la memoria allocata per il vettore */
  if (q == SENTINELLA_LIBERA)
  {
    fprintf(stderr,"Memoria insufficiente per allocare il libro %s!\n",AutoreTitolo);
    exit(EXIT_FAILURE);
  }
  strcpy(L[q].AutoreTitolo,AutoreTitolo);

  /* Toglie l'elemento in posizione q dalla lista libera */
  L[L[q].pred].succ = L[q].succ;
  L[L[q].succ].pred = L[q].pred;

  /* Mette l'elemento nella lista vera */
  L[q].pred = L[p].pred;
  L[q].succ = p;
  L[L[p].pred].succ = q;
  L[p].pred = q; /* NB: L[p].pred va aggiornata per ultima, o le istruzioni precedenti sono scorrette! */

  return L;
}

listalibri canclista (listalibri L, posizione *pp)
{
  posizione p;

  p = *pp;
  *pp = L[p].succ;

  /* Sgancia l'elemento dalla lista */
  L[L[p].pred].succ = L[p].succ;
  L[L[p].succ].pred = L[p].pred;

  /* Inserisce l'elemento in cima alla lista libera */
  L[p].pred = SENTINELLA_LIBERA;
  L[p].succ = L[SENTINELLA_LIBERA].succ;
  L[L[SENTINELLA_LIBERA].succ].pred = p;
  L[SENTINELLA_LIBERA].succ = p; /* NB: L[SENTINELLA_LIBERA].succ va aggiornata per ultima, o le istruzioni precedenti sono scorrette! */

  return L;
}
