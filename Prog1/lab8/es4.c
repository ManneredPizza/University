#include <stdio.h>

int main() {
    char nome_file_1[BUFSIZ];
    char line[BUFSIZ];
    FILE *fp1;

    printf("Inserisci il nome di un file: ");
    scanf("%s", nome_file_1);
    fp1=fopen(nome_file_1, "w+");
    if(fp1 == NULL) {
        printf("Errore nell'apertura del file");
        return -1;
    }

    while(fgets(line, BUFSIZ, stdin) != NULL){
        fprintf(fp1, line);
    }

    fclose(fp1);
    return 0;
}
