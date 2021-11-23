#include <stdio.h>

int main(void) {
    char str[BUFSIZ];

    printf("Inserire una frase di massimo %d caratteri: ", BUFSIZ);
    fgets(str, BUFSIZ, stdin);

    int l=0;
    while(str[l] != '\0') {
        l++;
    }

    printf("La lunghezza della tua stringa e': %d \n", strlen(str)-1); //meno uno per eliminare \0
    printf("La lunghezza della tua stringa e': %d", l-1);

    return 0;
}
