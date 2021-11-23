#include <stdio.h>

int main(void) {
    char str[BUFSIZ];

    printf("Inserisci una stringa: ");
    fgets(str, BUFSIZ, stdin);

    for(int i=0; i<strlen(str); i++) {
        str[i] = toupper(str[i]);
    }

    printf("%s", &str);

    return 0;
}
