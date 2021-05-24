#include <stdio.h>
#include <limits.h>

int main(void) {
    int num = INT_MAX;

    printf("Il limite superiore degli int e': %d \n", num);
    printf("Overflow baby: %d", num+1);

    return 0;
}
