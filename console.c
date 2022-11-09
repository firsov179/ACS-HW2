#include <stdio.h>

void input(char *s, int *n) {
    *n = 0;
    char inp;
    scanf("%c", &inp);
    int i = 0;
    while (inp != '\n') {
        s[i] = inp;
        i++;
        scanf("%c", &inp);
    }
    *n = i;
}

void print(const char *min, const char *max) {
    printf("The minimal sign is \"%c\".\n", *min);
    printf("The maximal sign is \"%c\".\n", *max);
}

void find(char *s, char *min, char *max, int n) {
    *min = s[0];                                         // Делаем максимальным
    *max = s[0];                                          // Делаем минимальным
    for (int i = 1; i < n; ++i) {
        if (s[i] < *min) {
            *min = s[i];                                     // Обновление минимума
        }
        if (s[i] > *max) {
            *max = s[i];                                     // Обновление минимума
        }
    }
}

int main() {
    char min, max;
    int n;
    char s[10000];
    input((char *) &s, &n);
    find((char *) &s, &min, &max, n);
    print(&min, &max);
}