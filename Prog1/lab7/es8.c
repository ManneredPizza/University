#include <stdio.h>

int F(int n);
int M(int n);

int F(int n) {
    if(n==0) {
        return 1;
    }
    return (n-M(F(n-1)));
}

int M(int n) {
    if(n==0) {
        return 0;
    }
    return (n-F(M(n-1)));
}

int main() {
    int n;

    do{
        printf("Inserisci un numero intero non negativo: ");
        scanf("%u", &n);
    }
    while(n<0);

    printf("n \t F(n) \t M(n) \n");
    for(int i=0; i<=n; i++) {
        printf("%u \t %u \t %u \n", i, F(i), M(i));
    }
    return 0;
}
