/* Direttive */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ROW_LENGTH 256

/* Prototipi funzioni secondarie */
int abs(int a);
int differenzaInMin(int primaOra, int primoMin, int secondaOra, int secondoMin);

int main() {
	/* Parte dichiarative */
	int primaOra;
	int primoMin;
	int secondaOra;
	int secondoMin;
	int diffMinuti;

	scanf("%d:%d %d:%d", &primaOra, &primoMin, &secondaOra, &secondoMin);

	diffMinuti = differenzaInMin(primaOra, primoMin, secondaOra, secondoMin);
	printf("Orario1 %02d : %02d \t Orario2 %02d : %02d\n", primaOra, primoMin, secondaOra, secondoMin);
	printf("Differenza in minuti: %d\n", diffMinuti);

	return EXIT_SUCCESS;
}

int abs(int a) {
	if(a<0)
		return (-1)*a;
	return a;
}

int differenzaInMin(int primaOra, int primoMin, int secondaOra, int secondoMin) {
	int diffOre;
	int diffMinuti;

	diffOre = abs(primaOra - secondaOra);
	diffMinuti = abs(primoMin - secondoMin);

	return abs(diffOre*60 - diffMinuti);
}
