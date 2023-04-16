#include "albero.h"

albero creaalbero ()
{
  return EMPTY_TREE;
}


void distruggealbero (albero *pT)
{
  cancsottoalbero(*pT,pT);
}


boolean alberovuoto (albero T)
{
  return (T == EMPTY_TREE);
}


void leggenodo (albero T, posizione p, Operatore *pop, Operando *pval)
{
  *pop = p->op;
  *pval = p->val;
}


void scrivenodo (albero T, posizione p, Operatore op, Operando val)
{
  p->op = op;
  p->val = val;
}


posizione radice (albero T)
{
  return T;
}


posizione figliosinistro (albero T, posizione p)
{
  return p->Ts;
}


posizione figliodestro (albero T, posizione p)
{
  return p->Td;
}


posizione padre (albero T, posizione p)
{
  return p->padre;
}


albero costruiscealbero (Operatore op, Operando val, albero Ts, albero Td)
{
  nodo *r;

  /* Alloca l'elemento radice */
  r = (nodo *) malloc(sizeof(nodo));
  if (r == NULL)
  {
    fprintf(stderr,"Errore nell'allocazione di un albero!\n");
    exit(EXIT_FAILURE);
  }

  r->op = op;
  r->val = val;
  r->padre = NO_NODE;
  r->Ts = Ts;
  if (Ts != NULL) Ts->padre = r;
  r->Td = Td;
  if (Td != NULL) Td->padre = r;

  return r;
}


albero cancsottoalbero (albero T, posizione *pp)
{
  /* Visita il sottoalbero in postordine deallocandone i nodi */
  if (*pp != NO_NODE)
  {
    cancsottoalbero(T,&(*pp)->Ts);
    cancsottoalbero(T,&(*pp)->Td);
    free(*pp);
    *pp = NO_NODE;
  }

  return T;
}
