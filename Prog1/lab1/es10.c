#include <stdio.h>

int main(void) {
    int a,b;

    printf("Inserisci due interi: ");
    scanf("%d%d", &a, &b);

    printf("La somma e': %d \n", a+b);
    printf("La sottrazione e': %d \n", a-b);
    printf("Il prodotto e': %d \n", a*b);
    printf("Il quoziente e': %d \n", a/b); //divisione intera
    printf("Il resto e': %d", a%b);

    return 0;
}
