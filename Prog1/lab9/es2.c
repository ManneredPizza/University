#include <stdio.h>
#include <math.h>

typedef struct {
    double x;
    double y;
} Vett;

Vett somma(Vett,Vett);
Vett invadd(Vett);
Vett sott(Vett,Vett);
Vett pscal(Vett, double);
double pint(Vett,Vett);

void inserimento(Vett *v) {
    printf("Inserisci la coordinata x: ");
    scanf("%lf", &(v->x));
    printf("Inserisci la coordinata y: ");
    scanf("%lf", &(v->y));

    return;
}

void stampa(Vett v) {
    printf("Risultato (%lf, %lf) \n", v.x, v.y);
    return;
}

int main() {
    Vett v1, v2;
    double r;
    int sc;

    inserimento(&v1);
    inserimento(&v2);
    printf("Inserire uno scalare: ");
    scanf("%lf", &r);

    do {
        printf("1. Somma \n");
        printf("2. Inverso additivo \n");
        printf("3. Sottrazione \n");
        printf("4. Prodotto per Scalare \n");
        printf("5. Prodotto interno standard \n");
        printf("6. Reinserire vettori e scalare \n");
        printf("7. Esci \n");
        printf("> ");
        scanf("%u", &sc);

        switch(sc) {
        case 1:
            stampa(somma(v1,v2));
            break;
        case 2:
            stampa(invadd(v1));
            break;
        case 3:
            stampa(sott(v1, v2));
            break;
        case 4:
            stampa(pscal(v1, r));
            break;
        case 5:
            printf("Risultato: %lf \n", pint(v1,v2));
            break;
        case 6:
            inserimento(&v1);
            inserimento(&v2);
            printf("Inserire uno scalare: ");
            scanf("%lf", &r);
            break;
        case 7:
            printf("Addio \n");
            break;
        default:
            printf("\n");
            break;
        }
    }
    while(sc!=7);

    return 0;
}

Vett somma(Vett v1,Vett v2) {
    Vett v;

    v.x = v1.x+v2.x;
    v.y = v1.y+v2.y;

    return v;
}

Vett invadd(Vett v) {
    Vett v_i;

    v_i.x=(-1)*v.x;
    v_i.y=(-1)*v.y;

    return v_i;
}

Vett sott(Vett v1,Vett v2) {
    Vett v;

    v.x = v1.x - v2.x;
    v.y = v1.y - v2.y;

    return v;
 }


Vett pscal(Vett v, double r) {
    Vett v_f;

    v_f.x = r*v.x;
    v_f.y = r*v.y;

    return v_f;
}

double pint(Vett v1,Vett v2) {
    return (v1.x*v2.x+v1.y*v2.y);
}
