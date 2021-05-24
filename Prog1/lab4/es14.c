#include <stdio.h>

int main(void) {
    char str[BUFSIZ];
    int n=0, s=0;

    do{
        printf("Inserire stringa: ");
        fgets(str, BUFSIZ, stdin);
        s+=strlen(str)-1;
        n++;
    }
    while((int)str[0] != 10);

    printf("Lunghezza media: %lf", (float)s/n);

    return 0;
}
