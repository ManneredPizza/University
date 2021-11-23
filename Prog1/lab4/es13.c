#include <stdio.h>
#include <math.h>

void bubbleSort(double *arr, int n) {
    int fin = 0;
    double temp;

    while(!fin) {
        fin = 1;
        for(int i=0; i<n-1; i++) {
            if(arr[i] > arr[i+1]) {
                temp = arr[i+1];
                arr[i+1] = arr[i];
                arr[i] = temp;
                fin = 0;
            }
        }
    }

    return;
}

int main(void) {
    int n=-1;

    while(n<0) {
        printf("Quanti valori: ");
        scanf("%d", &n);
    }

    double val[n];

    for(int i=0; i<n; i++) {
        printf("Inserire il %d valore: ", i+1);
        scanf("%lf", &val[i]);
    }

    double mu=0;

    for(int i=0; i<n; i++) {
        mu += val[i];
    }
    mu = mu / n;

    double var=0;

    for(int i=0; i<n; i++) {
        var += (val[i] - mu)*(val[i] - mu);
    }
    var = var / n;

    double sqm = sqrt(var);

    bubbleSort(val, n);

    double med = 0;
    if(n%2 != 0) {
        med = val[(n+1)/2-1];
    }
    else {
        med = (val[n/2-1] + val[n/2])/2;
    }


    printf("mu = %lf \n var = %lf \n sqm = %lf \n med = %lf", mu, var, sqm, med);

    return 0;
}
