#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

int main(void) {
    srand(time(NULL));
    int n, aux, j, f_fin_1, f_fin_2, a_in, b_in;

    printf("Inserisci un numero positivo: ");
    scanf("%d", &n);

    do {
        j=0;
        int a = abs(rand()), b = abs(rand());
        a_in = a;
        b_in = b;

        while(b != 0) {
            j += 1;
            aux = b;
            b = a%b;
            a = aux;
        }
    }
    while(j != n);

    int f_n_1 = 1;
    int f_n = 1;

    for(int i=3; i<n+1; i++) {
        int aux = f_n;
        f_n += f_n_1;
        f_n_1 = aux;
    }

    f_fin_1 = f_n;

    f_n_1 = 1;
    f_n = 1;

    for(int i=3; i<n+2; i++) {
        int aux = f_n;
        f_n += f_n_1;
        f_n_1 = aux;
    }

    f_fin_2 = f_n;

    printf("a: %d, b: %d, F_n+1: %d, F_n+2: %d", a_in, b_in, f_fin_1, f_fin_2);
}
