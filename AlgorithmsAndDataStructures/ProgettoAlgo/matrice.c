#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "matrice.h"

/* alloca lo spazio per salvarsi numberOfRows puntatori ad int e per ognuno di essi alloca lo spazio per un vettore di lunghezza rowLength */
void inizializzaMatrice(matrice *m, int numberOfRows, int rowLength) {
	int i;

    m->mat = (riga*)malloc(numberOfRows*sizeof(riga));
    if(m->mat == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<numberOfRows; i++) {
	    m->mat[i] = (riga)calloc(rowLength,sizeof(int));
	    if(m->mat[i] == NULL) {
	        fprintf(stderr, "Impossibile allocare memoria\n");
	        exit(EXIT_FAILURE);
	    }
	}
    m->rowLength = rowLength;
    m->numberOfRows = numberOfRows;
}

/* restituisce il numero righe */
int numeroRigheMatrice(matrice m) {
	return m.numberOfRows;
}

/* restituisce il numero di colonne */
int numeroColonneMatrice(matrice m) {
	return m.rowLength;
}

/* restituisce il puntatore all'effettiva matrice nella struttura dati */
riga *recuperaMatrice(matrice *m) {
	return m->mat;
}

/* realloca lo la matrice per aggiungere una riga e poi alloca lo spazio di una riga che mette in coda a quelle già presenti */
void aggiungiRigaVuotaMatrice(matrice *m) {
	m->mat = (riga*)realloc(m->mat, sizeof(riga)*(m->numberOfRows+1));
	if(m->mat == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }
	m->mat[m->numberOfRows] = (riga)malloc(m->rowLength*sizeof(int));
	if(m->mat[m->numberOfRows] == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }

	m->numberOfRows = m->numberOfRows+1;
}

/* dato un vettore inserisce nell'ultima riga il vettore payload */
void inserimentoRigaMatrice(riga payload, matrice *m) {
	int i;

	if(payload != NULL) {
		for(i=0; i<m->rowLength; i++) {
			/* possibile errore se il payload è più corto di m->rowLength */
			/* errore escluso da fatto che il payload lo creo io della lunghezza corretta */
			m->mat[m->numberOfRows-1][i] = payload[i];
		}
	}
	else {
		for(i=0; i<m->rowLength; i++) {
			m->mat[m->numberOfRows-1][i] = 0;
		}
	}
}

/* data la posizione riga e colonna inserisce payload nella matrice in quel punto */
void inserimentoElementoMatrice(matrice *m, int riga, int colonna, int payload) {
	if(riga < 0 || riga > m->numberOfRows) {
		fprintf(stderr, "Numero riga non valido\n");
		exit(EXIT_FAILURE);
	}
	if(colonna < 0 || colonna > m->rowLength) {
		fprintf(stderr, "Numero colonna non valido\n");
		exit(EXIT_FAILURE);
	}
	m->mat[riga][colonna] = payload;
}

/* data riga e colonna restituisce il valore della matrice nel punto */
int leggiValoreMatrice(matrice m, int riga, int colonna) {
	if(riga < 0 || riga > m.numberOfRows) {
		fprintf(stderr, "Numero riga non valido\n");
		exit(EXIT_FAILURE);
	}
	if(colonna < 0 || colonna > m.rowLength) {
		fprintf(stderr, "Numero colonna non valido\n");
		exit(EXIT_FAILURE);
	}
	return m.mat[riga][colonna];
}

/* data riga e colonna aggiunge payload al valore già presente nella matrice in quel punto */
void aggiungiElementoMatrice(matrice *m, int riga, int colonna, int payload) {
	if(riga < 0 || riga > m->numberOfRows) {
		fprintf(stderr, "Numero riga non valido\n");
		exit(EXIT_FAILURE);
	}
	if(colonna < 0 || colonna > m->rowLength) {
		fprintf(stderr, "Numero colonna non valido\n");
		exit(EXIT_FAILURE);
	}
	m->mat[riga][colonna] += payload;
}

/* scorrendo la matrice per ogni riga controlla ogni colonna, conta quante righe
   hanno almeno un elemnto diverso da zero e salva gli indici delle righe */
int numeroColonneNonVuote(matrice m, riga *elenco) {
	int i,j;
	int numeroColonne=0;

	*elenco = (riga)calloc(m.numberOfRows, sizeof(int));
	if(*elenco == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }

	for(i=0; i<m.rowLength; i++) {
		for(j=0; j<m.numberOfRows; j++) {
			if(m.mat[j][i] != 0) {
				(*elenco)[numeroColonne] = i;
				numeroColonne = numeroColonne + 1;
				break;
			}
		}
	}

	return numeroColonne;
}

/* dati indici colonne inverte tutte le righe di quelle due colonne */
void invertiColonneMatrice(matrice *m, int l, int max) {
	int i;
	int temp;

	if(m == NULL) {
		fprintf(stderr, "Impossibile modificare ordine colonne matrice vuota\n");
		exit(EXIT_FAILURE);
	}
	if(l < 0 || l >= m->rowLength || max < 0 || max >= m->rowLength) {
		fprintf(stderr, "Indici colonne fuori dai limiti\n");
		exit(EXIT_FAILURE);
	}

	for(i=0; i<m->numberOfRows; i++) {
		temp = m->mat[i][l];
		m->mat[i][l] = m->mat[i][max];
		m->mat[i][max] = temp;
	}
}

/* copia in una matrice mDest l'intervallo della matrice mOrigin dato da lowOrigin e highOrigin partendo da lowDest */
void copiaColonnePorzioneMatrice(matrice *mDest, int lowDest, matrice mOrigin, int lowOrigin, int highOrigin) {
	int i,j;
	if(mDest == NULL) {
		fprintf(stderr, "Non posso copiare su matrice nulla\n");
		exit(EXIT_FAILURE);
	}
	if(mDest->numberOfRows != mOrigin.numberOfRows) {
		fprintf(stderr, "Numero righe delle matrici non uguale\n");
		exit(EXIT_FAILURE);
	}
	if(highOrigin < lowOrigin || lowOrigin < 0 || highOrigin < 0 || lowOrigin > mOrigin.rowLength || highOrigin > mOrigin.rowLength) {
		fprintf(stderr, "Errore in lowOrigin o highOrigin\n");
		exit(EXIT_FAILURE);
	}
	if(lowDest < 0 || lowDest >= mDest->rowLength || lowDest + (highOrigin - lowOrigin) > mDest->rowLength) {
		fprintf(stderr, "Errore nella grandezza di mDest o nell'indice lowDest\n");
		exit(EXIT_FAILURE);
	}

	for(i=0; i<mOrigin.numberOfRows; i++) {
		for(j=0; j<(highOrigin-lowOrigin); j++) {
			mDest->mat[i][lowDest+j] = mOrigin.mat[i][lowOrigin+j];
		}
	}
}

/* data una matrice origin (riga* è come int**) la lunghezza n, la riga di partenza e la colonna
   copia il contenuto in una riga dest allocata al momento */
void copiaColonnaInRiga(riga *dest, riga *origin, int n, int minRow, int col) {
	int i;
	*dest = (riga)malloc((n)*sizeof(int));
	if(dest == NULL) {
		fprintf(stderr, "Non posso copiare su matrice nulla\n");
		exit(EXIT_FAILURE);
	}
	/* servirebbe controllo lunghezza origin */
	for(i=0; i<n; i++)
		(*dest)[i] = origin[i+minRow][col];
}

/* data una riga ed una matrice, definita lunghezza, riga di partenza e colonna
   confronta il contenuto della riga r1 con quello della colonna col 
   ritorna 0 se trova anche solo un'entrata errata se no 1*/
int confrontaRigaColonna(riga r1, riga *r2, int n, int minRow, int col) {
	int i;
	/* servirebbe un controllo su r1 e r2 */
	for(i=0; i<n; i++) {
		if(r1[i] != r2[i+minRow][col]) return 0;
	}
	return 1;
}

/* data la matrice realloca lo spazio delle colonne per ogni riga, mettendo 0 nella nuova colonna */
void aggiuntaColonnaMatrice(matrice *m) {
	int i;

	m->rowLength++;
	for(i=0; i<m->numberOfRows; i++) {
		m->mat[i] = (riga)realloc(m->mat[i], (m->rowLength)*sizeof(int));
		if(m->mat[i] == NULL) {
	        fprintf(stderr, "Impossibile allocare memoria\n");
	        exit(EXIT_FAILURE);
	    }
		m->mat[i][m->rowLength] = 0;
	}
}

/* data una matrice, una riga ed una tabella restituisce il massimo valore di una di una riga
   in caso di parità confronta sempre il maggiore come lessicografico nelle tabelle */
int indiceMassimoRispettoARigaMatrice(matrice m, int row, tabella nome) {
	int i,max,maxIndex;

	if(row < 0 || row > m.numberOfRows) {
		fprintf(stderr, "Numero riga non valido\n");
		exit(EXIT_FAILURE);
	}

	max = m.mat[row][0];
	maxIndex = 0;
	for(i=1; i<m.rowLength; i++) {
		if(max < m.mat[row][i]) {
			max = m.mat[row][i];
			maxIndex = i;
		}
		else if(max == m.mat[row][i]) {
			if(strcmp(leggiValoreTabella(nome, maxIndex), leggiValoreTabella(nome, i)) > 0) {
				maxIndex = i;
			}
		}
	}

	return maxIndex;
}

/* data una matrice, una riga ed una tabella restituisce il valore minimo della riga
   in caso di parità controlla l'ordine lessicografico */
int indiceMinimoRispettoARigaMatrice(matrice m, int row, tabella nome) {
	int i,min,minIndex;

	if(row < 0 || row > m.numberOfRows) {
		fprintf(stderr, "Numero riga non valido\n");
		exit(EXIT_FAILURE);
	}

	min = m.mat[row][0];
	minIndex = 0;
	for(i=1; i<m.rowLength; i++) {
		if(min > m.mat[row][i]) {
			min = m.mat[row][i];
			minIndex = i;
		}
		else if(min == m.mat[row][i]) {
			if(strcmp(leggiValoreTabella(nome, minIndex), leggiValoreTabella(nome, i)) > 0) {
				minIndex = i;
			}
		}
	}

	return minIndex;
}

/* data una matrice ed un puntatore ad un altra già allocata, copia il contenuto */
void creaCopiaMatrice(matrice *preferenzeCopia, matrice preferenze) {
	int i,j;

	if(preferenzeCopia->numberOfRows != preferenze.numberOfRows) {
		fprintf(stderr, "Impossibile fare copia della matrice per ineguaglianza di numero righe\n");
		exit(EXIT_FAILURE);
	}
	if(preferenzeCopia->rowLength != preferenze.rowLength) {
		fprintf(stderr, "Impossibile fare copia della matrice per ineguaglianza di numero colonne\n");
		exit(EXIT_FAILURE);
	}

	for(i=0; i<preferenze.numberOfRows; i++) {
		for(j=0; j<preferenze.rowLength; j++) {
			preferenzeCopia->mat[i][j] = preferenze.mat[i][j];
		}
	}
}

/* data una lista, un puntatore a matrice e la lunghezza della lista, alloca lo spazio per una matrice 1 dimensionale (vettore)
   copia poi il contenuto della lista nella matrice*/
void listaInMatrice(pizza pizzaInCostruzione, matrice *ingredientiPizza, int numeroIngredienti) {
	ingrediente indiceMovente;
	int i=0;

	inizializzaMatrice(ingredientiPizza, 1, numeroIngredienti);
	indiceMovente = pizzaInCostruzione;
	do {
		ingredientiPizza->mat[0][i] = indiceMovente->data;
		i++;
		indiceMovente = indiceMovente->next;
	}
	while(indiceMovente != pizzaInCostruzione);
}

/* cicla per ogni riga e le dealloca tutte poi dealloca la matrice */
void cancellaMatrice(matrice *m) {
	int i;
	if(m == NULL) {
		return;
	}
	for(i=0; i<m->numberOfRows; i++) free(m->mat[i]);

	free(m->mat);
}

