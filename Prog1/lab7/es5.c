#include <stdio.h>

int D(int m, int n) {
    if(m==0||n==0) {
        return 1;
    }
    return D(m-1,n)+D(m,n-1)+D(m-1,n-1);
}

int main() {
    int n,m;

    do{
        printf("Inserisci un numero intero non negativo: ");
        scanf("%u", &m);
        printf("Inserisci un numero intero non negativo: ");
        scanf("%u", &n);
    }
    while(n<0 || m<0);

    printf("%u \n", D(m,n));
    return 0;
}
