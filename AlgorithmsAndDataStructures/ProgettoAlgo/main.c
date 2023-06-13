#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tabella.h"
#include "matrice.h"
#include "heapsort.h"
#include "matriceSimmetrica.h"
#include "liste.h"

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
void inizializzaClassificaPopolarita(matrice *classifica, int numeroIngredientiNominati, riga ingredientiNominati,  matrice preferenze);
void ordinaClassifica(matrice *classifica, int numeroElementiClassifica, tabella tabellaNomi, int numeroLivelliOrdinamento); /* utile per esigenza e incompatibilità */
void calcolaOrdinePopolarita(matrice preferenze, tabella ingredienti);
/* funzioni relative alla classifica per esigenza */
void inizializzaClassificaEsigenza(matrice *classifica, int numeroClienti, matrice preferenze);
void calcolaOrdineEsigenza(matrice preferenze, tabella clienti);
/* funzioni relative alla lista del numero di esclusi per dato numero di clienti */
void inizializzaClassificaIngrEsclusi(matrice *classifica, int numeroIngredienti, matrice preferenze);
void ingredientiEsclusiPerNumeroClienti(matrice preferenze);
/* funzioni relative alla stampa delle coppie incompatibili */
void calcoloCoppieIncompatibili(matriceSimmetrica *incompatibili, matrice preferenze, tabella clienti);
/* funzioni relatative alla stima inf del numero di pizze */
void calcoloNumeroIncompatibiliPerCliente(matrice *classificaIncompatibili, matriceSimmetrica incompatibili, int numeroClienti);
void calcoloStimaInfNumeroPizza(matriceSimmetrica incompatibili, tabella clienti);
/* funzioni relative al menu */
void aggiornaListaClientiSoddisfatti(matrice *clientiSoddisfatti, int *numeroClientiSoddisfatti, matrice preferenze, int ingrediente);
void modificaPreferenzeIngrediente(matrice *preferenze, int ingrediente);
void creazionePizza(matrice preferenze, tabella ingredienti, tabella clienti, matrice *clientiSoddisfatti);
void calcoloStimaMenuPizza(matrice preferenze, tabella ingredienti, tabella clienti);

int main(int argc, char *argv[]) {
    char nomeFileIngredienti[ROW_LENGTH];
    char nomeFileClienti[ROW_LENGTH];
    tabella ingredienti;
    tabella clienti;
    matrice preferenze;
    matriceSimmetrica incompatibili;

    /* Lettura dati da linea di comando */
    interpretaLineaComando(argc, argv, nomeFileIngredienti, nomeFileClienti);

    /* Lettura lista ingredienti */
    inizializzaTabella(&ingredienti);
    letturaIngredientiDaFile(nomeFileIngredienti, &ingredienti);

    /* Lettura lista clienti e preferenze */
    inizializzaTabella(&clienti);
    inizializzaMatrice(&preferenze, 1, leggiLunghezza(ingredienti));
    letturaClientiDaFile(nomeFileClienti, &clienti, &ingredienti, &preferenze);

    /* Ordine ingredienti per popolarita */
    calcolaOrdinePopolarita(preferenze, ingredienti);

    /* Ordine esigenza clienti */
    calcolaOrdineEsigenza(preferenze, clienti); 

    /* Numero ingredienti esclusi per un dato numero di clienti */
    ingredientiEsclusiPerNumeroClienti(preferenze);

    /* Coppie incompatibili */
    calcoloCoppieIncompatibili(&incompatibili, preferenze, clienti);

    /* Calcolo numero inf pizze necessarie */
    calcoloStimaInfNumeroPizza(incompatibili, clienti);

    /* Calcolo pizze menu */
    calcoloStimaMenuPizza(preferenze, ingredienti, clienti);

    /* Libero la memoria */
    cancellaTabella(&ingredienti);
    cancellaTabella(&clienti);
    cancellaMatrice(&preferenze);
    cancellaMatriceSimmetrica(&incompatibili);

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

    elencoPreferenze = (int*)malloc(leggiLunghezza(*ingredienti) * sizeof(int));
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
        for(j=0; j<leggiLunghezza(*ingredienti); j++) {
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

        if(i!=0) {
            aggiungiRigaVuotaMatrice(preferenze);
        }
        inserimentoRigaMatrice(elencoPreferenze, preferenze);
    }

    free(elencoPreferenze);
    free(preferenza);
    fclose(file);
}

void inizializzaClassificaPopolarita(matrice *classifica, int numeroIngredientiNominati, riga ingredientiNominati, matrice preferenze) {
    int i,j;
    int elementoMatrice;
    int numeroRighePreferenze;
    if(numeroIngredientiNominati == 0) {
        fprintf(stderr, "Impossibile creare una classifica di 0 elementi\n");
        exit(EXIT_FAILURE);
    }

    /* 4 è per riga elementi , riga conta esclusi, riga conta richiesti, riga conta graditi */
    inizializzaMatrice(classifica, 4, numeroIngredientiNominati);

    /* ingredientiNominati[] è un indice di colonna */
    for(j=0; j<numeroIngredientiNominati; j++)
        inserimentoElementoMatrice(classifica, 0, j, ingredientiNominati[j]);

    numeroRighePreferenze = numeroRigheMatrice(preferenze);

    for(i=0; i<numeroIngredientiNominati; i++) {
        for(j=0; j<numeroRighePreferenze; j++) {
            elementoMatrice = leggiValoreMatrice(preferenze, j, ingredientiNominati[i]);
            /* ottengo per ogni riga un conteggio per ogni tipo di preferenza */
            if(elementoMatrice == ESCLUSO)
                aggiungiElementoMatrice(classifica, 1, i, 1);
            /* nei prossimi metto - così da dover ordinare in maniera sempre asc */
            else if(elementoMatrice == RICHIESTO)
                aggiungiElementoMatrice(classifica, 2, i, -1);
            else if(elementoMatrice == GRADITO)
                aggiungiElementoMatrice(classifica, 3, i, -1);
        }
    }
}

void ordinaClassifica(matrice *classifica, int numeroElementiClassifica, tabella tabellaNomi, int numeroLivelliOrdinamento) {
    int i,j,k;
    riga tempVal;
    matrice tempM;
    int numeroColonneTempM;

    if(numeroLivelliOrdinamento < 0 || numeroLivelliOrdinamento > 4) {
        fprintf(stderr, "numeroLivelliOrdinamento può essere solo 1, 2, 3 o 4\n");
        exit(EXIT_FAILURE);
    }


    /* k serve per dire che se ordine per RICHIESTI deve tenere conto del cluster con uguale ESCLUSO
        mentre l'ordine per GRADITI deve tenere conto del cluster con stesso ESCLUSO e RICHIESTI */
    for(k=0; k<numeroLivelliOrdinamento; k++) {
        i = 0;
        j = 0;
        /* qui definisco i numeri che caratterizzano il cluster */
        copiaColonnaInRiga(&tempVal, recuperaMatrice(classifica), k, 1, j);

        while(j<numeroElementiClassifica) {
            /* se ne varia almeno uno */
            if(confrontaRigaColonna(tempVal, recuperaMatrice(classifica), k, 1, j) == 0) {
                /* ne ho più di uno nel cluster */
                if(abs(i-j)>1) {
                    /* matrice temporanea: questo è il cluster */
                    inizializzaMatrice(&tempM, numeroLivelliOrdinamento, j-i);
                    copiaColonnePorzioneMatrice(&tempM, 0, *classifica, i, j);
                    /* ordino la temporanea */
                    if(k < numeroLivelliOrdinamento-1)
                        heapSortCustom(&tempM, j-i, k+1);
                    else
                        heapSortCustomLex(&tempM, j-i, tabellaNomi);
                    /* la reinserisco */
                    numeroColonneTempM = numeroColonneMatrice(tempM);
                    copiaColonnePorzioneMatrice(classifica, i, tempM, 0, numeroColonneTempM);
                }
                i=j;
                /* mi muovo verso un nuovo cluster */
                copiaColonnaInRiga(&tempVal, recuperaMatrice(classifica), k, 1, j);
            }
            j=j+1;

            /* arrivati all'ultimo passo ordino */
            if(j==numeroElementiClassifica) {
                inizializzaMatrice(&tempM, numeroLivelliOrdinamento, j-i);
                copiaColonnePorzioneMatrice(&tempM, 0, *classifica, i, j);
                if(k < numeroLivelliOrdinamento-1)
                    heapSortCustom(&tempM, j-i, k+1);
                else
                    heapSortCustomLex(&tempM, j-i, tabellaNomi);
                numeroColonneTempM = numeroColonneMatrice(tempM);
                copiaColonnePorzioneMatrice(classifica, i, tempM, 0, numeroColonneTempM);
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
    inizializzaClassificaPopolarita(&classifica, numeroIngredientiNominati, ingredientiNominati, preferenze);

    /* ordino per richieste e poi per graditi e poi per lessicografico */
    ordinaClassifica(&classifica, numeroIngredientiNominati, ingredienti, 4);

    /* stampo come da richiesta*/
    for(i=0; i<numeroIngredientiNominati; i++) {
        fprintf(stdout, "%s", leggiValoreTabella(ingredienti, leggiValoreMatrice(classifica, 0, i)));
        for(j=1; j<4; j++) {
            fprintf(stdout, " ");
            fprintf(stdout, "%d", abs(leggiValoreMatrice(classifica, j, i)));
        }
        fprintf(stdout, "\n");
    }
}

void inizializzaClassificaEsigenza(matrice *classifica, int numeroClienti, matrice preferenze) {
    int i,j;
    int numeroColonnePreferenze;
    int preferenzaEspressa;
    if(numeroClienti == 0) {
        fprintf(stderr, "Impossibile creare una classifica di 0 elementi\n");
        exit(EXIT_FAILURE);
    }

    /* 3 è per riga elementi , riga conta forti, riga conta deboli */
    inizializzaMatrice(classifica, 3, numeroClienti);

    numeroColonnePreferenze = numeroColonneMatrice(preferenze);

    for(j=0; j<numeroClienti; j++)
        inserimentoElementoMatrice(classifica, 0, j, j);

    for(i=0; i<numeroClienti; i++) {
        for(j=0; j<numeroColonnePreferenze; j++) {
            /* metto i meno per usare l'asgoritmo di ordine asc */
            preferenzaEspressa = leggiValoreMatrice(preferenze, i, j);
            if(preferenzaEspressa == ESCLUSO || preferenzaEspressa == RICHIESTO)
                aggiungiElementoMatrice(classifica, 1, i, 1);
            else if(preferenzaEspressa == GRADITO)
                aggiungiElementoMatrice(classifica, 2, i, 1);
        }
    }
}

void calcolaOrdineEsigenza(matrice preferenze, tabella clienti) {
    matrice classifica;
    int numeroClienti;
    int i,j;

    numeroClienti = numeroRigheMatrice(preferenze);

    fprintf(stdout, "%d clienti\n", numeroClienti);

    /* costruisco una matrice dove ogni colonna è un cliente con due righe sotto, numero vincoli forti e numero vincoli deboli */
    inizializzaClassificaEsigenza(&classifica, numeroClienti, preferenze);

    /* ordino per richieste e poi per graditi e poi per lessicografico */
    ordinaClassifica(&classifica, numeroClienti, clienti, 3);

    /* stampo come da richiesta*/
    for(i=0; i<numeroClienti; i++) {
        fprintf(stdout, "%s", leggiValoreTabella(clienti, leggiValoreMatrice(classifica, 0, i)));
        for(j=1; j<3; j++) {
            fprintf(stdout, " ");
            fprintf(stdout, "%d", abs(leggiValoreMatrice(classifica, j, i)));
        }
        fprintf(stdout, "\n");
    }
}

void inizializzaClassificaIngrEsclusi(matrice *classifica, int numeroIngredienti, matrice preferenze) {
    int i,j;
    int numeroRighePreferenze;
    int preferenzaEspressa;
    if(numeroIngredienti == 0) {
        fprintf(stderr, "Impossibile creare una classifica di 0 elementi\n");
        exit(EXIT_FAILURE);
    }

    /* 2 è per riga elementi , riga conta esclusioni */
    inizializzaMatrice(classifica, 2, numeroIngredienti);

    numeroRighePreferenze = numeroRigheMatrice(preferenze);

    for(i=0; i<numeroIngredienti; i++) {
        aggiungiElementoMatrice(classifica, 0, i, i);
        for(j=0; j<numeroRighePreferenze; j++) {
            /* ottengo per ogni riga un conteggio per ogni tipo di preferenza */
            preferenzaEspressa = leggiValoreMatrice(preferenze, j, i);
            if(preferenzaEspressa == ESCLUSO)
                aggiungiElementoMatrice(classifica, 1, i, 1);
        }
    }
}

void ingredientiEsclusiPerNumeroClienti(matrice preferenze) {
    int numeroIngredienti;
    int i, counter, numeroInConfronto, nuovoNumeroInConfronto;
    matrice classificaIngredientiPerEsclusioni;

    numeroIngredienti = numeroColonneMatrice(preferenze);

    /* genero una matrice in cui in prima riga ci sono gli indici ed in seconda ci sono il numero di esclusioni per l'indice */
    inizializzaClassificaIngrEsclusi(&classificaIngredientiPerEsclusioni, numeroIngredienti, preferenze);

    /* lo ordino con un heapsort */
    heapSortCustom(&classificaIngredientiPerEsclusioni, numeroIngredienti, 1);

    fprintf(stdout, "esclusioni\n");

    /* ciclo fino alla fine, stampo ogni volta che cambia il numero di esclusioni */
    counter = 0;
    numeroInConfronto = leggiValoreMatrice(classificaIngredientiPerEsclusioni, 1, 0);
    for(i=0; i<numeroIngredienti; i++) {
        nuovoNumeroInConfronto = leggiValoreMatrice(classificaIngredientiPerEsclusioni, 1, i);
        if(numeroInConfronto != nuovoNumeroInConfronto) {
            fprintf(stdout, "%d per %d clienti\n", counter, numeroInConfronto);
            numeroInConfronto = nuovoNumeroInConfronto;
            counter = 0;
        }
        counter++;
    }
    /* se esce e non ha ancora stampato l'ultimo chunck, lo stampo */
    if(counter != 0) fprintf(stdout, "%d per %d clienti\n", counter, numeroInConfronto);
}

void calcoloCoppieIncompatibili(matriceSimmetrica *incompatibili, matrice preferenze, tabella clienti) {
    int numIncompatibili=0;
    int numeroClienti;
    int i,j,k;
    int numeroColonnePreferenze;
    int preferenzaEspressaCli1, preferenzaEspressaCli2;
    matrice coppieIncompatibili;

    numeroClienti = numeroRigheMatrice(preferenze);
    inizializzaMatriceSimmetrica(incompatibili, numeroClienti);

    numeroColonnePreferenze = numeroColonneMatrice(preferenze);

    /* creo una matrice da due colonne dove ogni riga è una coppia incompatibile */
    inizializzaMatrice(&coppieIncompatibili, 1, 2);

    for(i = 0; i < numeroClienti; i++) {
        for(j = i; j < numeroClienti; j++) {
            for(k = 0; k < numeroColonnePreferenze; k++) {
                preferenzaEspressaCli1 = leggiValoreMatrice(preferenze, i, k);
                preferenzaEspressaCli2 = leggiValoreMatrice(preferenze, j, k);
                if((preferenzaEspressaCli1 == ESCLUSO && preferenzaEspressaCli2 == RICHIESTO) || (preferenzaEspressaCli1 == RICHIESTO && preferenzaEspressaCli2 == ESCLUSO)) {
                    inserisciValoreMatriceSimmetrica(incompatibili, i, j, 1);
                    if(numIncompatibili > 0) aggiungiRigaVuotaMatrice(&coppieIncompatibili);
                    inserimentoElementoMatrice(&coppieIncompatibili, numIncompatibili, 0, i);
                    inserimentoElementoMatrice(&coppieIncompatibili, numIncompatibili, 1, j);
                    numIncompatibili++;
                    break;
                }
            }
        }
    }

    fprintf(stdout, "%d coppie incompatibili\n", numIncompatibili);

    for(i=0; i<numIncompatibili; i++) {
        fprintf(stdout, "%s %s\n", leggiValoreTabella(clienti, leggiValoreMatrice(coppieIncompatibili, i, 0)), leggiValoreTabella(clienti, leggiValoreMatrice(coppieIncompatibili, i, 1)));
    }
}

void calcoloNumeroIncompatibiliPerCliente(matrice *classificaIncompatibili, matriceSimmetrica incompatibili, int numeroClienti) {
    int i,j;

    for(i=0; i<numeroClienti; i++) {
        inserimentoElementoMatrice(classificaIncompatibili, 0, i, i);
        for(j=0; j<i; j++) {
            if(leggiValoreMatriceSimmetrica(incompatibili, i, j) == 1) {
                aggiungiElementoMatrice(classificaIncompatibili, 1, i, 1);
                aggiungiElementoMatrice(classificaIncompatibili, 1, j, 1);
            }
        }
    }
}

void calcoloStimaInfNumeroPizza(matriceSimmetrica incompatibili, tabella clienti) {
    matrice classificaIncompatibili;
    matrice incompatibiliACoppie;
    int i,j;
    int totaleClienti, clientiEffettivi;
    int indiceIncompatibileAccertato, indiceIncompatibileDaControllare;
    int greedyContinua;
    int incompatibileConPrecedenti;
    int indiceNuovoIncompatibile;

    totaleClienti = leggiGrandezzaMatriceSimmetrica(incompatibili);

    /* creo una matrice di 2 righe x numero di clienti, la prima riga sono gli indici dei clienti
        la seconda il numero di incompatibilità */
    inizializzaMatrice(&classificaIncompatibili, 2, totaleClienti);
    calcoloNumeroIncompatibiliPerCliente(&classificaIncompatibili, incompatibili, totaleClienti);    

    clientiEffettivi = 0;
    do {
        greedyContinua = 0;    
        /* aggiungo una riga vuota a classificaIncompatibili la compilo con numeri < 0 dove non mi serve e positivi dove mi serve */
        if(clientiEffettivi != 0) {
            for(i=0; i<totaleClienti; i++) {
                /* prendo tutti i clienti nell'ordine della classifica già fatta */
                indiceIncompatibileDaControllare = leggiValoreMatrice(classificaIncompatibili,0,i);
                /* controllo con tutti i precedentemente messi in lista e vedo se è incompatibile con tutti */
                incompatibileConPrecedenti = 1;
                for(j=0; j<clientiEffettivi; j++) {
                    indiceIncompatibileAccertato = leggiValoreMatrice(incompatibiliACoppie, 0, j);
                    if(leggiValoreMatriceSimmetrica(incompatibili,indiceIncompatibileAccertato,indiceIncompatibileDaControllare) == 0) {
                        incompatibileConPrecedenti = 0;
                    }
                }
                /* se sono compatibili metto a -1 così quando riordino vanno a sx e a dx rimane quello incompatibile con tutti gli scelti con i massimo numero di incompatibilità */
                if(incompatibileConPrecedenti == 0) {
                    inserimentoElementoMatrice(&classificaIncompatibili, 1, i, -1);
                }
                else {
                    greedyContinua = 1;
                }
            }
        }
        else {
            greedyContinua = 1;
        }

        if(greedyContinua == 1) {
            /* ordino per incompatibilità e poi per lessicografico */
            indiceNuovoIncompatibile = indiceMassimoRispettoARigaMatrice(classificaIncompatibili, 1, clienti);
            
            /* creo la matrice 1-dim (vettore) che contiene i clienti incompatibili a coppie */
            if(clientiEffettivi == 0) inizializzaMatrice(&incompatibiliACoppie, 1, 1);
            else aggiuntaColonnaMatrice(&incompatibiliACoppie); /* se no aggiungo una colonna */
            /* metto il cliente più incompatibile */
            inserimentoElementoMatrice(&incompatibiliACoppie, 0, clientiEffettivi, leggiValoreMatrice(classificaIncompatibili, 0, indiceNuovoIncompatibile));
            clientiEffettivi++;

            ordinaClassifica(&incompatibiliACoppie, clientiEffettivi, clienti, 1);
        }
    }
    while(greedyContinua == 1);

    /* ordine degli incompatibili a coppie tramite lessicografico */
    ordinaClassifica(&incompatibiliACoppie, clientiEffettivi, clienti, 1);

    fprintf(stdout, "almeno %d pizze\n", clientiEffettivi);
    for(i=0; i<clientiEffettivi; i++)
        fprintf(stdout, "%s ", leggiValoreTabella(clienti, leggiValoreMatrice(incompatibiliACoppie, 0, i)));
    fprintf(stdout, "\n");
}

void aggiornaListaClientiSoddisfatti(matrice *clientiSoddisfatti, int *numeroClientiSoddisfatti, matrice preferenze, int ingrediente) {
    int i;
    int numeroClienti, numeroIngredienti;
    int indiceClienteInsoddisfatto;

    numeroIngredienti = numeroColonneMatrice(preferenze);

    if(ingrediente < 0 || ingrediente >= numeroIngredienti) {
        fprintf(stderr, "Errore indice ingrediente\n");
        exit(EXIT_FAILURE);
    }

    numeroClienti = numeroRigheMatrice(preferenze);

    for(i=0; i<numeroClienti; i++) {
        /* se l'ingrediente aggiunto la esclude */
        if(leggiValoreMatrice(preferenze, i, ingrediente) == ESCLUSO) {
            /* trovo il suo indice nella matrice clientiSoddisfatti */
            indiceClienteInsoddisfatto = indiceDatoContenutoERigaMatrice(*clientiSoddisfatti, 0, i);
            /* elimino il cliente dalla matrice */
            if(indiceClienteInsoddisfatto != -1) {
                togliElementoMatrice(clientiSoddisfatti, indiceClienteInsoddisfatto);
                (*numeroClientiSoddisfatti)--;
            }
        }
    }
}

void modificaPreferenzeIngrediente(matrice *preferenze, int ingrediente) {
    int i,j;
    int numeroClienti, numeroIngredienti;

    numeroIngredienti = numeroColonneMatrice(*preferenze);

    if(ingrediente < 0 || ingrediente >= numeroIngredienti) {
        fprintf(stderr, "Errore indice ingrediente\n");
        exit(EXIT_FAILURE);
    }

    numeroClienti = numeroRigheMatrice(*preferenze);

    for(i=0; i<numeroClienti; i++) {
        /* se un cliente è già stato escluso da un ingrediente aggiunto non peserà sulla nuova scelta degli ingredienti */
        if(leggiValoreMatrice(*preferenze, i, ingrediente) == ESCLUSO) {
            for(j=0; j<numeroIngredienti; j++) {
                if(leggiValoreMatrice(*preferenze, i, j) == ESCLUSO)
                    inserimentoElementoMatrice(preferenze, i, j, NESSUNA_RELAZIONE);
            }
        }
        /* metto al massimo possibile il grado di esclusione dell'ingrediente scelto */
        inserimentoElementoMatrice(preferenze, i, ingrediente, ESCLUSO);
    }
}  

void creazionePizza(matrice preferenze, tabella ingredienti, tabella clienti, matrice *clientiSoddisfatti) {
    int i;
    int minClassificaIngredienti;
    int numeroClienti, numeroClientiSoddisfatti, numeroClientiSoddisfattiTemp;
    int numeroIngredienti, numeroIngredientiPizza;
    matrice classificaIngredientiPerEsclusioni;
    matrice ingredientiPizza;
    matrice clientiSoddisfattiTemp;

    numeroIngredienti = numeroColonneMatrice(preferenze);
    numeroIngredientiPizza = 0;

    numeroClienti = numeroRigheMatrice(preferenze);

    inizializzaClassificaIngrEsclusi(&classificaIngredientiPerEsclusioni, numeroIngredienti, preferenze);
    minClassificaIngredienti = indiceMinimoRispettoARigaMatrice(classificaIngredientiPerEsclusioni, 1, ingredienti);

    /* inizio ciclo pizza */

    numeroClientiSoddisfatti = numeroClienti;

    while(leggiValoreMatrice(classificaIngredientiPerEsclusioni, 1, minClassificaIngredienti) != numeroClienti) {
        /* tolgo gli insoddisfatti dall'ingrediente aggiunto */
        numeroClientiSoddisfattiTemp = numeroClientiSoddisfatti;
        inizializzaMatrice(&clientiSoddisfattiTemp, numeroRigheMatrice(*clientiSoddisfatti), numeroColonneMatrice(*clientiSoddisfatti));
        creaCopiaMatrice(&clientiSoddisfattiTemp, *clientiSoddisfatti);

        /*fprintf(stdout, "%d\n\n", minClassificaIngredienti);*/

        aggiornaListaClientiSoddisfatti(clientiSoddisfatti, &numeroClientiSoddisfatti, preferenze, leggiValoreMatrice(classificaIngredientiPerEsclusioni, 0, minClassificaIngredienti));
        if(numeroClientiSoddisfatti == 0) {
            /* l'aggiunto dell'ultimo ingrediente manda a zero i clienti */
            /* torno indietro con la lista dei clienti e con il numero */
            numeroClientiSoddisfatti = numeroClientiSoddisfattiTemp;
            modificaNumeroColonneMatrice(clientiSoddisfatti, numeroClientiSoddisfattiTemp);
            creaCopiaMatrice(clientiSoddisfatti, clientiSoddisfattiTemp);
            break;
        }

        if(numeroIngredientiPizza == 0) inizializzaMatrice(&ingredientiPizza, 1, numeroIngredienti);
        /* metto il l'ingrediente meno escluso */
        inserimentoElementoMatrice(&ingredientiPizza, 0, numeroIngredientiPizza, leggiValoreMatrice(classificaIngredientiPerEsclusioni, 0, minClassificaIngredienti));
        numeroIngredientiPizza++;

        /* modifico le preferenze per non far ricontare gli esclusi dall'ingrediente aggiunto */
        modificaPreferenzeIngrediente(&preferenze, leggiValoreMatrice(classificaIngredientiPerEsclusioni, 0, minClassificaIngredienti));

        /*stampaMatrice(preferenze);*/
        /* ricalcolo classifica ingredienti */
        inizializzaClassificaIngrEsclusi(&classificaIngredientiPerEsclusioni, numeroIngredienti, preferenze);

        /* trovo il minimo */
        minClassificaIngredienti = indiceMinimoRispettoARigaMatrice(classificaIngredientiPerEsclusioni, 1, ingredienti);

        cancellaMatrice(&clientiSoddisfattiTemp);
        /* fine ciclo pizza */
    }

    ordinaClassifica(&ingredientiPizza, numeroIngredientiPizza, ingredienti, 1);

    for(i=0; i<numeroIngredientiPizza; i++)
        fprintf(stdout, "%s ", leggiValoreTabella(ingredienti, leggiValoreMatrice(ingredientiPizza, 0, i)));

    fprintf(stdout, "\n");

    ordinaClassifica(clientiSoddisfatti, numeroClientiSoddisfatti, clienti, 1);

    for(i=0; i<numeroClientiSoddisfatti; i++)
        fprintf(stdout, "%s ", leggiValoreTabella(clienti, leggiValoreMatrice(*clientiSoddisfatti, 0, i)));

    fprintf(stdout, "\n");

    cancellaMatrice(&classificaIngredientiPerEsclusioni);
}

void calcoloStimaMenuPizza(matrice preferenze, tabella ingredienti, tabella clienti) {
    int i,j;
    matrice clientiSoddisfatti;
    int numeroClienti, numeroClientiSoddisfattiCiclo, numeroClientiSoddisfattiTotale;
    int numeroIngredienti;
    matrice preferenzeCopia;
    int numeroPizze;
    menu menuPizze;

    numeroClienti = numeroRigheMatrice(preferenze);
    numeroIngredienti = numeroColonneMatrice(preferenze);

    numeroClientiSoddisfattiTotale = 0;

    /* inizio ciclo menu */

    numeroPizze = 0;

    /* mi lascio lo spazio per inserire il numero di pizze */
    fprintf(stdout, "\n");

    inizializzaMatrice(&preferenzeCopia, numeroRigheMatrice(preferenze), numeroColonneMatrice(preferenze));
    
    while(numeroClientiSoddisfattiTotale != numeroClienti) {
        numeroClientiSoddisfattiCiclo = numeroClienti;

        inizializzaMatrice(&clientiSoddisfatti, 1, numeroClienti);
        for(i=0; i<numeroClienti; i++) {
            inserimentoElementoMatrice(&clientiSoddisfatti, 0, i, i);
        }

        creaCopiaMatrice(&preferenzeCopia, preferenze);

        creazionePizza(preferenzeCopia, ingredienti, clienti, &clientiSoddisfatti);
        numeroClientiSoddisfattiCiclo = numeroColonneMatrice(clientiSoddisfatti); 

        /* ricalcolo classifica ingredienti */
        for(i=0; i<numeroClientiSoddisfattiCiclo; i++) {
            numeroClientiSoddisfattiTotale++;
            for(j=0; j<numeroIngredienti; j++) {
                /* i clienti già soddisfatti escluderanno tutto così da non pesare più sulle prossime pizze */
                inserimentoElementoMatrice(&preferenze, leggiValoreMatrice(clientiSoddisfatti, 0, i), j, ESCLUSO);
            }
        }

        numeroPizze++;

        /* fprintf(stdout, "Numero clienti soddisfatti = %d \t Numero pizze fatte = %d\n", numeroClientiSoddisfattiTotale, numeroPizze); */
    }

    cancellaMatrice(&preferenzeCopia);

    /* fine ciclo menu */
}












