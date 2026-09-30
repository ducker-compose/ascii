#include <stdio.h>

#define ROWS 32
#define COLUMNS 4

int main() {
    int row, column;
    for (row = 0; row < ROWS; ++row) {
        printf("<tr>");
        for (column = 0; column < COLUMNS; ++column) {
            int value = row + (column * ROWS);
            printf("<td><code>%1$d</code></td><td><code>%1$X</code></td><td>%1$c</td><td><kbd>&#%1$d;</kbd></td>", value);
        }
        printf("</tr>\n");
    }
    return 0;
}