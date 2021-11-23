#include <stdio.h>
#include <math.h>

int main(void) {
    int n=-1;

    while(n<0) {
        printf("Quanti valori: ");
        scanf("%d", &n);
    }

    double val[n];

    for(int i=0; i<n; i++) {
        printf("Inserire il %d valore: ", i+1);
        scanf("%lf", &val[i]);
    }

    double mu=0;

    for(int i=0; i<n; i++) {
        mu += val[i];
    }
    mu = mu / n;

    double var=0;

    for(int i=0; i<n; i++) {
        var += (val[i] - mu)*(val[i] - mu);
    }
    var = var / n;

    double sqm = sqrt(var);

    printf("mu = %lf \n var = %lf \n sqm = %lf", mu, var, sqm);

    return 0;
}
