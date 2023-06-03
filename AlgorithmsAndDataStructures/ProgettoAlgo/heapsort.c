#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "matrice.h"
#include "tabella.h"
#include "heapsort.h"

/* Aggiorna l'heap V di lunghezza n correggendo l'eventuale errore in posizione i */
void aggiornaheap(matrice *m, int n, int i, int rigaConfronto) {
  int s, d;
  int iMax;

  /* Identifica i nodi figli di quello potenzialmente scorretto */
  s = 2*i;
  d = 2*i+1;

  /* Determina il massimo fra il padre e i due nodi figli */
  iMax = i;
  if ( (s < n) && (m->mat[rigaConfronto][s] > m->mat[rigaConfronto][iMax]) ) iMax = s;
  if ( (d < n) && (m->mat[rigaConfronto][d] > m->mat[rigaConfronto][iMax]) ) iMax = d;

  /* Se l'heap e' scorretto, scambia padre e figlio e corregge il sottoalbero figlio */
  if (iMax != i) {
    invertiColonneMatrice(m, iMax, i);
    aggiornaheap(m,n,iMax,rigaConfronto);
  }
}

/* Trasforma il vettore di interi V di lunghezza n in un max-heap */
void creaheap(matrice *m, int n, int rigaConfronto) {
  int i;

  for (i = n/2; i >= 0; i--)
    aggiornaheap(m,n,i,rigaConfronto);
}


/* Ordina il vettore V di interi di lunghezza n con l'algoritmo HeapSort */
void heapSortCustom(matrice *m, int n, int rigaConfronto) {
  int j;

  creaheap(m,n,rigaConfronto);
  for (j = n-1; j > 0; j--) {
    invertiColonneMatrice(m, 0, j);
    aggiornaheap(m,j,0,rigaConfronto);
  }
}

void aggiornaheapLex(matrice *m, int n, int i, tabella nomi) {
  int s, d;
  int iMax;

  s = 2*i;
  d = 2*i+1;

  iMax = i;
  if ( (s < n) && (strcmp(nomi.V[m->mat[0][s]],nomi.V[m->mat[0][iMax]]) > 0) ) iMax = s;
  if ( (d < n) && (strcmp(nomi.V[m->mat[0][d]],nomi.V[m->mat[0][iMax]]) > 0) ) iMax = d;

  if (iMax != i) {
    invertiColonneMatrice(m, iMax, i);
    aggiornaheapLex(m,n,iMax,nomi);
  }
}

void creaheapLex(matrice *m, int n, tabella nomi) {
  int i;

  for (i = n/2; i >= 0; i--)
    aggiornaheapLex(m,n,i,nomi);
}

/* stesso algoritmo di cui sopra ma il confronto avviene lessicografico su nomi con indice 1 riga matrice */
void heapSortCustomLex(matrice *m, int n, tabella nomi) {
  int j;

  creaheapLex(m,n,nomi);
  for (j = n-1; j > 0; j--) {
    invertiColonneMatrice(m, 0, j);
    aggiornaheapLex(m,j,0,nomi);
  }
}
