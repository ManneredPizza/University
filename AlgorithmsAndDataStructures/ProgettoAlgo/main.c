#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"
#include "matrice.h"
#include "heapsort.h"

#define NUMERO_PREFERENZE 3
#define ESCLUSO -2
#define NESSUNA_RELAZIONE 0
#define GRADITO 1
#define RICHIESTO 2

/* funzioni relative all'inizializzazione del problema */
void interpretaLineaComando(int argc, char *argv[], char *nomeFileIngredienti, char *nomeFileClienti);
void letturaIngredientiDaFile(char *nomeFileIngredienti, tabella *ingredienti);
void letturaClientiDaFile(char *nomeFileClienti, tabella *clienti, tabella *ingredienti, matrice *preferenze);
/* funzioni relative alla classifica degli ingredienti */
void inizializzaClassifica(matrice *classifica, int numeroIngredientiNominati, riga ingredientiNominati,  matrice preferenze);
void ordinaClassifica(matrice *classifica, int numeroIngredientiNominati, tabella ingredienti);
void calcolaOrdinePopolarita(matrice preferenze, tabella ingredienti);

int main(int argc, char *argv[]) {
    char nomeFileIngredienti[ROW_LENGTH];
    char nomeFileClienti[ROW_LENGTH];
    tabella ingredienti;
    tabella clienti;
    matrice preferenze;

    /* Lettura dati da linea di comando */
    interpretaLineaComando(argc, argv, nomeFileIngredienti, nomeFileClienti);

    /* Lettura lista ingredienti */
    inizializzaTabella(&ingredienti);
    letturaIngredientiDaFile(nomeFileIngredienti, &ingredienti);

    /* Lettura lista clienti e preferenze */
    inizializzaTabella(&clienti);
    inizializzaMatrice(&preferenze, 1, ingredienti.length);
    letturaClientiDaFile(nomeFileClienti, &clienti, &ingredienti, &preferenze);

    /* Ordine per popolarita */
    calcolaOrdinePopolarita(preferenze, ingredienti);

    /*  */

    return EXIT_SUCCESS;
}

void interpretaLineaComando(int argc, char *argv[], char *nomeFileIngredienti, char *nomeFileClienti) {
    if (argc != 3) {
        fprintf(stderr, "Errore nella linea di comando!\n");
        exit(EXIT_FAILURE);
    }

    strcpy(nomeFileIngredienti,argv[1]);
    strcpy(nomeFileClienti,argv[2]);
}

void letturaIngredientiDaFile(char *nomeFileIngredienti, tabella *ingredienti) {
    FILE *file;
    int numeroIngredienti;
    int i;
    char ingrediente[LUNGHEZZA_ELEMENTO];

    file = fopen(nomeFileIngredienti, "r");
    if(file == NULL) {
        fprintf(stderr, "Errore nell'apertura del file\n");
        exit(EXIT_FAILURE);
    }

    fscanf(file, "%d", &numeroIngredienti);

    for(i=0; i<numeroIngredienti; i++) {
        fscanf(file, "%s", ingrediente);
        inserimentoElementoTabella(ingrediente, ingredienti);
    }

    fclose(file);
}

void letturaClientiDaFile(char *nomeFileClienti, tabella *clienti, tabella *ingredienti, matrice *preferenze) {
    FILE *file;
    int numeroClienti;
    int i,j,k;
    char cliente[LUNGHEZZA_ELEMENTO];
    int numeroPreferenzeEspresse;
    char *preferenza;
    int indicePreferenza;
    int *elencoPreferenze;
    int listaPreferenzePossibili[NUMERO_PREFERENZE];

    elencoPreferenze = (int*)malloc(ingredienti->length * sizeof(int));
    if(elencoPreferenze == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }
    
    listaPreferenzePossibili[0] = RICHIESTO;
    listaPreferenzePossibili[1] = GRADITO;
    listaPreferenzePossibili[2] = ESCLUSO;

    preferenza = (char*)malloc(NUMERO_PREFERENZE * sizeof(char));
    if(preferenza == NULL) {
        fprintf(stderr, "Impossibile allocare memoria\n");
        exit(EXIT_FAILURE);
    }

    file = fopen(nomeFileClienti, "r");
    if(file == NULL) {
        fprintf(stderr, "Errore nell'apertura del file\n");
        exit(EXIT_FAILURE);
    }

    fscanf(file, "%d", &numeroClienti);

    for(i=0; i<numeroClienti; i++) {
        fscanf(file, "%s", cliente);
        inserimentoElementoTabella(cliente, clienti);

        /* ho altre NUMERO_PREFERENZE righe da gestire, Richiesta, Gradito, Escluso */
        for(j=0; j<ingredienti->length; j++) {
            elencoPreferenze[j] = NESSUNA_RELAZIONE;
        }
        for(j=0; j<NUMERO_PREFERENZE; j++) {
            fscanf(file, "%d", &numeroPreferenzeEspresse);
            for(k=0; k<numeroPreferenzeEspresse; k++) {
                fscanf(file, "%s", preferenza);
                /* trovo indice preferenza */
                indicePreferenza = trovaIndiceDaContenutoTabella(preferenza, ingredienti);
                elencoPreferenze[indicePreferenza] = listaPreferenzePossibili[j];
            }
        }

        inserimentoRigaMatrice(elencoPreferenze, preferenze);
    }

    free(elencoPreferenze);
    free(preferenza);
    fclose(file);
}

void inizializzaClassifica(matrice *classifica, int numeroIngredientiNominati, riga ingredientiNominati, matrice preferenze) {
    int i,j;
    if(numeroIngredientiNominati == 0) {
        fprintf(stderr, "Impossibile creare una classifica di 0 elementi\n");
        exit(EXIT_FAILURE);
    }

    /* 4 è per riga elementi , riga conta esclusi, riga conta richiesti, riga conta graditi */
    inizializzaMatrice(classifica, 4, numeroIngredientiNominati);

    /* ingredientiNominati[] è un indice di colonna */
    for(j=0; j<numeroIngredientiNominati; j++)
        classifica->mat[0][j] = ingredientiNominati[j];

    for(i=0; i<numeroIngredientiNominati; i++) {
        for(j=0; j<preferenze.numberOfRows; j++) {
            /* ottengo per ogni riga un conteggio per ogni tipo di preferenza */
            if(preferenze.mat[j][ingredientiNominati[i]] == ESCLUSO)
                classifica->mat[1][i] = classifica->mat[1][i] + 1;
            /* nei prossimi metto - così da dover ordinare in maniera sempre asc */
            else if(preferenze.mat[j][ingredientiNominati[i]] == RICHIESTO)
                classifica->mat[2][i] = classifica->mat[2][i] - 1;
            else if(preferenze.mat[j][ingredientiNominati[i]] == GRADITO)
                classifica->mat[3][i] = classifica->mat[3][i] - 1;
        }
    }
}

void ordinaClassifica(matrice *classifica, int numeroIngredientiNominati, tabella ingredienti) {
    int i,j,k;
    riga tempVal;
    matrice tempM;

    /* k serve per dire che se ordine per RICHIESTI deve tenere conto del cluster con uguale ESCLUSO
        mentre l'ordine per GRADITI deve tenere conto del cluster con stesso ESCLUSO e RICHIESTI */
    for(k=0; k<4; k++) {
        i = 0;
        j = 0;
        /* qui definisco i numeri che caratterizzano il cluster */
        copiaColonnaInRiga(&tempVal, classifica->mat, k, 1, j);

        while(j<numeroIngredientiNominati) {
            /* se ne varia almeno uno */
            if(confrontaRigaColonna(tempVal, classifica->mat, k, 1, j) == 0) {
                /* ne ho più di uno nel cluster */
                if(abs(i-j)>1) {
                    /* matrice temporanea: questo è il cluster */
                    inizializzaMatrice(&tempM, 4, j-i);
                    copiaColonnePorzioneMatrice(&tempM, 0, *classifica, i, j);
                    /* ordino la temporanea */
                    if(k < 3)
                        heapSortCustom(&tempM, j-i, k+1);
                    else
                        heapSortCustomLex(&tempM, j-i, ingredienti);
                    /* la reinserisco */
                    copiaColonnePorzioneMatrice(classifica, i, tempM, 0, tempM.rowLength);
                }
                i=j;
                /* mi muovo verso un nuovo cluster */
                copiaColonnaInRiga(&tempVal, classifica->mat, k, 1, j);
            }
            j=j+1;

            /* arrivati all'ultimo passo ordino */
            if(j==numeroIngredientiNominati) {
                inizializzaMatrice(&tempM, 4, j-i);
                copiaColonnePorzioneMatrice(&tempM, 0, *classifica, i, j);
                if(k < 3)
                    heapSortCustom(&tempM, j-i, k+1);
                else
                    heapSortCustomLex(&tempM, j-i, ingredienti);
                copiaColonnePorzioneMatrice(classifica, i, tempM, 0, tempM.rowLength);
            }
        }
    }
}

void calcolaOrdinePopolarita(matrice preferenze, tabella ingredienti) {
    matrice classifica;
    riga ingredientiNominati;
    int numeroIngredientiNominati;
    int i,j;

    numeroIngredientiNominati = numeroColonneNonVuote(preferenze, &ingredientiNominati);

    fprintf(stdout, "%d ingredienti\n", numeroIngredientiNominati);

    /* costruisco una matrice con il numero di volte che la ~colonna è stata valutata con una certa preferenza */
    inizializzaClassifica(&classifica, numeroIngredientiNominati, ingredientiNominati, preferenze);

    /* ordino per richieste e poi per graditi e poi per lessicografico */
    ordinaClassifica(&classifica, numeroIngredientiNominati, ingredienti);

    /* stampo come da richiesta*/
    for(i=0; i<numeroIngredientiNominati; i++) {
        fprintf(stdout, "%s ", ingredienti.V[classifica.mat[0][i]]);
        for(j=1; j<4; j++) {
            fprintf(stdout, "%d ", abs(classifica.mat[j][i]));
        }
        fprintf(stdout, "\n");
    }
    
}




























