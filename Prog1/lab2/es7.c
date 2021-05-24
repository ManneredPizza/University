#include <stdio.h>

int main(void) {
    double a, b, c;
    int sc;

    while(1) {
        printf("Inserisci due valori double: ");
        scanf("%lf%lf", &a, &b);
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
                continue;
            }
            c = a/b;
        }
        else {
            printf("Errato");
            continue;
        }

        printf("il risultato e': %f \n", c);
    }

    return 0;
}
