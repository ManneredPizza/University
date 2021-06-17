#include <stdio.h>
#include <string.h>

void inserimento(char *str) {
    printf("Inserire una stringa: ");
    if(fgets(str, BUFSIZ, stdin)==NULL) {
        printf("errore inserimento \n");
    }

    //correzione sostituzione \n con \0
    /*int i=0;
    for(; str[i]!='\n';i++)
    str[i]='\0';*/

    return;
}

void reverse(char *s, char *r) {
    int max = strlen(s);
    for(int i=max-1; i>=0; i--) {
        *(r+(max-i-1)) = *(s+i);
    }
    for(int i=0; i<max-1; i++) {
        r[i] = r[i+1];
    }
    r[max-1] = '\0';
    return;
}

int main() {
    char str[BUFSIZ], r[BUFSIZ];

    inserimento(str);
    reverse(str, r);

    printf("%s \n", str);
    printf("%s \n", r);

    return 0;
}
