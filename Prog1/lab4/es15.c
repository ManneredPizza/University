#include <stdio.h>

int main(void) {
    char str[BUFSIZ];
    int m=0;

    do{
        printf("Inserire stringa: ");
        fgets(str, BUFSIZ, stdin);
        if(strlen(str)-1 > m) {
            m=strlen(str)-1;
        }
    }
    while((int)str[0] != 10);

    printf("Lunghezza max: %d", m);

    return 0;
}
