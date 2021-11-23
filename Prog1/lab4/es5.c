#include <stdio.h>

int main(void) {
    char s[BUFSIZ];
    char c;

    printf("Inserire una stinga: ");
    fgets(s, BUFSIZ, stdin);

    printf("Inserire un carattere: ");
    c = getchar();

    int i=0;
    while(c!=s[i] && s[i]!='\0') {
        i++;
    }

    if(c==s[i]){
        printf("Si'");
    }
    else {
        printf("No");
    }

    return 0;
}
