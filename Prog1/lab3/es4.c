#include <stdio.h>
#include <math.h>

int main(void) {
    double a, b, c, delta, x1, x2;

    do {
        printf("inserisci i tre coefficienti a, b, c: ");
        scanf("%lf%lf%lf", &a, &b, &c);
    }
    while(a==0);

    delta = b*b - 4*a*c;

    if(delta > 0) {
        printf("Ci sono due soluzioni distinte: %g e %g", (-1*b-sqrt(delta))/(2*a), (-1*b+sqrt(delta))/(2*a));
    }
    else if(delta == 0) {
        printf("Ci sono due soluzioni coincidenti: %g", (-1*b)/(2*a));
    }
    else {
        printf("Non ci sono soluzioni reali");
    }

    return 0;
}
