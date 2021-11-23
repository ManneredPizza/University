#include <stdio.h>

int main(void) {
    char str[BUFSIZ];

    printf("Inserire una frase di massimo %d caratteri: ", BUFSIZ);
    fgets(str, BUFSIZ, stdin);

    printf("%s", &str);

    return 0;
}
