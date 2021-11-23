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

    for(int i=0; i<=n; i++) {
        printf("C(%u): %u \n", i, C(i)); //there is a more optim. way, not using recursive but saving in an array the numbers and using what i have already calculated to do the bigger ones
    }
    return 0;
}

