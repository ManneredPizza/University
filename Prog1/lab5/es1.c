#include <stdio.h>

int main(void) {
    char sh;
    double x,y;

    do {
        printf("Inserisci due numeri: ");
        scanf("%lf", &x);
        scanf("%lf", &y);

        printf("1. Addizione \n");
        printf("2. Sottrazione \n");
        printf("3. Moltiplicazione \n");
        printf("4. Divisione \n");
        printf("5. Esci \n");
        printf(">");
        fflush(stdin);
        sh = getchar();

        switch(sh) {
        case '1':
            printf("%lf \n", x+y);
            break;
        case '2':
            printf("%lf \n", x-y);
            break;
        case '3':
            printf("%lf \n", x*y);
            break;
        case '4':
            if(y!=0) {
                printf("%lf \n", x/y);
            }
            else {
                printf("Non si puo' dividere per zero \n");
            }
            break;
        case '5':
            break;
        default:
            printf("Prendere una tra le opzioni \n");
            break;
        }
    }
    while(sh!='5');
}
