#include <stdio.h>

add(int a, int b)
{ //函数没有声明返回类型
    return a + b;
}

int test()
{
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;

    c = add(a, b);
    return 0;
}

int main()
{
    test();
    return 0;
}