#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(int argc, const char *argv[]) {
    int countdown = -1;
    static const char invalid[] = "Invalid countdown %s, try again...\n";
    if (argc > 1) {
        char* end;
        countdown = strtol(argv[1], &end, 10);
        if ((*end) || (countdown < 0)) {
            printf(invalid, argv[1]);
            countdown = -1;
        }
    }
    while (countdown < 0) {
        printf("countdown: ");
        char input[32];
        if (   (NULL == fgets(input, sizeof(input), stdin))
            || (   1 != sscanf(input, "%d", &countdown))
            || (countdown < 0))
        {
            int lastpos = strlen(input) - 1;
            if ((lastpos >= 0) && (input[lastpos] == '\n'))
                input[lastpos] = '\0';
            printf(invalid, input);
            countdown = -1;
        }
    }
    printf("World, Hello...");
    fflush(stdout);
    for (int i = countdown; i > 0; i--) {
        printf("%d...", i);
        fflush(stdout);
        nanosleep(&(struct timespec){.tv_sec=1}, NULL);
    }
    printf("Bye Bye.\n");
    return 0;
};
