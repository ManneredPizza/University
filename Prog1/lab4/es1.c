#include <stdio.h>

int main(void) {
    char str[] = "Pippo";
    char c = 'Z';

    printf("%s%c", &str, c);


    return 0;
}
