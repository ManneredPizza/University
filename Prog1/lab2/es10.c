#include <stdio.h>
#include <ctype.h>

int main(void) {
    char c;

    while(c!="\n") {
        printf("Inserisci un carattere: ");
        c = getchar();

        if(isalpha(c)) {
            if(isupper(c)) {
                printf("E' maiuscola \n");
            }
            else {
                printf("E' minuscola \n");
            }
        }
    }

    return 0;
}

