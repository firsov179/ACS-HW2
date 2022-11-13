#include <stdio.h>

void input(char *s, int *n, char** argv) {
    FILE *stream = fopen(argv[1], "r");
    *n = 0;
    char inp;
    int i = 0;
    while ((inp = fgetc(stream)) != EOF) {
        s[i] = inp;
        i++;
    }
    *n = i;
    fclose(stream);
}

void print(const char *min, const char *max, char** argv) {
    FILE *stream = fopen(argv[2], "r");
    fprintf(stream, "The minimal sign is \"%c\".\n", *min);
    fprintf(stream, "The maximal sign is \"%c\".\n", *max);
}

void find(char *s, char *min, char *max, int n) {
    int x = 0;
    while (s[x] == '\n') {
        ++x;
    }
    *min = s[x];                                             // Делаем максимальным
    *max = s[x];                                             // Делаем минимальным
    for (int i = x + 1; i < n; ++i) {
        if (s[i] < *min && s[i] != '\n') {
            *min = s[i];                                     // Обновление минимума
        }
        if (s[i] > *max) {
            *max = s[i];                                     // Обновление минимума
        }
    }
}

int main(int argc, char** argv) {
    if (argc != 3) {
        printf("Something wrong!\n You should set names of two files.\n");
        return 0;
    }
    char min, max;
    int n;
    char s[10000];
    input((char *) &s, &n, argv);
    find((char *) &s, &min, &max, n);
    print(&min, &max, argv);
}