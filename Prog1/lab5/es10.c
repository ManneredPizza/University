#include <stdio.h>

void matrix_mul(int n, double M_f[n][n], double M_1[n][n], double M_2[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_f[i][j] = 0;
            for(int k=0; k<n; k++) {
                M_f[i][j] += M_1[i][k]*M_2[k][j];
            }
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

void inserimento(int n, double M[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("Inserire l'elemento di posizione (%u,%u): ", i+1,j+1);
            scanf("%lf", &M[i][j]);
        }
    }

    return;
}

int main() {
    int n;
    double lambda;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);

    double M_1[n][n], M_2[n][n], M_f[n][n];

    inserimento(n, M_1);
    inserimento(n, M_2);
    printf("\n");
    stampa(n,M_1);
    stampa(n,M_2);

    matrix_mul(n, M_f, M_1, M_2);

    stampa(n, M_f);

    return 0;
}


