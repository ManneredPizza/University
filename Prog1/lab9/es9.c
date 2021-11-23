#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct {
    double x;
    double y;
} Vett;

typedef struct{
    Vett v[3];
} Tri;

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

void ordina(int lung, double j[lung][2]) {
    int fin=0;
    int temp;

    while(!fin) {
        fin = 1;
        for(int i=0; i<lung-1; i++) {
            if(j[i][1] > j[i+1][1]) {
                temp = j[i+1][1];
                j[i+1][1] = j[i][1];
                j[i][1] = temp;
                temp = j[i+1][0];
                j[i+1][0] = j[i][0];
                j[i][0] = temp;
                fin = 0;
            }
        }
    }
}

int main(int argc, char *argv[])  {
    if(argc < 2) {
        //return -1;
    }

    FILE *fp;
    char *row_s, temp[BUFSIZ];
    int row;
    int degeneri = 0;
    double area_min = 999999999;
    double somma_area = 0;
    int numero_aree = 0;
    int indice;

    fp = fopen("prova.txt", "r");
    if(!fp) {
       return -1;
    }

    if(fgets(row_s, BUFSIZ, fp)) {
        row = atoi(row_s);
    }
    Tri t[3];

    int i=0, j=0, k=0, l=0;
    int primo = 0;

    while(fgets(row_s, BUFSIZ, fp)) {
        while(row_s[i]!='\0') {
            if(row_s[i]!=' ') {
                temp[j] = row_s[i];
                i++;
                j++;
            }
            if(!primo) {
                t[k].v[l].x = atof(temp);
                primo = 1;
            }
            else {
                t[k].v[l].y = atof(temp);
                primo = 0;
                l++;
            }

            j=0;
            i++;
            for(int ind=0; ind<BUFSIZ; ind++) {
                temp[ind] = ' ';
            }
        }
        l=0;
        k++;
    }

    fclose(fp);

    printf("Numero triangoli: %u \n", row);

    for(i=0; i<row; i++) {
        if(degenere(&t[i])) {
            degeneri++;
        }
    }

    double area_ord[row-degeneri][2];

    int u=0;
    for(i=0; i<row; i++) {
        if(degenere(&t[i])) {
            area_ord[u][0] = u;
            area_ord[u][1] = area(&t[i]);
            somma_area += area(&t[i]);
            numero_aree++;
            if(area(&t[i]) < area_min) {
                area_min = area(&t[i]);
                indice = i;
            }
            u++;
        }
    }

    ordina(row-degeneri, area_ord);

    printf("Numero triangoli degeneri: %u \n", degeneri);
    printf("Media aritmetica aree: %lf \n", somma_area/numero_aree);
    printf("Triangolo area minima (riga %u): (%lf, %lf), (%lf, %lf), (%lf, %lf) \n", indice+2, t[indice].v[0].x, t[indice].v[0].y, t[indice].v[1].x, t[indice].v[1].y, t[indice].v[2].x, t[indice].v[2].y);

    printf("Triangoli in ordine di area: \n");
    for(int sa=0; sa<row-degeneri; sa++) {
       printf("(%lf, %lf), (%lf, %lf), (%lf, %lf) di area: %lf \n", t[(int)area_ord[sa][0]].v[0].x, t[(int)area_ord[sa][0]].v[0].y, t[(int)area_ord[sa][0]].v[1].x, t[(int)area_ord[sa][0]].v[1].y, t[(int)area_ord[sa][0]].v[2].x, t[(int)area_ord[sa][0]].v[2].y, area_ord[sa][1]);
    }
    return 0;
}
