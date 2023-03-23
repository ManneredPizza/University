#include "listalibri.h"

void interpretaLineaComando (int argc, char *argv[], char *fileLibri, char *filePrestiti);

int main(int argc, char *argv[]) {
	char fileLibri[ROW_LENGTH];
	char filePrestiti[ROW_LENGTH];

	interpretaLineaComando(argc, argv, fileLibri, filePrestiti);

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
