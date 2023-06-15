#include <stdio.h>
#include <stdlib.h>
#include "liste.h"

/* alloca lo spazio per un nodo dando come valore il payload */
pizza creaLista(int payload) {
	pizza l;

	l = (pizza)malloc(sizeof(nodo));

	if(l==NULL) {
		fprintf(stderr, "Impossibile allocare la pizza\n");
		exit(EXIT_FAILURE);
	}

	l->data = payload;
	l->next = l;
	l->pre = l;

	return l;
}

/* crea un vettore di pizze (puntatori a nodi) di lunghezza lunghezzaMaxMenu */
void creaMenuLista(menu *m, int lunghezzaMaxMenu) {
	m->listaPizze = (pizza*)malloc(lunghezzaMaxMenu*sizeof(pizza));
	m->lunghezzaMaxMenu = lunghezzaMaxMenu;

	if(m==NULL) {
		fprintf(stderr, "Impossibile allocare il menu\n");
		exit(EXIT_FAILURE);
	}
}

/* alloca lo spazio per una nuova pizza nella posizione index del vettore menu */
void nuovaPizzaInMenu(menu *m, int index) {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index] = (pizza)malloc(sizeof(nodo));

	if(m->listaPizze[index]==NULL) {
		fprintf(stderr, "Impossibile allocare la pizza\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index]->data = 0;
	m->listaPizze[index]->next = m->listaPizze[index];
	m->listaPizze[index]->pre = m->listaPizze[index];
}

/* data la posizione index restituisce il puntatore alla pizza nel menu */
pizza leggiPizzaDaMenu(menu *m, int index)  {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	return m->listaPizze[index];
}

/* data la posizione permette di cambiare il puntatore presente nell'indice index del vettore menu */
void cambiaPizza(menu *m, int index, pizza p) {
	if(index >= m->lunghezzaMaxMenu) {
		fprintf(stderr, "Indice superiore alla lunghezza massima del menu\n");
		exit(EXIT_FAILURE);
	}

	m->listaPizze[index] = p;
}

/* scorre tutta la lista fino a che il nodo successivo è il primo della lista
   incrementa un counter ogni volta e restituisce il numero di elementi nella lista */
int recuperaLunghezzaLista(pizza l) {
	int i=1;
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->next != l) {
		i++;
		indiceMovente = indiceMovente->next;
	}

	return i;
}

/* restitusce il puntatore all'ingrediente successivo */
ingrediente nextIngredienteLista(ingrediente l) {
	return l->next;
}

/* inserisce un valore intero dato un puntatore ad un ingrediente */
void inserisciElementoLista(ingrediente l, int payload) {
	if(l==NULL) {
		fprintf(stderr, "Il puntatore alla pizza non può essere nullo\n");
		exit(EXIT_FAILURE);
	}

	l->data = payload;
}

/* restituisce l'intero dato il puntatore ad un ingrediente */
int leggiElementoLista(ingrediente l) {
	if(l==NULL) {
		fprintf(stderr, "Il puntatore alla pizza non può essere nullo\n");
		exit(EXIT_FAILURE);
	}

	return l->data;
}

/* lega il blocco precedente con il successivo nella lista e cancella il blocco puntato da del */
void eliminaElementoLista(ingrediente del) {
	if(del == NULL) {
		return;
	}
	del->pre->next = del->next;
	del->next->pre = del->pre;

	free(del);
}

/* crea un nodo con contenuto payload e lo posiziona tra l'ultimo ed il primo della lista */
void inserisciNodoFondoLista(pizza l, int payload) {
	ingrediente nuovoNodo;

	nuovoNodo = (nodo*)malloc(sizeof(nodo));

	nuovoNodo->data = payload;

	/* il precedente del nuovo sarà il vecchio ultimo */
	nuovoNodo->pre = l->pre;
	/* il successivo del nuovo sarà il primo */
	nuovoNodo->next = l;
	/* il successivo del'ultimo sarà il nuovo */
	nuovoNodo->pre->next = nuovoNodo;
	/* il precedente del primo sarà l'ultimo */
	l->pre = nuovoNodo;
}

/* dati due puntatori a liste scorre copyFrom e ad ogni blocco ne genera una copia in fondo a copyTo */
void creaCopiaLista(pizza copyTo, pizza copyFrom) {
	ingrediente indiceMoventeCopyFrom;

	indiceMoventeCopyFrom = copyFrom;

	copyTo->data = indiceMoventeCopyFrom->data;

	while(indiceMoventeCopyFrom->next != copyFrom) {
		indiceMoventeCopyFrom = indiceMoventeCopyFrom->next;
		inserisciNodoFondoLista(copyTo, indiceMoventeCopyFrom->data);
	}
}

/* scorre la lista finché non trova needle se ritorna a quello di partenza senza trovarlo ritorna NULL */
ingrediente indiceDatoContenutoInLista(pizza l, int needle) {
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->data != needle) {
		if(indiceMovente->next == l) return NULL;
		indiceMovente = indiceMovente->next;
	}
	return indiceMovente;
}

/* scorre la lista deallocando la memoria di ogni blocco */
void cancellaLista(pizza l) {
	ingrediente indiceMovente;

	indiceMovente = l;
	while(indiceMovente->next != l) {
		indiceMovente = indiceMovente->next;
		free(indiceMovente->pre);
	}

	free(indiceMovente);
}

/* dealloca la memoria del vettore di puntatori pizza */
void cancellaMenu(menu *m) {
	free(m->listaPizze);
}
