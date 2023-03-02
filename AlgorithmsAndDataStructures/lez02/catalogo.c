/* Direttive */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

typedef int boolean;
#define TRUE 1
#define FALSE 0

/* Prototipi funzioni secondarie */
void InterpretaLineaComando(int argc, char *argv[], char *nomeFile);
void GestisceCatalogo(char *nomeFile);
boolean GestisceArticolo(FILE *fileCatalogo);


int main(int argc, char *argv[]) {
	/* parte dichiarativa */
	char nomeFile[ROW_LENGTH];

	/* percepisco il nome del file da aprire */
	InterpretaLineaComando(argc, argv, nomeFile);
	/* legge e stampa il catalogo normalizzato */
	GestisceCatalogo(nomeFile);

	return EXIT_SUCCESS;
}

void InterpretaLineaComando(int argc, char *argv[], char *nomeFile) {
	if(argc != 2) {
		fprintf(stderr, "Errore: fornire solo il nome del file da cui leggere\n");
		exit(EXIT_FAILURE);
	}

	strcpy(nomeFile, argv[1]);
}

int numeroMeseDaNome(char *mese) {
	int meseNumero;

	if(strcmp(mese, "gennaio") == 0)
		meseNumero = 1;
	else if(strcmp(mese, "febbraio") == 0)
		meseNumero = 2;
	else if(strcmp(mese, "marzo") == 0)
		meseNumero = 3;
	else if(strcmp(mese, "aprile") == 0)
		meseNumero = 4;
	else if(strcmp(mese, "maggio") == 0)
		meseNumero = 5;
	else if(strcmp(mese, "giugno") == 0)
		meseNumero = 6;
	else if(strcmp(mese, "luglio") == 0)
		meseNumero = 7;
	else if(strcmp(mese, "agosto") == 0)
		meseNumero = 8;
	else if(strcmp(mese, "settembre") == 0)
		meseNumero = 9;
	else if(strcmp(mese, "ottobre") == 0)
		meseNumero = 10;
	else if(strcmp(mese, "novembre") == 0)
		meseNumero = 11;
	else if(strcmp(mese, "dicembre") == 0)
		meseNumero = 12;
	else {
		fprintf(stderr, "Mese non esistente\n");
		exit(EXIT_FAILURE);
	}

	return meseNumero;
}	

boolean GestisceArticolo(FILE *fileCatalogo) {
	/* Parte dichiarativa */
	char rigaFile[ROW_LENGTH];
	char articolo[ROW_LENGTH];
	float prezzo;
	int giorno;
	char mese[ROW_LENGTH];
	int meseNumero;
	int anno;
	int numeroElementiLetti;

	if(fgets(rigaFile, ROW_LENGTH, fileCatalogo) == NULL) {
		fprintf(stderr, "Errore nella lettura da file\n");
		exit(EXIT_FAILURE);
	}

	numeroElementiLetti = sscanf(rigaFile, "%s %f %d %s %d", articolo, &prezzo, &giorno, mese, &anno);
	
	if(numeroElementiLetti == 1 && strcmp(articolo, "STOP") == 0)
		return FALSE;

	/* controlli errori nell'input */
	if(numeroElementiLetti != 5) {
		fprintf(stderr, "Errore nell'inserimento degli argomenti\n");
		exit(EXIT_FAILURE);
	}
	if(giorno < 1 || giorno > 31) {
		fprintf(stderr, "Il giorno non può essere minore di 1 e maggiore di 31\n");
		exit(EXIT_FAILURE);
	}

	/* riconduco il nome del mese al numero */
	meseNumero = numeroMeseDaNome(mese);

	/* stampo la riga nel formato richiesto */
	fprintf(stdout, "%-s%9.2f %02d/%02d/%04d\n", articolo, prezzo, giorno, meseNumero, anno);

	return TRUE;
}


void GestisceCatalogo(char *nomeFile) {
	boolean result;
	FILE *fileCatalogo;

	/* apertura file contenente il catalogo */
	fileCatalogo = fopen(nomeFile, "r");
	if(fileCatalogo == NULL) {
		fprintf(stderr, "Errore nell'apertura del file\n");
		exit(EXIT_FAILURE);
	}

	do {
		result = GestisceArticolo(fileCatalogo);
	}
	while(result == TRUE);

	fclose(fileCatalogo);
}
