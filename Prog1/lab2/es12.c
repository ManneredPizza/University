#include <stdio.h>
#include <ctype.h>

int main(void) {
    char c;
    int i;

    printf("Inserisci un carattere: ");
    c = getchar();

    if(isalpha(c)) {
        printf("Vuoi renderlo minuscolo (1) o maiuscolo (2): ");
        scanf("%d", &i);
        if(i == 1) {
            printf("%c", tolower(c));
        }
        else if (i == 2) {
            printf("%c", toupper(c));
        }
    }
    else {
        printf("Non e' un carattere");
    }

    return 0;
}

