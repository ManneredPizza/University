#include <stdio.h>

int main() {
    char nome_file_1[BUFSIZ];
    char nome_file_2[BUFSIZ];
    FILE *fp1, *fp2;
    char sh, ch;

    printf("Inserisci il nome di un file: ");
    scanf("%s", nome_file_1);
    fp1=fopen(nome_file_1, "r");
    if(fp1 == NULL) {
        printf("Errore nell'apertura del file");
        return -1;
    }

    printf("Inserisci il nome di un file: ");
    scanf("%s", nome_file_2);
    fp2=fopen(nome_file_2, "r");
    if(fp2 != NULL) {
        printf("Il file esiste gia', sicuri di procedere [Y][N]? \n");
        printf("> ");
        scanf("%c", &sh);
        if(sh!='Y') {
            return -1;
        }
    }
    fclose(fp2);

    fp2 = fopen(nome_file_2, "w+");

    while(!feof(fp1)) {
        ch = getc(fp1);
        fputc(ch, fp2);
    }

    fclose(fp1);
    fclose(fp2);
    return 0;
}
