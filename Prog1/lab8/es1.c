#include <stdio.h>

int main() {
    FILE *fp;
    fp = fopen("es1.c", "r");

    char str[BUFSIZ];

    while(fgets(str, BUFSIZ, fp)) {
        printf("%s", str);
    }

    return 0;
}
