#include <stdio.h>

int main(void) {
    double val[5];

    for(int i=0; i<5; i++) {
        printf("Inserire il %d valore: ", i+1);
        scanf("%lf", &val[i]);
    }

    double mu=0;

    for(int i=0; i<5; i++) {
        mu += val[i];
    }
    mu = mu / 5;

    printf("%lf", mu);

    return 0;
}
