#include <stdio.h>
#include <string.h>
#include <ctype.h>

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
    int len = strlen(c);
    int len2 = strlen(s);

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


int main(int argc, char *argv[]) {
    char t[BUFSIZ];

    clean(argv[1], t, argv[2]);

    printf("%s \n", t);

    return 0;
}

