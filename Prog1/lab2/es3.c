#include <stdio.h>

int main(void) {
    //unsigned int a,b; //questo evita errori di negativi implicitamente
    int a,b;

    printf("Inserisci due interi positivi: ");
    scanf("%d%d", &a, &b);

    if(a < 0 || b < 0) {
        return -1;
    } //controllo esplicito

    printf("Il m.c.d. di %d e %d e': ", a,b);

    while(a != b) {
        if(a > b) {
            a -= b;
        }
        else {
            b -= a;
        }
    }

    printf("%d\n", a);

    return 0;
}


