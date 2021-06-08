#include <stdio.h>

int main() {
    int *px = 0, *py = 1, *temp;

    printf("px = %u \n", px);
    printf("py = %u \n", py);

    temp = px;
    px = py;
    py = temp;

    printf("px = %u \n", px);
    printf("py = %u \n", py);
    return 0;
}
