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

    for(int i=0; i<=m; i++) {
        for(int j=0; j<=n; j++) {
            printf("D(%u,%u): %u \n", i, j, D(i,j)); //there is a more optim. way, not using recursive but saving in an array the numbers and using what i have already calculated to do the bigger ones
        }
    }
    return 0;
}
