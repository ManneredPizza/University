#include <stdio.h>
#include <string.h>

void reverse(char *s, char *r) {
    int max = strlen(s);
    for(int i=max-1; i>=0; i--) {
        *(r+(max-i-1)) = *(s+i);
    }
    r[max] = '\0';
    return;
}

int main(int argc, char *argv[]) {
    if(argv[1]) {
        char r[BUFSIZ];
        reverse(argv[1], r);

        printf("%s \n", argv[1]);
        printf("%s \n", r);

        return 0;
    }
    printf("Inserire un argomento");
    return -1;
}

