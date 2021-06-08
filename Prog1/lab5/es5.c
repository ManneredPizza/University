#include <stdio.h>

void swap(char **s1, char **c1) {
    char *temp = *s1;
    *s1 = *c1;
    *c1 = temp;

    return;
}
int main() {
    char s[] = "Franco Battiato", c[] = "Galileo Galilei", *temp;

    printf("s = %s \n", s);
    printf("c = %s \n", c);

    swap(&s,&c);

    printf("s = %s \n", s);
    printf("c = %s \n", c);
    return 0;
}

