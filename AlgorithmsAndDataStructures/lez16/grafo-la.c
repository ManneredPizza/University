#include "grafo-la.h"

/* Crea un grafo *pG di n nodi, senza archi */
void creagrafo (int n, grafo *pG)
{
  pG->n = n;
  pG->m = 0;
  pG->L = crealistaarchi();
}


/* Distrugge il grafo *pG */
void distruggegrafo (grafo *pG)
{
  pG->n = 0;
  pG->m = 0;
  distruggelistaarchi(&pG->L);
}


/* Aggiunge l'arco (o,d) di costo c al grafo *pG (non controlla se gia' esiste!) */
void insarco (nodo o, nodo d, int c, grafo *pG)
{
  posarco q;

  q = succlistaarchi(pG->L,ultimolistaarchi(pG->L));
  inslistaarchi(pG->L,q,o,d,c);
  pG->m++;
}


/* Cancella l'arco (o,d) dal grafo *pG (non fa nulla se non esiste) */
void cancarco (nodo o, nodo d, grafo *pG)
{
  posarco pa;
  nodo orig, dest;
  int costo;

  for (pa = primolistaarchi(pG->L); !finelistaarchi(pG->L,pa); pa = succlistaarchi(pG->L,pa))
  {
    leggearco(pG->L,pa,&orig,&dest,&costo);
    if ( (o == orig) && (d == dest) ) break;
  }

  if (!finelistaarchi(pG->L,pa))
  {
    canclistaarchi(pG->L,&pa);
    pG->m--;
  }
}


/* Determina se l'arco (o,d) appartiene al grafo *pG */
boolean esistearco (nodo o, nodo d, grafo *pG)
{
  posarco pa;
  nodo orig, dest;
  int costo;


  for (pa = primolistaarchi(pG->L); !finelistaarchi(pG->L,pa); pa = succlistaarchi(pG->L,pa))
  {
    leggearco(pG->L,pa,&orig,&dest,&costo);
    if ( (o == orig) && (d == dest) ) return TRUE;
  }

  return FALSE;
}


/* Stampa a video il grafo G */
void stampagrafo (grafo *pG)
{
  posarco pa;
  nodo o, d;
  int c;


  for (pa = primolistaarchi(pG->L); !finelistaarchi(pG->L,pa); pa = succlistaarchi(pG->L,pa))
  {
    leggearco(pG->L,pa,&o,&d,&c);
    printf("(%d,%d) %d ",o,d,c);
  }
}


/* Restituisce la posizione del primo arco del grafo *pG */
posarco primoarco (grafo *pG)
{
  return primolistaarchi(pG->L);
}


/* Restituisce la posizione dell'arco successivo a pa nel grafo *pG */
posarco succarco (grafo *pG, posarco pa)
{
  return succlistaarchi(pG->L,pa);
}


/* Determina se la posizione pa e' fuori della lista degli archi del grafo *pG */
boolean finearchi (grafo *pG, posarco pa)
{
  return finelistaarchi(pG->L,pa);
}


/* Restituisce gli estremi *po e *pd dell'arco in posizione pa nel grafo *pG */
void leggeestremiarco (grafo *pG, posarco pa, nodo *po, nodo *pd)
{
  int costo;

  leggearco(pG->L,pa,po,pd,&costo);
}


/* Restituisce il costo dell'arco in posizione pa nel grafo *pG */
int leggecosto(grafo* pG, posarco pa)
{
  nodo o, d;
  int c;

  leggearco(pG->L,pa,&o,&d,&c);
  return c;
}
