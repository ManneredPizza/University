#include <stdio.h>

int main(void) {
    int a, b, aux, i=0;

    printf("Inserisci due numeri positivi: ");
    scanf("%d%d", &a, &b);

    if(a <= 0 || b <= 0) {
        printf("Devono essere positivi");
        return -1;
    }

    int a_in = a, b_in = b;

    while(b != 0) {
        i += 1;
        aux = b;
        b = a%b;
        a = aux;
    }

    printf("L'm.c.d di %d e %d e': %d con %d iterazioni", a_in, b_in, a, i);
}
