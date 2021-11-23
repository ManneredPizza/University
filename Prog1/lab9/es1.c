#include <stdio.h>
#include <math.h>

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

double dist(Vett v1, Vett v2) {
    return sqrt((v1.x-v2.x)*(v1.x-v2.x)+(v1.y-v2.y)*(v1.y-v2.y));
}

int main() {
    Vett v1, v2;

    inserimento(&v1);
    inserimento(&v2);

    printf("La distanza tra (%lf, %lf) e (%lf, %lf) e': %lf", v1.x, v1.y, v2.x, v2.y, dist(v1,v2));

    return 0;
}
