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

int main() {
    int n;
    double *d;

    printf("Quanti double vuoi inserire: "),
    scanf("%u", &n);

    d = (double *)malloc(n*sizeof(double));

    for(int i=0; i<n; i++) {
        printf("Inserisci il %u double: ", i+1);
        scanf("%lf", &d[i]);
    }

    bubblesort(d, n);

    for(int i=0; i<n; i++) {
        printf("%lf \n", d[i]);
    }

    free(d);
}
