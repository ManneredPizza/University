#include "listalibri.h"

void interpretaLineaComando (int argc, char *argv[], char *fileLibri, char *filePrestiti);
void creaListaDaFile(char *fileLibri, lista *l);
void togliLista(char *autoreLibro, lista *l);
void aggiungiLista(char *autoreLibro, lista *prest, lista *l);
void movimenti(char *autoreLibro, lista *rest, lista *pres, lista *l);
void inserisciRestitutiti(lista *rest, lista *l);

int main(int argc, char *argv[]) {
	char fileLibri[ROW_LENGTH];
	char filePrestiti[ROW_LENGTH];

	lista autoreLibro = NULL;
	lista prestiti = NULL;
	lista restituzione = NULL;

	interpretaLineaComando(argc, argv, fileLibri, filePrestiti);

	creaListaDaFile(fileLibri, &autoreLibro);

	movimenti(filePrestiti, &restituzione, &prestiti, &autoreLibro);

	fprintf(stdout, "LIBRERIA DISPONIBILE\n");
	stampaLista(autoreLibro);

	fprintf(stdout, "LIBRERIA IN PRESTITO\n");
	stampaLista(prestiti);

	fprintf(stdout, "LIBRERIA IN RESTITUZIONE\n");
	stampaLista(restituzione);

	inserisciRestitutiti(&restituzione, &autoreLibro);

	fprintf(stdout, "LIBRERIA DISPONIBILE\n");
	stampaLista(autoreLibro);

	fprintf(stdout, "LIBRERIA IN PRESTITO\n");
	stampaLista(prestiti);

	fprintf(stdout, "LIBRERIA IN RESTITUZIONE\n");
	stampaLista(restituzione);

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
		/* toglie il terminatore */
		riga[strcspn(riga, "\n")] = 0;
		*l = inslista(*l, *l, riga);
	}
}

void togliLista(char *autoreLibro, lista *l) {
	posizione p;

	p = cercaLista(*l, autoreLibro);

	if(p == NULL) {
		fprintf(stdout, "Err con movimento di %s\n", autoreLibro);
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

void inserisciRestitutiti(lista *rest, lista *l) {
	posizione inRest;
	posizione p;
	char autoreLibro[ROW_LENGTH];

	if(listavuota(*rest)) {
		fprintf(stdout, "Lista restituzione vuota\n");
		exit(EXIT_FAILURE);
	}

	while(!listavuota(*rest)) {
		inRest = primolista(*rest);
		leggelista(*rest, inRest, autoreLibro);
		p = successivoRispettoInserimento(*l, autoreLibro);

		*l = inslista(*l, p, autoreLibro);
		*rest = canclista(*rest, &inRest);
	}
}
