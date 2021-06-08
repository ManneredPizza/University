#include <stdio.h>

int lung(char *str) {
    if(str == NULL) {
        return -1;
    }
    if(*str=='\0') {
        return 0;
    }
    return 1+lung(++str);
}

int main() {
    char str[BUFSIZ];

    printf("Inserire una stringa: ");
    fgets(str, BUFSIZ, stdin);

    printf("%u \n", lung(str)-1);
    return 0;
}
