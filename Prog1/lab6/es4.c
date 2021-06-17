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

int lex(char *c, char *s) {
    int min_len = (strlen(c) < strlen(s)) ? strlen(c)-1 : strlen(s)-1;

    for(int i=0; i<min_len; i++) {
        if(tolower(c[i])>tolower(s[i])){
          return 0;
        }
        else if(tolower(c[i])<tolower(s[i])) {
          return 1;
        }
    }

    return 0; //sono uguali o c/s subset s/c
}

int main() {
    char str[BUFSIZ], t[BUFSIZ];

    inserimento(str);
    inserimento(t);
    printf("%u \n", lex(str, t));

    return 0;
}


