#include <stdio.h>

int main(void) {
    unsigned int a,b;
    int i=0;

    printf("Inserisci due interi positivi: ");
    scanf("%d%d", &a, &b);

    printf("Il m.c.d. di %d e %d e': ", a,b);

    while(a != b) {
       i += 1;
       if(a > b) {
            a -= b;
       }
       else {
            b -= a;
       }
    }

    printf("%d con un numero di iterazioni pari a: %d", a, i);

    return 0;
}
