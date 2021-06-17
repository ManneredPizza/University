#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct {
    double x;
    double y;
} Vett;

typedef struct {
    Vett v[3];
} Tri;

void inserimento(Vett *v) {
    printf("Inserisci la coordinata x: ");
    scanf("%lf", &(v->x));
    printf("Inserisci la coordinata y: ");
    scanf("%lf", &(v->y));

    return;
}

Vett sott(Vett v1,Vett v2) {
    Vett v;

    v.x = v1.x - v2.x;
    v.y = v1.y - v2.y;

    return v;
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

int degenere(Tri *t) {
    Vett v1 = sott(t->v[1], t->v[0]);
    Vett v2 = sott(t->v[2], t->v[0]);

    return linind(&v1, &v2);
}

double dist(Vett v1, Vett v2) {
    return sqrt((v1.x-v2.x)*(v1.x-v2.x)+(v1.y-v2.y)*(v1.y-v2.y));
}

double area(Tri *t) {
    if(!degenere(t)) {
        return 0;
    }
    double l[3],s=0;

    for(int i=0; i<3; i++) {
        l[i] = dist(t->v[i%3], t->v[(i+1)%3]);
        s+=l[i];
    }
    s = s/2;

    return sqrt(s*(s-l[0])*(s-l[1])*(s-l[2]));
}

double pint(Vett v1, Vett v2) {
    return (v1.x*v2.x+v1.y*v2.y);
}


void rot(Vett *v, double a) {
    Vett r1, r2;
    double x, y;
    r1.x = cos(a);
    r1.y = (-1)*sin(a);
    r2.x = sin(a);
    r2.y = cos(a);


    x = pint(r1, *v);
    y = pint(r2, *v);

    v->x = x;
    v->y = y;

    return;
}

void rot2(Tri *t, double a) {
    for(int i=0; i<3; i++) {
        rot(&(t->v[i]), a);
    }

    return;
}

int main() {
    Tri t;
    double a;

    for(int i=0; i<3; i++) {
        inserimento(&(t.v[i]));
    }
    printf("Inserisci un angolo: ");
    scanf("%lf", &a);

    printf("Area: %lf \n", area(&t));
    rot2(&t, a);
    printf("Area ruotata: %lf \n", area(&t));

    return 0;
}
