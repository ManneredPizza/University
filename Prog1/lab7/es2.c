#include <stdio.h>

int occ(char *str, char c) {
    if(str==NULL) {
        return -1;
    }
    if(*str=='\0') {
        return 0;
    }
    if(*str==c) {
        return 1+occ(++str,c);
    }
    else {
        return 0+occ(++str,c);
    }
}

int main() {
    char str[BUFSIZ], c;

    printf("Inserire una stringa: ");
    fgets(str, BUFSIZ, stdin);
    printf("Inserire un carattere: ");
    scanf("%c", &c);

    printf("%u \n", occ(str, c));
    return 0;
}

