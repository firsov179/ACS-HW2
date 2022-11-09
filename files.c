#include <stdio.h>

void input(char *s, int *n, char** argv) {
    FILE *stream = fopen(argv[1], "r");
    *n = 0;
    char inp;
    fscanf(stream, "%c", &inp);
    int i = 0;
    while (inp != '\n') {
        s[i] = inp;
        i++;
        fscanf(stream, "%c", &inp);
    }
    *n = i;
    fclose(stream);
}

void print(const char *min, const char *max, char** argv) {
    FILE *stream = fopen(argv[2], "r");
    char real_min, real_max;
    fscanf(stream, "%c\n", &real_min);
    fscanf(stream, "%c\n", &real_max);
    if (*min == real_min && *max == real_max) {
        printf("Correct!\n");
    } else {
        printf("Something wrong!\n");
        if (*min != real_min) {
            printf("Minimal sign is \"%c\", but your \"%c\".\n", real_min, *min);
        }
        if (*max != real_max) {
            printf("Maximal sign is \"%c\", but your \"%c\".\n", real_max, *max);
        }
    }
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

int main(int argc, char** argv) {
    if (argc != 3) {
        printf("Something wrong!\n You should set names of two files.");
        return 0;
    }
    char min, max;
    int n;
    char s[10000];
    input((char *) &s, &n, argv);
    find((char *) &s, &min, &max, n);
    print(&min, &max, argv);
}