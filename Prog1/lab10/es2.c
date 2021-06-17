#include <stdio.h>
#include <stdlib.h>

void bubblesort(double *d, int lun) {
    double temp;
    int fin = 0;

    while(!fin) {
        fin = 1;
        for(int i=0; i<lun-1; i++) {
            if(d[i]>d[i+1]) {
                fin = 0;
                temp = d[i];
                d[i] = d[i+1];
                d[i+1] = temp;
            }
        }
    }

    return;
}

void stampa(double *d, int n) {
    for(int i=0; i<n; i++) {
        printf("%lf \n", d[i]);
    }

    return;
}

void inserimento(double *d, int n) {
    for(int i=0; i<n; i++) {
        printf("Inserisci il %u double: ", i+1);
        scanf("%lf", &d[i]);
    }

    return;
}

int main() {
    int n;
    int *d;
    int sc;
    int ready = 0;

    do {
        printf("1. Inserisci elenco di double \n");
        printf("2. Ordina elenco \n");
        printf("3. Visualizza elenco \n");
        printf("4. Termina \n");
        printf("> ");
        scanf("%u", &sc);

        switch(sc) {
        case 1:
            if(ready) {
                //free(d);
            }
            printf("Quanti numeri vuoi inserire: ");
            scanf("%u", &n);
            d = (int *)malloc(n*sizeof(int));
            inserimento(d, n);
            ready = 1;
            break;
        case 2:
            if(!ready) {
                printf("Inserisci prima dei numeri \n");
                break;
            }
            bubblesort(d, n);
            break;
        case 3:
            if(!ready) {
                printf("Inserisci prima dei numeri \n");
                break;
            }
            stampa(d, n);
            break;
        case 4:
            printf("Addio \n");
            break;
        default:
            printf("\n");
            break;
        }

    }
    while(sc!=4);
}

