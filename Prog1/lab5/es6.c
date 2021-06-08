#include <stdio.h>

int main() {
    int *pi;
    double *pd;
    char *pc;

    int ai[] = {0,1};
    double ad[] = {0.1, 0.2};
    char ac[] = "pippo";

    pi = &ai[0];
    pd = &ad[0];
    pc = &ac[0];


    printf("pi = %u \n", *(pi+1));
    printf("pd = %lf \n", *(pd+1));
    printf("pc = %c \n", *(pc+1));

    printf("pi = %p \n", (pi));
    printf("pd = %p \n", (pd));
    printf("pc = %p \n", (pc));

    printf("pi = %p \n", (pi+1));
    printf("pd = %p \n", (pd+1));
    printf("pc = %p \n", (pc+1));
    return 0;
}
