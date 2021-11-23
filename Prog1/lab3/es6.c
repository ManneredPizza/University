#include <stdio.h>

int main(void) {
    int a, b, aux;

    printf("Inserisci due numeri positivi: ");
    scanf("%d%d", &a, &b);

    int a_in = a, b_in = b;

    while(b != 0) {
        aux = b;
        b = a%b;
        a = aux;
    }

    printf("L'm.c.d di %d e %d e': %d", a_in, b_in, a);
}

