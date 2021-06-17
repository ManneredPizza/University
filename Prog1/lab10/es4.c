#include <stdio.h>
#include <stdlib.h>

void add(double *d, int n) {
    d = realloc(d, n*sizeof(double));
    return;
}

void bubblesort(double *d, int lun) {
    double temp;
    int fin = 0;

    while(!fin) {
        fin = 1;
        for(int i=0; i<lun-1; i++) {
            if(d[i]>d[i+1]) {
                fin = 0;
                temp = d[i];
                d[i] = d[i+1];
                d[i+1] = temp;
            }
        }
    }

    return;
}

int main(int argc, char *argv[]) {
    if(argc < 3) {
        //return -1;
    }

    FILE *r, *w;
    double bug;
    double *d;
    char str[BUFSIZ];
    int n=1;
    d = (double *)malloc(50*sizeof(double));

    r=fopen("prova.txt", "r");
    fgets(str, BUFSIZ, r);
    d[0] = atof(str);
    bug = d[0];
    while(fgets(str, BUFSIZ, r)) {
        n++;
        add(d,n);
        d[n-1] = atof(str);
    }
    free(d);
    d[0] = bug; //bug che cancella il primo elemento

    bubblesort(d, n);

    fclose(r);

    for(int i=0; i<n; i++) {
        printf("%lf \n", d[i]);
    }

    w=fopen("final.txt", "w+");
    for(int i=0; i<n; i++) {
        fprintf(w, "%lf \n", d[i]);
    }

    fclose(w);

    return 0;
}
