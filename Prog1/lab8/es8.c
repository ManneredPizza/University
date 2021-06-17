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

int *ordina(char **str, int lung) {
    int j[lung][2];
    int *ordered = malloc(lung*sizeof(int));
    int fin=0;
    int temp;

    for(int i=0; i<lung; i++) {
        j[i][0] = i;
        j[i][1] = len(str[i]);
    }

    while(!fin) {
        fin = 1;
        for(int i=0; i<lung-1; i++) {
            if(j[i][1] > j[i+1][1]) {
                temp = j[i+1][1];
                j[i+1][1] = j[i][1];
                j[i][1] = temp;
                temp = j[i+1][0];
                j[i+1][0] = j[i][0];
                j[i][0] = temp;
                fin = 0;
            }
        }
    }

    for(int i=0; i<lung; i++) {
        ordered[i] = j[i][0];
    }

    return ordered;
}

/*void ascending_sort2(char *name,char **pnames, unsigned int size){
     //print out list of array
     unsigned int i,z;
     printf("------- 2 ---------\n");
     for (i = 0; i < size; i++)
     {
         printf("str: %s\n", pnames[i]);
     }
     //start bubble sorting...
     for( i = 0; i < (size - 1); i++)
     {
        for ( z = i; z < (size - 1); z++)
        {
           if ( strcmp(pnames[z],pnames[z+1]) > 0 )
           {
              // swap the pointers
              char * temp = pnames[z+1];
              pnames[z+1] = pnames[z];
              pnames[z] = temp;
           }
        }
     }

     printf("--- after bubble sort: --------\n");
     for (i = 0; i < size; i++)
     {
         printf("str: %s\n", pnames[i]);
     }
} si può anche lavorare sulla falsa riga di questo*/

int main() {
    char *str[5] = {"dfddd", "d", "tnhtyrh", "fernguioergnrion", "fff"};
    int *indice;
    /*for(int i=0; i<5; i++) {
        printf("Inserire la %u stringa: ", i+1);
        fgets(str[i], BUFSIZ, stdin);
    }*/

    indice = ordina(str, 5);

    for(int i=0; i<5; i++) {
      printf("%s \n", str[indice[i]]);
    }

    free(indice);

    return 0;
}
