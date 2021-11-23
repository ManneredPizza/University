#include <stdio.h>

int main() {
    char row[BUFSIZ];
    char nome_file[BUFSIZ];
    FILE *fp;

    printf("Inserisci il nome di un file: ");
    scanf("%s", nome_file);

    fp=fopen(nome_file, "r");
    if(fp == NULL)
        return -1;

    while(!feof(fp)) {
        fgets(row, BUFSIZ, fp);
        printf("%s \n", row);
    }

    fclose(fp);
    return 0;
}
