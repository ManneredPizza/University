#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"

/* alloca lo spazio per un vettore con una stringa lunga (LUNGHEZZA_ELEMENTO + 1) */
void inizializzaTabella(tabella *t) {
	t->V = (char **)malloc(sizeof(char*));
    if(t->V == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }
	t->V[0] = (char*)malloc((LUNGHEZZA_ELEMENTO + 1)*sizeof(char));
    if(t->V[0] == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }
	t->maxLength = ROW_LENGTH;
	t->length = 0;
}

/* rialloca la tabella allungandola di 1 char* e poi alloca lo spazio per una stringa di (LUNGHEZZA_ELEMENTO + 1) caratteri
   inserisce poi l'elemento nello spazio appena allocato */
void inserimentoElementoTabella(char *elemento, tabella *t) {
    if(sprintf(t->V[t->length], "%s", elemento) > 0) {
        if(t->length == t->maxLength-1) {
            fprintf(stdout, "Max lunghezza raggiunta%d\n", ROW_LENGTH);
            return;
        }
        t->length++;
        t->V = (char **)realloc(t->V, sizeof(char*)*(t->length+1));
        if(t->V == NULL) {
            fprintf(stderr, "Impossibile allocare memoria\n");
            exit(EXIT_FAILURE);
        }
        t->V[t->length] = (char*)malloc((LUNGHEZZA_ELEMENTO + 1)*sizeof(char));
        if(t->V[t->length] == NULL) {
            fprintf(stderr, "Impossibile allocare memoria\n");
            exit(EXIT_FAILURE);
        }
    }
    else {
        fprintf(stderr, "Impossibile inserire ingrediente vuoto\n");
        exit(EXIT_FAILURE);
    }
}

/* cicla la tabella finché non trova la la stringa elemento, ritorna l'indice dove la trova se no trona -1 */
int trovaIndiceDaContenutoTabella(char *elemento, tabella *t) {
    int i;

    for(i=0; i<t->length; i++) {
        if(strcmp(elemento, t->V[i]) == 0) {
            return i;
        }
    }
    return -1;
}

/* dato un indice ritorna la stringa contenuta nella tabella in quell'indice */
char *leggiValoreTabella(tabella t, int index) {
    if(index > t.length) {
        fprintf(stdout, "Indice oltre il limite%d\n", ROW_LENGTH);
        exit(EXIT_FAILURE);
    }

    return t.V[index];
}

/* ritorna la lunghezza della tabella */
int leggiLunghezza(tabella t) {
    return t.length;
}

/* cicla la tabella liberando lo spazio delle diverse stringhe e poi dealloca la tabella */
void cancellaTabella(tabella *t) {
    int i;
    if(t==NULL) return;

    for(i=0; i<t->length; i++) free(t->V[i]);
    
    free(t->V);
}
