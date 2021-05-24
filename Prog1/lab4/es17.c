#include <stdio.h>

int main(void) {
    char str[BUFSIZ];
    char c;
    int f;

    printf("Inserisci una stringa: ");
    fgets(str, BUFSIZ, stdin);


    do {
        f = 0;
        printf("\n Inserisci un carattere: ");
        fflush(stdin);
        c = getchar();

        for(int i=0; i<strlen(str); i++) {
            if(c == str[i]) {
                f++;
            }
        }

        printf("Frequenza %c in %s e': %f", c, &str, (float)f/(strlen(str)-1));
    }
    while((int)c != 10);
}
