#ifndef __LISTA_H
#define __LISTA_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256
#define NO_ELEMENT NULL
#define NO_LIST NULL

typedef int boolean;
#define TRUE 1
#define FALSE 0

typedef char libro[ROW_LENGTH];

typedef struct _elemento elemento;
typedef elemento *lista;
typedef elemento *posizione;

struct _elemento {
	libro autoreTitolo;
	posizione succ;
	posizione pred;
};

/* prototipi funzioni */

lista crealista();

void distruggelista(lista *l);

void leggelista (lista l, posizione p, libro newLibro);

lista scrivelista (lista l, posizione p, libro newLibro);

boolean listavuota(lista l);

posizione primolista(lista l);

posizione ultimolista(lista l);

posizione succlista(lista l, posizione p);

posizione predlista(lista l, posizione p);

boolean finelista(lista l, posizione p);

lista inslista(lista l, posizione p, libro newLibro);

lista canclista(lista l, posizione *p);

posizione cercaLista(lista l, libro fileLibri);

posizione successivoRispettoInserimento(lista l, libro newLibro);

void stampaLista(lista l);

#endif
