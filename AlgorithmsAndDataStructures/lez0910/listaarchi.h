#ifndef __LISTAARCHI_H
#define __LISTAARCHI_H

#include <stdio.h>
#include <stdlib.h>

#define ROW_LENGTH 256

#define TRUE  1
#define FALSE 0
typedef int boolean;

typedef struct _arco arco;
typedef arco* listaarchi;
typedef arco* posarco;
typedef int nodo;

#define NO_ARC NULL
#define NO_NODE 0


struct _arco {
	nodo orig, dest;
	posarco succ, pred;
};

listaarchi crealistaarchi ();

void distruggelistaarchi (listaarchi *pL);

void leggearco (listaarchi L, posarco p, nodo *porig, nodo *pdest);

listaarchi scrivearco (listaarchi L, posarco p, nodo orig, nodo dest);

posarco primolistaarchi (listaarchi L);

posarco ultimolistaarchi (listaarchi L);

boolean finelistaarchi (listaarchi L, posarco p);

boolean listaarchivuota (listaarchi L);

posarco preclistaarchi (listaarchi L, posarco p);

posarco succlistaarchi (listaarchi L, posarco p);

listaarchi inslistaarchi (listaarchi L, posarco p, nodo orig, nodo dest);

listaarchi canclistaarchi (listaarchi L, posarco *pp);

#endif