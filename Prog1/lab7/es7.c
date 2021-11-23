#include <stdio.h>

int fatt(int n) {
    if(n==0) {
        return 1;
    }
    return n*fatt(n-1);
}

int binom(int n, int k) {
    return (fatt(n)/(fatt(k)*fatt(n-k)));
}

int bell(int n) {
    if(n==0 || n==1) {
        return 1;
    }
    int somma = 0;
    for(int k=0; k<n; k++) {
        somma+=binom(n-1,k)*bell(k);
    }
    return somma;
}

int main() {
    int n;

    do{
        printf("Inserisci un numero intero non negativo: ");
        scanf("%u", &n);
    }
    while(n<0);

    printf("B(%u) = %u", n, bell(n));

    return 0;
}
