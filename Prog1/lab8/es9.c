#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int len(char *str) {
    int i=0;
    while(str[i]!='\0') {
        i++;
    }

    return i;
}

int lex(char *c, char *s) {
    int min_len = (strlen(c) < strlen(s)) ? strlen(c) : strlen(s);

    for(int i=0; i<min_len; i++) {
        if(tolower(c[i])>tolower(s[i])){
          return 0;
        }
        else if(tolower(c[i])<tolower(s[i])) {
          return 1;
        }
    }

    return 1; //sono uguali o c/s subset s/c
}

void ordina(char **str, int lung) {
    //int *ordered = malloc(lung*sizeof(int));
    int fin=0;

    /*for(int i=0; i<lung; i++) {
        ordered[i] = i;
    }*/

    /*for(int i=0; i<lung-1; i++) {
        printf("%s \t %s \t %u \n", str[i], str[i+1], !lex(str[i], str[i+1]));
    }*/

    while(!fin) {
        fin = 1;
        for(int i=0; i<lung-1; i++) {
            if(!lex(str[i], str[i+1])) { //se torna 0 vanno swithciati
                char * temp = str[i];
                str[i] = str[i+1];
                str[i+1] = temp;
                fin = 0;
            }
        }
    }
}


int main() {
    char *str[5] = {"rfddd", "a", "snhtyrh", "gernguioergnrion", "lff"};
    /*for(int i=0; i<5; i++) {
        printf("Inserire la %u stringa: ", i+1);
        fgets(str[i], BUFSIZ, stdin);
    }*/

    ordina(str, 5);

    for(int i=0; i<5; i++) {
      printf("%s \n", str[i]);
    }

    return 0;
}

