#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double x;
    double y;
} Vett;

void inserimento(Vett *v) {
    printf("Inserisci la coordinata x: ");
    scanf("%lf", &(v->x));
    printf("Inserisci la coordinata y: ");
    scanf("%lf", &(v->y));

    return;
}

int linind(Vett *v1, Vett *v2) {
    double r;
    if(v2->x==0) {
        if(v1->x==0) {
            return 0;
        }
        else {
            return 1;
        }
    }
    if(v2->y==0) {
        if(v1->y==0) {
            return 0;
        }
        else {
            return 1;
        }
    }
    r = (v1->x)/(v2->x);
    if(r*(v2->y)==v1->y) {
        return 0;
    }
    return 1;
}

int main(int argc, char *argv[]) {
    Vett v1, v2;

    if(argc < 5) {
        return -1;
    }

    v1.x=atof(argv[1]);
    v1.y=atof(argv[2]);
    v2.x=atof(argv[3]);
    v2.y=atof(argv[4]);

    if(linind(&v1, &v2)) {
        printf("Linearmente indipendenti \n");
    }
    else {
        printf("Linearmente dipendenti \n");
    }

    return 0;
}
