#include <stdio.h>
#include <ctype.h>

int main(void) {
    char c;

    printf("Inserisci un carattere: ");
    c = getchar();

    if(isalpha(c)) {
        if(isupper(c)) {
            printf("E' maiuscola");
        }
        else {
            printf("E' minuscola");
        }
    }

    return 0;
}
