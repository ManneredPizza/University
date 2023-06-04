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

void inserimentoElementoTabella(char *elemento, tabella *t);

int trovaIndiceDaContenutoTabella(char *elemento, tabella *t);

char *leggiValoreTabella(tabella t, int index);

int leggiLunghezza(tabella t);

void stampaTabella(tabella t);

void cancellaTabella(tabella *t);

#endif
