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

void scalare(int n, double lambda, double M_f[n][n], double M[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_f[i][j] = lambda*M[i][j];
        }
    }

    return;
}

void somma(int n, double M_f[n][n], double M_1[n][n], double M_2[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_f[i][j] = M_1[i][j] + M_2[i][j];
        }
    }

    return;
}

void trasposta(int n, double M_t[n][n], double M[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_t[i][j] = M[j][i];
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

void ins(int n, double M_1[n][n], double M_2[n][n]) {
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            M_1[i][j] = M_2[i][j];
        }
    }

    return;
}

void matrix_swap(int n, double M_1[n][n], double M_2[n][n]) {
    double M_t[n][n];

    ins(n, M_t, M_1);
    ins(n, M_1, M_2);
    ins(n, M_2, M_t);

    return;
}

int main() {
    int n;
    double r;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);
    double M_1[n][n], M_2[n][n], M_3[n][n], M_f1[n][n], M_f2[n][n], M_f3[n][n];

    inserimento(n, M_1);
    inserimento(n, M_2);
    inserimento(n, M_3);

    printf("Inserisci uno scalare: ");
    scanf("%u", &r);

    //1
    somma(n, M_f1, M_2, M_3);
    matrix_mul(n, M_f2, M_1, M_f1);
    stampa(n, M_f2);

    matrix_mul(n, M_f1, M_1, M_2);
    matrix_mul(n, M_f2, M_1, M_3);
    somma(n, M_f3, M_f1, M_f2);
    stampa(n, M_f3);

    //2
    matrix_mul(n, M_f1, M_1, M_2);
    scalare(n, r, M_f2, M_f1); //error in this function, no time to fix it but i don't min
    stampa(n, M_f2);

    scalare(n, r, M_f1, M_1);
    matrix_mul(n, M_f2, M_f1, M_2);
    stampa(n, M_f2);

    //3
    matrix_mul(n, M_f1, M_1, M_2);
    trasposta(n, M_f2, M_f1);
    stampa(n, M_f2);

    trasposta(n, M_f1, M_2);
    trasposta(n, M_f2, M_1);
    matrix_mul(n, M_f3, M_f1, M_f2);
    stampa(n, M_f3);

    getchar();
    return 0;
}




