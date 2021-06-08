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
    int n, sc;
    double r;
    int valid_m = 0, valid_r = 0;

    printf("Inserire un numero intero: ");
    scanf("%u", &n);
    double M_1[n][n], M_2[n][n], M_f[n][n];

    do {
        printf("1. Inserisci operando A \n");
        printf("2. Inserisci operando B \n");
        printf("3. Inserisci operando scalare r \n");
        printf("4. Visualizza A, B ed r \n");
        printf("5. Trasposta di A \n");
        printf("6. rA \n");
        printf("7. A+B \n");
        printf("8. AB \n");
        printf("9. Scambia A e B \n");
        printf("10. Esci \n");
        printf(">");
        scanf("%u", &sc);
        switch(sc) {
        case 1:
            inserimento(n,M_1);
            valid_m++;
            break;
        case 2:
            inserimento(n,M_2);
            valid_m++;
            break;
        case 3:
            printf("Inserisci uno scalare: ");
            scanf("%u", &r);
            valid_r = 1;
            break;
        case 4:
            if(valid_m<2)
                break;
            stampa(n, M_1);
            stampa(n, M_2);
            printf("Scalare: %u \n", r);
            break;
        case 5:
            if(valid_m<2)
                break;
            trasposta(n, M_f, M_1);
            stampa(n, M_f);
            break;
        case 6:
            if(valid_m<2 && valid_r==0)
                break;
            scalare(n,r,M_f,M_1);
            stampa(n, M_f);
            break;
        case 7:
            if(valid_m<2)
                break;
            somma(n, M_f, M_1, M_2);
            stampa(n, M_f);
            break;
        case 8:
            if(valid_m<2)
                break;
            matrix_mul(n, M_f, M_1, M_2);
            stampa(n, M_f);
            break;
        case 9:
            if(valid_m<2)
                break;
            matrix_swap(n, M_1, M_2);
            break;
        case 10:
            break;
        default:
            printf("Scegliere tra le opzioni disponibili \n");
            break;
        }
    }
    while(sc!=10);

    return 0;
}



