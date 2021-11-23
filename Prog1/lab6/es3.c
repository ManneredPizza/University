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

int equals(char *s, char *t) {
    int len_s = strlen(s)-1;
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

int palindroma(char *s) {
    int len = strlen(s)-1;

    for(int i=0; i<len; i++) {
        if(s[i]!=s[len-1-i]) {
            return 0;
        }
    }
    return 1;
}

int main() {
    char str[BUFSIZ], t[BUFSIZ];

    inserimento(str);
    reverse(str, t);
    printf("%u \n", equals(str, t));
    printf("%u \n", palindroma(str));

    return 0;
}


