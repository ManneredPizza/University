#include <stdio.h>
#include <ctype.h>

int main(void) {
    char giorno_pari, domenica, meteo;

    do {
        printf("Oggi e' un giorno pari: ");
        giorno_pari = toupper(getchar());
        getchar();
    }
    while(giorno_pari != 'S' && giorno_pari != 'N');

    do {
        printf("Oggi e' domenica: ");
        domenica = toupper(getchar());
        getchar();
    }
    while(domenica != 'S' && domenica != 'N');

    if(domenica == 'S'){
        do {
            printf("Piove: ");
            meteo = toupper(getchar());
            getchar();
        }
        while(meteo != 'S' && meteo != 'N');
        if(meteo == 'S') {
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
