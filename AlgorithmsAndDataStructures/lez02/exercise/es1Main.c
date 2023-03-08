#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

struct parametro {
  int length;
  char parametro[ROW_LENGTH];
};

/* Dichiarazione funzioni secondarie */
void inizializzaVariabili(int argc, char *argv[], struct parametro *params);
void copyParametri(struct parametro *a, struct parametro *b);
void swapParametri(struct parametro *a, struct parametro *b);
struct parametro* quickSort(int len, struct parametro *params);


int main(int argc, char *argv[]) {
	/* Parte dichiarativa */
	struct parametro *params=NULL;
	struct parametro *finale=NULL;
	int i;

	params = (struct parametro*)malloc(sizeof(struct parametro)*(argc-1));
	finale = (struct parametro*)malloc(sizeof(struct parametro)*(argc-1));

	inizializzaVariabili(argc, argv, params);
	finale = quickSort(argc-1, params);

    for(i=0; i<argc-1; i++)
        printf("%s\n", finale[i].parametro);

	return EXIT_SUCCESS;
}

void inizializzaVariabili(int argc, char *argv[], struct parametro *params) {
	int i=0;
	for( ; i<argc-1; i++) {
		/*in ogni stringa inserisco un input*/
		strcpy(params[i].parametro, argv[i+1]);
		/*inserirsco in ogni cella la lunghezza della stringa nel corrispondete indice*/
		params[i].length = strlen(argv[i+1]);
	}
}

void copyParametri(struct parametro *a, struct parametro *b) {
    (*a).length = (*b).length;
    strcpy((*a).parametro, (*b).parametro);
}

void swapParametri(struct parametro *a, struct parametro *b) {
    struct parametro temp;
    copyParametri(&temp, a);
    copyParametri(a,b);
    copyParametri(b,&temp);
}

/* variante quicksort per struct con un int da ordinare */
struct parametro* quickSort(int len,  struct parametro *params) {
	struct parametro pivot;
	struct parametro* parte1 = NULL;
	struct parametro* parte2 = NULL;
	struct parametro* final1 = NULL;
	struct parametro* final2 = NULL;
	struct parametro* finale = NULL;
	int i = 1;
	int j = 0;
	int k = 0;

	if(len == 0)
		return NULL;
	if(len == 1)
		return params;
	if(len == 2) {
		if(params[0].length <= params[1].length)
			return params;
		swapParametri(&params[0], &params[1]);
		return params;
	}

	finale = (struct parametro*)malloc(sizeof(struct parametro)*len);

    copyParametri(&pivot, &params[0]);

	parte1 = (struct parametro*)malloc(sizeof(struct parametro));
	final1 = (struct parametro*)malloc(sizeof(struct parametro));
	parte2 = (struct parametro*)malloc(sizeof(struct parametro));
	final2 = (struct parametro*)malloc(sizeof(struct parametro));

	for( ;i<len; i++) {
		if(params[i].length <= pivot.length) {
			if(j>0)
				parte1 = (struct parametro*)realloc(parte1, sizeof(struct parametro)*(j+1));
				final1 = (struct parametro*)realloc(final1, sizeof(struct parametro)*(j+1));
            copyParametri(&parte1[j], &params[i]);
			j++;
		}
		else {
			if(k>0)
				parte2 = (struct parametro*)realloc(parte2, sizeof(struct parametro)*(k+1));
				final2 = (struct parametro*)realloc(final2, sizeof(struct parametro)*(k+1));
            copyParametri(&parte2[k], &params[i]);
			k++;
		}
	}

	final1 = quickSort(j, parte1);
	final2 = quickSort(k, parte2);

	for(i=0; i<j; i++)
        copyParametri(&finale[i], &final1[i]);
    copyParametri(&finale[j], &pivot);
	for(i=0; i<k; i++)
        copyParametri(&finale[i+j+1], &final2[i]);

	return finale;
}
