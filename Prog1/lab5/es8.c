#include <stdio.h>

void somma(int n, double M_f[n][n], double M_1[n][n], double M_2[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_f[i][j] = M_1[i][j] + M_2[i][j];
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

    printf("Inserire un numero intero: ");
    scanf("%u", &n);

    double M_1[n][n], M_2[n][n];

    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("Inserire l'elemento di posizione (%u,%u): ", i+1,j+1);
            scanf("%lf", &M_1[i][j]);
        }
    }
    printf("\n");
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("Inserire l'elemento di posizione (%u,%u): ", i+1,j+1);
            scanf("%lf", &M_2[i][j]);
        }
    }
    stampa(n,M_1);
    stampa(n,M_2);

    double M_f[n][n];
    somma(n, M_f, M_1, M_2);

    stampa(n,M_f);

    return 0;
}
