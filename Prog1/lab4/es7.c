#include <stdio.h>

int main(void) {
    char str[BUFSIZ];

    printf("Inserire una stinga: ");
    fgets(str, BUFSIZ, stdin);

    if((int)str[0] != 10) {
        while(1) {
            printf("%s", &str);
        }
    }

    printf("Numero caratteri: %d", strlen(str));

    return 0;
}
