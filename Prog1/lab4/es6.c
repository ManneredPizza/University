#include <stdio.h>

int main(void) {
    char nome[BUFSIZ];

    printf("Inserisci un nome: ");
    fgets(nome, BUFSIZ, stdin);

    if(toupper(nome[strlen(nome)-2]) == 'O' || toupper(nome[strlen(nome)-2]) == 'I') {
        printf("Uomo");
    }
    else if(toupper(nome[strlen(nome)-2]) == 'A' || toupper(nome[strlen(nome)-2]) == 'E') {
        printf("Donna");
    }
    else {
        printf("Non so");
    }


    return 0;
}
