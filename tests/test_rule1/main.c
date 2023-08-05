#include <stdio.h>

int main()
{
    printf("hello cmake\n");

    int* data = (int*)malloc(100 * sizeof(int)); // missing #include <stdlib.h>
    data[0] = 233;

    return 0;
}
