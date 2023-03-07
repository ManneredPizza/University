#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int i;
	if(argc == 1) {
		fprintf(stderr, "Non ci sono elementi da leggere\n");
		exit(EXIT_FAILURE);
	}

	for(i=1; i<argc; i++) {
		printf("Il parametro n. %-2d e' uguale a %s\n", i, argv[i]);
	}

	return EXIT_SUCCESS;
}
