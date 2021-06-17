#include <stdio.h>
#include <string.h>
#include <ctype.h>

int indice(char *s) {
    char *giorni_it[] = {"lunedi", "martedi", "mercoledi", "giovedi", "venerdi", "sabato", "domenica"};

    int j=0;
    while(s[j]!='\0') {
        s[j] = tolower(s[j]);
        j++;
    }

    for(int i=0; i<7; i++) {
        if(!strcmp(giorni_it[i], s)){
            return i;
        }
    }
    return -1;
}

int main(int argc, char *argv[]) {
    char *giorni_ing[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

    if(argv[1]) {
        int i = indice(argv[1]);
        if(i==-1) {
            printf("Giorno inesistente");
            return -1;
        }
        printf("%s -> %s", argv[1], giorni_ing[i]);
        return 0;
    }
    else {
        printf("Inserisci una stringa!");
        return -1;
    }
}
