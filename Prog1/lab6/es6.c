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

void single_clean(char *s, char *t, char c) {
    int len = strlen(s)-1;

    int j=0;
    for(int i=0; i<len; i++) {
        if(s[i]!=c) {
            t[j]=s[i];
            j++;
        }
    }
    t[j] = '\0';
    return;
}

void clean(char *s, char *t, char *c) {
    int len = strlen(c)-1;
    int len2 = strlen(s)-1;

    for(int i=0; i<len; i++) {
        for(int j=0; j<len2; j++) {
            if(s[j]==c[i]) {
                s[j] = ' ';
            }
        }
    }

    single_clean(s, t, ' ');
    return;
}


int main() {
    char str[BUFSIZ], t[BUFSIZ], c[BUFSIZ];

    inserimento(str);
    printf("Inserisci il carattere da eliminare: \n");
    inserimento(c);
    printf("%s \n", str);
    clean(str, t, c);

    printf("%s \n", t);

    return 0;
}


