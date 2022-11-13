#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate(char *s, int *n) {
    srand(time(NULL));
    *n = rand() % 500;                                       // иначе почти всегда находятся все символы
    for (int i = 0; i < *n; ++i) {
        s[i] = (char) (33 + (rand() % 95));                  // хочется чтобы символ был читаемый)
    }
}

void print(const char *min, const char *max) {
    printf("The minimal sign is \"%c\".\n", *min);
    printf("The maximal sign is \"%c\".\n", *max);
}

void find(char *s, char *min, char *max, int n) {
    *min = s[0];                                             // Делаем максимальным
    *max = s[0];                                             // Делаем минимальным
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
    generate((char *) &s, &n);
    find((char *) &s, &min, &max, n);
    print(&min, &max);
}