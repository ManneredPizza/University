#include <stdio.h>

int main(void) {
    double a,b;

    printf("Inserisci due double: ");
    scanf("%lf%lf", &a, &b);

    printf("La somma e': %f \n", a+b);
    printf("La sottrazione e': %f \n", a-b);
    printf("Il prodotto e': %f \n", a*b);
    printf("Il quoziente e': %f \n", a/b);

    return 0;
}
