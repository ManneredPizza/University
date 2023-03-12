#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

/* prototipi funzioni secondarie */
void letturaDaTerminale(int argc, char *argv[], char *nomeFile);
int leggiNumeri(char *nomeFile, int **listNumber);
void swap(int *a, int *b);
int *quickSort(int *listNumber, int length);

int main(int argc, char *argv[]) {
    /* parte dichiarativa */
    char nomeFile[ROW_LENGTH];
    int *listNumber = NULL;
    int *totale = NULL;
    int listLength;
    int i;

    letturaDaTerminale(argc, argv, nomeFile);

    listLength = leggiNumeri(nomeFile, &listNumber);

    totale = quickSort(listNumber, listLength);

    for(i=0; i<listLength; i++)
        fprintf(stdout, "%d\n", totale[i]);

    free(listNumber);
    free(totale);

    return EXIT_SUCCESS;
}

void letturaDaTerminale(int argc, char *argv[], char *nomeFile) {
    if(argc != 2) {
        fprintf(stderr, "Mancano dati da terminale\n");
        exit(EXIT_FAILURE);
    }

    strcpy(nomeFile, argv[1]);
}

int leggiNumeri(char *nomeFile, int **listNumber) {
    FILE *fp_numeri;
    int i=1;

    fp_numeri = fopen(nomeFile, "r");

    if(fp_numeri == NULL) {
        fprintf(stderr, "Impossibile aprire il file \n");
        exit(EXIT_FAILURE);
    }

    *listNumber = (int *)malloc(sizeof(int));
    if (*listNumber == NULL) {
        fprintf(stderr,"Allocazione fallita!\n");
        exit(EXIT_FAILURE);
    }

    /* *listNumber è il puntatore alla stringa, &(*listNumber) è la referenza di quella cella, &(*listNumber)[i-1] lo faccio scorrere per tutta la stringa */
    while(fscanf(fp_numeri, "%d", &(*listNumber)[i-1]) == 1) {
        i++;
        *listNumber = (int *)realloc(*listNumber, sizeof(int)*i);
        if (*listNumber == NULL) {
            fprintf(stderr,"Allocazione fallita!\n");
            exit(EXIT_FAILURE);
        }
    }

    fclose(fp_numeri);

    return i-1;
}

void swap(int *a, int *b) {
    int temp;

    temp = *a;
    *a = *b;
    *b = temp;
}

int *quickSort(int *listNumber, int length) {
    int pivot;
    int *part1=NULL;
    int *part1T=NULL;
    int length1=0;
    int *part2=NULL;
    int *part2T=NULL;
    int length2=0;
    int *totale = NULL;
    int i;

    if(length == 0)
        return NULL;
    else if(length == 1)
        return listNumber;
    else if(length == 2) {
        if(listNumber[0] > listNumber[1])
            swap(&listNumber[0], &listNumber[1]);
        return listNumber;
    }

    pivot = listNumber[0];

    for(i=1; i<length; i++) {
        if(listNumber[i] <= pivot) {
            length1++;
            if(length1 == 1) {
                part1 = (int *)malloc(sizeof(int));
            }
            else {
                part1 = (int *)realloc(part1, sizeof(int)*length1);
            }
            part1[length1-1] = listNumber[i];
        }
        else {
            length2++;
            if(length2 == 1) {
                part2 = (int *)malloc(sizeof(int));
            }
            else {
                part2 = (int *)realloc(part2, sizeof(int)*length2);
            }
            part2[length2-1] = listNumber[i];
        }
    }

    part1T = quickSort(part1, length1);
    part2T = quickSort(part2, length2);

    totale = (int *)malloc(sizeof(int)*(length1+length2+1));
    for(i=0; i<length1; i++)
        totale[i] = part1T[i];
    totale[length1] = pivot;
    for(i=0; i<length2; i++)
        totale[i+length1+1] = part2T[i];

    free(part1);
    free(part2);
    free(part1T);
    free(part2T);

    return totale;
}
