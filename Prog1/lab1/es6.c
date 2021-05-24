#include <stdio.h>
#include <float.h>

int main(void) {
    printf("Il range dei float e' da %f a %f \n", FLT_MIN, FLT_MAX);
    printf("Il range dei double e' da %f a %f \n", DBL_MIN, DBL_MAX);
    printf("Il range dei float (CON PIU' PRECISIONE) e' da %g a %g \n", FLT_MIN, FLT_MAX);
    printf("Il range dei double (CON PIU' PRECISIONE) e' da %g a %g \n", DBL_MIN, DBL_MAX);

    return 0;
}
