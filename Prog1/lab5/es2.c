#include <stdio.h>

int main(void) {
    char sh;
    int valid = 0;
    double x,y;

    do {
        printf("0. Inserisci Operandi \n");
        printf("1. Addizione \n");
        printf("2. Sottrazione \n");
        printf("3. Moltiplicazione \n");
        printf("4. Divisione \n");
        printf("5. Esci \n");
        printf(">");
        fflush(stdin);
        sh = getchar();

        switch(sh) {
        case '0':
            printf("Inserisci due numeri: ");
            scanf("%lf", &x);
            scanf("%lf", &y);
            valid = 1;
            break;
        case '1':
            if(valid==0)
                break;
            printf("%lf \n", x+y);
            break;
        case '2':
            if(valid==0)
                break;
            printf("%lf \n", x-y);
            break;
        case '3':
            if(valid==0)
                break;
            printf("%lf \n", x*y);
            break;
        case '4':
            if(valid==0)
                break;
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
