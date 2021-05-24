#include <stdio.h>
#include <string.h>
#include <limits.h>

int main(void) {
    char str[BUFSIZ];
    char sub_str[BUFSIZ];

    int index=INT_MAX;
    int fin=0;

    printf("Inserisci una stringa: ");
    fgets(str, BUFSIZ, stdin);

    printf("Inserisci una possibile sottostringa: ");
    fgets(sub_str, BUFSIZ, stdin);


    for(int i=0; i<strlen(str); i++){
        if(str[i]==sub_str[0]) {
            index = i;
            break;
        }
    }

    if(index != INT_MAX) {
        if(strlen(sub_str)-1!=1) {
            if((strlen(str)-1-(index+1)) - (strlen(sub_str)-1) >= 0) {
                for(int j=1; j<strlen(sub_str)-1; j++) {
                    fin=1;
                    if(str[index+j]!=sub_str[j]) {
                        fin=0;
                        break;
                    }
                }
            }
        }
    }

    if(fin==1) {
        printf("Si");
    }
    else {
        printf("No");
    }

    return 0;
}
