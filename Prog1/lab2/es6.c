#include <stdio.h>

int main(void) {
    double a, b, c;
    int sc;

    printf("Inserisci due valori double: ");
    scanf("%lf%lf", &a, &b);

    do {
        printf("Scegli tra somma (1), sottrazione (2), prodotto (3) o divisione (4): ");
        scanf("%d", &sc);

        if(sc == 1) {
            c = a + b;
        }
        else if(sc == 2) {
            c = a - b;
        }
        else if(sc == 3) {
            c = a*b;
        }
        else if(sc == 4) {
            if(b == 0) {
                printf("Non puoi dividere per 0, chi sei Riemann\? \n");
                return -1;
            }
            c = a/b;
        }
        else {
            printf("Errato");
            return -1; //io non lo farei terminare ma me lo chiedono
        }
    }
    while(sc != 1 && sc != 2 && sc != 3 && sc != 4);

    printf("il risultato e': %f", c);

    return 0;
}
