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

int equals(char *s, char *t) {
    int len_s = strlen(s);
    int len_t = strlen(t);

    if(len_s != len_t) {
        return 0;
    }
    else {
        for(int i=0; i<len_s; i++) {
            if(s[i]!=t[i]) {
                return 0;
            }
        }
    }

    return 1;
}

int main() {
    char str[BUFSIZ], t[BUFSIZ];

    inserimento(str);
    inserimento(t);
    printf("%u", equals(str, t));

    return 0;
}

