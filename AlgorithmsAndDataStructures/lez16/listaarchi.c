#include "listaarchi.h"

listaarchi crealistaarchi ()
{
  listaarchi L = (listaarchi) malloc(sizeof(arco));
  if (L == NULL)
  {
    fprintf(stderr,"Memoria insufficiente per allocare un arco!\n");
    exit(EXIT_FAILURE);
  }

  L->orig = 0;
  L->dest = 0;
  L->costo = 0;

  L->succ = L;
  L->pred = L;

  return L;
}


void distruggelistaarchi (listaarchi *pL)
{
  posarco p;

  while (!listaarchivuota(*pL))
  {
    p = primolistaarchi(*pL);
    *pL = canclistaarchi(*pL,&p);
  }
  free(*pL);
  *pL = NULL;
}


void leggearco (listaarchi L, posarco p, nodo *porig, nodo *pdest, int *pcosto)
{
  *porig = p->orig;
  *pdest = p->dest;
  *pcosto = p->costo;
}


listaarchi scrivearco (listaarchi L, posarco p, nodo orig, nodo dest, int costo)
{
  p->orig = orig;
  p->dest = dest;
  p->costo = costo;
  return L;
}


boolean listaarchivuota (listaarchi L)
{
  return (L->succ == L);
}


posarco primolistaarchi (listaarchi L)
{
  return L->succ;
}


posarco ultimolistaarchi (listaarchi L)
{
  return L->pred;
}


posarco succlistaarchi (listaarchi L, posarco p)
{
  return p->succ;
}


posarco preclistaarchi (listaarchi L, posarco p)
{
  return p->pred;
}


boolean finelistaarchi (listaarchi L, posarco p)
{
  return (p == L);
}


listaarchi inslistaarchi (listaarchi L, posarco p, nodo orig, nodo dest, int costo)
{
  posarco q = (posarco) malloc(sizeof(arco));
  if (q == NULL)
  {
    fprintf(stderr,"Memoria insufficiente per allocare un arco!\n");
    exit(EXIT_FAILURE);
  }
  q->orig = orig;
  q->dest = dest;
  q->costo = costo;
  q->pred = p->pred;
  q->succ = p;
  p->pred->succ = q;
  p->pred = q;
  return L;
}


listaarchi canclistaarchi (listaarchi L, posarco *pp)
{
  posarco p = *pp;

  *pp = p->succ;
  p->pred->succ = p->succ;
  p->succ->pred = p->pred;
  free(p);

  return L;
}
