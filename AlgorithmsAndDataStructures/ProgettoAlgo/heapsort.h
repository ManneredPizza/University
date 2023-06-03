#ifndef __HEAPSORT_H
#define __HEAPSORT_H

void aggiornaheap(matrice *m, int n, int i, int rigaConfronto);

void creaheap(matrice *m, int n, int rigaConfronto);

void heapSortCustom(matrice *m, int n, int rigaConfronto);

void aggiornaheapLex(matrice *m, int n, int i, tabella nomi);

void creaheapLex(matrice *m, int n, tabella nomi);

void heapSortCustomLex(matrice *m, int n, tabella nomi);

#endif

