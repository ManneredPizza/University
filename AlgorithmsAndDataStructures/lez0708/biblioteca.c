#include "listalibri.h"

/*
	TODO:
	1. quando inserisce in prestiti non cancella dalla lista originale
	2. scrivere funzione che mi restitusce posizione dell'elemento della lista subito successivo a quello che devo inserire
	3. inserire tutti i restituiti nella lista originale nella posizione corretta

	4. rivedere tutto con i cursori

*/

void interpretaLineaComando (int argc, char *argv[], char *fileLibri, char *filePrestiti);
void creaListaDaFile(char *fileLibri, lista *l);
void togliLista(char *autoreLibro, lista *l);
void aggiungiLista(char *autoreLibro, lista *prest, lista *l);
void movimenti(char *autoreLibro, lista *rest, lista *pres, lista *l);

int main(int argc, char *argv[]) {
	char fileLibri[ROW_LENGTH];
	char filePrestiti[ROW_LENGTH];

	lista autoreLibro = NULL;
	lista prestiti = NULL;
	lista restituzione = NULL;

	interpretaLineaComando(argc, argv, fileLibri, filePrestiti);

	creaListaDaFile(fileLibri, &autoreLibro);

	/*stampaLista(autoreLibro);*/

	movimenti(filePrestiti, &restituzione, &prestiti, &autoreLibro);

	stampaLista(autoreLibro);

	stampaLista(prestiti);

	stampaLista(restituzione);


	/* Creo la lista */
		/* lista vuota */
		/* leggo dal fileLibri */
		/* creo un elemento della lista */
	/* Stampo la lista */

	/* Effettuare prove cancellando o simili e poi stampare */

	/* capire come gestire il filePrestiti */

	return EXIT_SUCCESS;
}

void interpretaLineaComando (int argc, char *argv[], char *fileLibri, char *filePrestiti) {
	if(argc != 3) {
		fprintf(stderr, "Dare il numero corretto di argomenti\n");
		exit(EXIT_FAILURE);
	}

	strcpy(fileLibri, argv[1]);
	strcpy(filePrestiti, argv[2]);
}

void creaListaDaFile(char *fileLibri, lista *l) {
	FILE *fpLista;
	char riga[ROW_LENGTH];

	fpLista = fopen(fileLibri, "r");
	if(fpLista == NULL) {
		fprintf(stderr, "Impossibile aprire il file\n");
		exit(EXIT_FAILURE);
	}

	*l = crealista();

	while(strcmp(fgets(riga, ROW_LENGTH, fpLista), "FINE\n") != 0) {
		*l = inslista(*l, *l, riga);
	}
}

void togliLista(char *autoreLibro, lista *l) {
	posizione p;

	p = cercaLista(*l, autoreLibro);

	if(p == NULL) {
		/*fprintf(stdout, "Libro %s non presente in lista\n", autoreLibro);*/
		/* dovrei lanciare un errore ma all'inizio del file mi viene restituito un libro 
		   essendo l'inizio io non ho una lista PRESTITI quindi avrei errore */
		/* exit(EXIT_FAILURE); */
	}
	else {
		*l = canclista(*l, &p);
	}
}

void aggiungiLista(char *autoreLibro, lista *aggiungere, lista *togliere) {
	/* inserire controllo che autoreLibro sia presente in togliere */

	*aggiungere = inslista(*aggiungere, *aggiungere, autoreLibro);

	if(!listavuota(*togliere)) {
		togliLista(autoreLibro, togliere);
	}
}

void movimenti(char *fileLibri, lista *rest, lista *pres, lista *l) {
	FILE *fpMovimenti;
	char azione[ROW_LENGTH];
	char riga[ROW_LENGTH];

	fpMovimenti = fopen(fileLibri, "r");
	if(fpMovimenti == NULL) {
		fprintf(stderr, "Impossibile aprire il file\n");
		exit(EXIT_FAILURE);
	}

	*rest = crealista();
	*pres = crealista();

	while(fscanf(fpMovimenti, "%s %[^\n]", azione, riga) == 2) {
		if(strcmp(azione, "RESTITUZIONE") == 0) {
			aggiungiLista(riga, rest, pres);
		}
		else if(strcmp(azione, "PRESTITO") == 0) {
			aggiungiLista(riga, pres, l);
		}
	}
}
