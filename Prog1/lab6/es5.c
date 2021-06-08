#include <stdio.h>
#include <string.h>
#include <ctype.h>

void inserimento(char *str) {
    printf("Inserire una stringa: ");
    if(fgets(str, BUFSIZ, stdin)==NULL) {
        printf("errore inserimento \n");
        return -1;
    }

    //correzione sostituzione \n con \0
    /*int i=0;
    for(; str[i]!='\n';i++)
    str[i]='\0';*/

    return;
}

void clean(char *s, char *t) {
    int len = strlen(s)-1;

    int j=0;
    for(int i=0; i<len; i++) {
        if(s[i]!=' ') {
            t[j]=s[i];
            j++;
        }
    }
    t[j] = '\0';
    return;
}

int main() {
    char str[BUFSIZ], t[BUFSIZ];

    inserimento(str);
    clean(str, t);

    printf("%s \n", str);
    printf("%s \n", t);

    return 0;
}


