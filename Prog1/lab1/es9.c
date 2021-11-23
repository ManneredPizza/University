#include <stdio.h>

int main(void) {
    int num1;
    double num2;

    printf("Inserisci un int ed un double: ");
    scanf("%d%lf", &num1, &num2);

    printf("Hai inserito: %d e %f", num1, num2);

    return 0;
}
