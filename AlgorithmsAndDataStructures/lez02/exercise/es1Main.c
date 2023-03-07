#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

/* Dichiarazione funzioni secondarie */
void inizializzaVariabili(int argc, char *argv[], char **listaParametri, int *lenParametri);
void swapInt(int *a, int *b);
void swapString(char *a, char *b);
int* quickSort(int len, int *lenParametri);


int main(int argc, char *argv[]) {
	/* Parte dichiarativa */
	char **listaParametri = NULL;
	int *lenParametri = NULL;
	int *finale = NULL;
	int i=0;

	lenParametri = (int*)malloc(sizeof(int) * (argc-1));
	finale = (int*)malloc(sizeof(int) * (argc-1));
	listaParametri = (char**)malloc(sizeof(char*) * (argc-1));
	for( ; i<argc-1; i++)
		listaParametri[i] = (char*)malloc(sizeof(char) * (argc-1));

	inizializzaVariabili(argc, argv, listaParametri, lenParametri);
	finale = quickSort(argc-1, lenParametri);

	for(i=0; i<argc-1; i++)
		printf("%d\n", finale[i]);

	return EXIT_SUCCESS;
}

void inizializzaVariabili(int argc, char *argv[], char **listaParametri, int *lenParametri) {
	/* alloco dinamicamente gli array con gli input */
	int i=0;
	for( ; i<argc-1; i++) {
		/*in ogni stringa inserisco un input*/ 
		strcpy(listaParametri[i], argv[i+1]); 
		/*inserirsco in ogni cella la lunghezza della stringa nel corrispondete indice*/
		lenParametri[i] = strlen(argv[i+1]);
	}
}

void swapInt(int *a, int *b) {
	int temp;
	temp = *a;
	*a = *b;
	*b = temp;
}

void swapString(char *a, char *b) {
	char temp[ROW_LENGTH];
	strcpy(temp, a);
	strcpy(a, b);
	strcpy(b, temp);
}

/* Da testare */
int* quickSort(int len, int *lenParametri) {
	/* Dovrò capire poi come ordinare la listaParametri */
	int pivot;
	int *parte1Int = NULL;
	int *parte2Int = NULL;
	int *final1 = NULL;
	int *final2 = NULL;
	int *finale = NULL;
	int i = 1;
	int j = 0;
	int k = 0;

	/* Se len < 3 */
	/* len = 0 ritorno null */
	/* len = 1 ritorno */
	/* len = 2 ordino */
	if(len == 0)
		return NULL;
	if(len == 1)
		return lenParametri;
	if(len == 2) {
		if(lenParametri[0] <= lenParametri[1])
			return lenParametri;
		swapInt(&lenParametri[0], &lenParametri[1]);
		return lenParametri;
	}

	finale = (int*)malloc(sizeof(int)*len);

	pivot = lenParametri[0];
	parte1Int = (int*)malloc(sizeof(int));
	final1 = (int*)malloc(sizeof(int));
	parte2Int = (int*)malloc(sizeof(int));
	final2 = (int*)malloc(sizeof(int));

	for( ;i<len; i++) {
		if(lenParametri[i] <= pivot) {
			if(j>0)
				parte1Int = (int*)realloc(parte1Int, sizeof(int)*(j+1));
				final1 = (int*)realloc(final1, sizeof(int)*(j+1));
			parte1Int[j] = lenParametri[i];
			j++;
		}
		else {
			if(k>0)
				parte2Int = (int*)realloc(parte2Int, sizeof(int)*(k+1));
				final2 = (int*)realloc(final2, sizeof(int)*(k+1));
			parte2Int[j] = lenParametri[i];
			k++;
		}
	}

	final1 = quickSort(j, parte1Int);
	final2 = quickSort(k ,parte2Int);

	for(i=0; i<j; i++)
		finale[i] = final1[i];
	finale[i] = pivot;
	i++;
	for( ; i<k+j; i++)
		finale[i] = final2[i-j-1];
	/* deve ritornare quickSort(j, parte1Int) || pivot || quickSort(k, parte2Int) */
	/* la contcatenazione deve tenere conto della possibilità che sia vuoto */

	return finale;
}
