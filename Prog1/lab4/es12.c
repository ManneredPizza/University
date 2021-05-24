#include <stdio.h>

int main(void) {
    int n = 5;

    int arr[n], temp, fin = 0, scambi = 0;

    for(int i=0; i<n; i++) {
        printf("Inserisci un valore: ");
        scanf("%d", &arr[i]);
    }

    while(!fin) {
        fin = 1;
        for(int i=0; i<n-1; i++) {
            if(arr[i] > arr[i+1]) {
                temp = arr[i+1];
                arr[i+1] = arr[i];
                arr[i] = temp;
                scambi++;
                fin = 0;
            }
        }
    }

    for(int i=0; i<n; i++) {
        printf("%d \t", arr[i]);
    }
    printf("\n numero scambi: %d, n^2/2: %f", scambi, (float)n*n/2);

    return 0;

}
