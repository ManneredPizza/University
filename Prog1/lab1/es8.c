#include <stdio.h>
#include <float.h>

int main(void) {
    float num = FLT_MIN;
    printf("Limite inferiore float %g \n", num);
    printf("Underflow baby: %g", num/FLT_MAX);

    return 0;
}
