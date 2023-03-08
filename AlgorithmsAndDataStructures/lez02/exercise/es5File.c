#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

typedef int boolean;
#define TRUE 1
#define FALSE 0

/* sezione dichiarativa funzioni */
void inizializzaVariabili(int argc, char *argv[], char *nomeFile, FILE *problema);
boolean analisiRiga(boolean inDati, char *riga);
void lettura(FILE *problema);

int main(int argc, char *argv[]) {
    FILE *problema;
    char nomeFile[ROW_LENGTH];

    inizializzaVariabili(argc, argv, nomeFile, problema);
    lettura(problema);


    return EXIT_SUCCESS;
}

void inizializzaVariabili(int argc, char *argv[], char *nomeFile, FILE *problema) {
    if(argc==0) {
        fprintf(stderr, "Non e' definito il file da cui leggere\n");
        exit(EXIT_FAILURE);
    }

    strcpy(nomeFile, argv[1]);

    problema = fopen(nomeFile, "r");
    if(problema==NULL) {
        fprintf(stderr, "Errore nell'apertura del file\n");
        exit(EXIT_FAILURE);
    }
}

boolean analisiPrimaRiga(char *riga, char *nomeVar, int *valoreVar) {
    int numeroElementi;

    numeroElementi = sscanf(riga, "param %s := %d ;", nomeVar, valoreVar);

    /* se e' un solo elemento non ho il valore e devo andare a capo*/
    if(numeroElementi) {
        valoreVar = NULL;
        return TRUE;
    }

    return FALSE;
}

/* in completamento */
void lettura(FILE *problema) {
    char *riga=NULL;
    char *nomeVar=NULL;
    boolean inDati = FALSE;

    do {
        /* leggo una riga dal file e controllo che non ci siano errori */
        if(fgets(riga, ROW_LENGTH, problema) == NULL) {
            fprintf(stderr, "Errore nella lettura del file\n");
            exit(EXIT_FAILURE);
        }

        if(strcmp(riga, "end;") == 0)
            break;

        /* se la riga non contiene valori vado avanti */
        if(strlen(riga) == 0)
            continue;

        fprintf(stdout, "%s\n", riga);
        /*if(inDati == FALSE)
            inDati = analisiPrimaRiga(riga);*/

    }
    while(strcmp(riga, "end;") != 0);
}
