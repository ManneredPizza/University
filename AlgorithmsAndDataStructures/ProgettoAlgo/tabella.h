#ifndef __TABELLA_H
#define __TABELLA_H

#define ROW_LENGTH 256
#define LUNGHEZZA_ELEMENTO 50

struct _tabella {
	char **V;
	int maxLength;
	int length;
};
typedef struct _tabella tabella;

void inizializzaTabella(tabella *t);

void inserimentoElemento(char *elemento, tabella *t);

int trovaIndiceDaContenuto(char *elemento, tabella *t);

void stampaTabella(tabella t);

#endif
