#include <stdio.h>

void scalare(int n, double lambda, double M[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M[i][j] = lambda*M[i][j];
        }
    }

    return;
}

void stampa(int n, double M[n][n]) {
    printf("\n");
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("%lf \t", M[i][j]);
        }
        printf("\n");
    }

    return;
}

int main() {
    int n;
    double lambda;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);

    double M[n][n];

    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("Inserire l'elemento di posizione (%u,%u): ", i+1,j+1);
            scanf("%lf", &M[i][j]);
        }
    }
    printf("\n");
    stampa(n,M);

    printf("Inserire uno scalare: ");
    scanf("%lf", &lambda);

    scalare(n, lambda, M);

    stampa(n, M);

    return 0;
}

