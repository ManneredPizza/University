#include <stdio.h>

void trasposta(int n, double M_t[n][n], double M[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_t[i][j] = M[j][i];
        }
    }

    return;
}

int main() {
    int n;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);

    double M[n][n];

    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("Inserire l'elemento di posizione (%u,%u): ", i+1,j+1);
            scanf("%lf", &M[i][j]);
        }
    }

    double M_t[n][n];
    trasposta(n, M_t, M);

    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("%lf \t", M[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            printf("%lf \t", M_t[i][j]);
        }
        printf("\n");
    }

    return 0;
}
