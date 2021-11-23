#include <stdio.h>


//C(n) = (2(2n-1)C(n-1))/(n+1)

int C(int n) {
    if(n==0) {
        return 1;
    }
    return ((2*(2*n-1)*C(n-1))/(n+1));
}


int main() {
    int n;

    do{
        printf("Inserisci un numero intero non negativo: ");
        scanf("%u", &n);
    }
    while(n<0);

    printf("%u \n", C(n));
    return 0;
}
