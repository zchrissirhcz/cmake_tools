#include <stdlib.h>
#include <stdio.h>

class Matrix
{
public:
    Matrix(int a_rows, int a_cols):
        rows(a_rows), cols(a_cols)
    {
        data = (float*)malloc(sizeof(float) * rows * cols);
    }
    ~Matrix()
    {
        free(data);
        data = nullptr;
    }

    int rows;
    int cols;
    float* data;
};

int main()
{
    {
        Matrix m1(3, 3);
        Matrix m2 = m1;
        printf("m2: rows = %d, cols=%d\n", m2.rows, m2.cols);
    }

    return 0;
}