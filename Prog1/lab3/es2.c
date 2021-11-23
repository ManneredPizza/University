#include <stdio.h>

int main(void) {
    int n, somma1 = 0, somma2;

    do {
        printf("Inserisci un numero non negativo: ");
        scanf("%d", &n);
    }
    while(n < 0);

    for(int i=1; i<n+1; i++) {
        somma1 += i*i;
    }
    somma2 = n*(n+1)*(2*n+1)/6;

    printf("La somma dei primi %d numeri e': %d o %d", n, somma1, somma2);

    return 0;
}
