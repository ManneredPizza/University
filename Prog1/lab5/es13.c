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

void ins(int n, double M_1[n][n], double M_2[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_1[i][j] = M_2[i][j];
        }
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
    int n,m;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);

    double M[n][n], M_t[n][n], M_f[n][n];

    inserimento(n, M);

    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++){
            if(i==j) {
                M_f[i][j] = 1;
            }
            else {
                M_f[i][j] = 0;
            }
        }
    }

    printf("Inserire un numero intero per l'esponente: ");
    scanf("%u", &m);

    for(int i=0; i<m; i++) {
        matrix_mul(n, M_t, M_f, M);
        ins(n, M_f, M_t);
    }

    stampa(n, M);
    stampa(n, M_f);

    return 0;
}
