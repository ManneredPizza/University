#include <stdio.h>

int main(void) {
    int n;

    do {
        printf("Inserisci un intero positivo: ");
        scanf("%d", &n);
    }
    while(n <= 0);

    printf("F(%d)=", n);

    int f_n_1 = 1;
    int f_n = 1;

    for(int i=3; i<n; i++) {
        int aux = f_n;
        f_n += f_n_1;
        f_n_1 = aux;
    }
    printf("%d\n", f_n);

    return 0;
}


