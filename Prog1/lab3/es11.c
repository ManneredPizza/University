#include <stdio.h>
#include <ctype.h>

int main(void) {
    char giorno_pari, domenica, meteo;

    printf("Oggi e' un giorno pari: ");
    giorno_pari = toupper(getchar());
    getchar();

    if(giorno_pari != 'S' && giorno_pari != 'N') {
        return -1;
    }
    printf("Oggi e' domenica: ");
    domenica = toupper(getchar());
    getchar();
    if(domenica != 'S' && domenica != 'N') {
        return -1;
    }
    else if(domenica == 'S'){
        printf("Piove: ");
        meteo = toupper(getchar());
        if(meteo != 'S' && meteo != 'N') {
            return -1;
        }
        else if(meteo == 'S') {
            printf("Il signor Pignolino oggi e' uscito per recarsi dalla signora Precisina. Ha portato con se' un ombrello. \n");
        }
        else {
            printf("Il signor Pignolino oggi e' uscito per recarsi dalla signora Precisina. Ha portato con se' un parasole \n");
        }
    }
    else {
        if(giorno_pari == 'S') {
            printf("Il signor Pignolino oggi e' uscito per recarsi ai giardini pubblici. Ha portato con se' un libro. \n");
        }
        else {
            printf("Il signor Pignolino oggi e' uscito per recarsi al Caffe'. Ha portato con se' il suo diario. \n");
        }
    }

    return 0;
}
