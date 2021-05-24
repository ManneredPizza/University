#include <stdio.h>

int main(void) {
    int a = 100, b = 46, aux;

    int a_in = a, b_in = b;

    while(b != 0) {
        aux = b;
        b = a%b;
        a = aux;
    }

    printf("L'm.c.d di %d e %d e': %d", a_in, b_in, a);
}
