#include <stdio.h>

int main(void) {
    char str[BUFSIZ];
    char c;
    int f = 0;

    printf("Inserisci una stringa: ");
    fgets(str, BUFSIZ, stdin);

    printf("Inserisci un carattere: ");
    scanf("%c", &c);

    for(int i=0; i<strlen(str); i++) {
        if(c == str[i]) {
            f++;
        }
    }

    printf("Frequenza %c in %s e': %f", c, &str, (float)f/(strlen(str)-1));
}
