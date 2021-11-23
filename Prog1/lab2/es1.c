#include <stdio.h>

int main(void) {
    int a = 214, b=128; //a,b > 0

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
