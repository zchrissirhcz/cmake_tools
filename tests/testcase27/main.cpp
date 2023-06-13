
void func1()
{
    1; // C4555
}

void func2()
{
    int x;
    x; // C4555
}

void example1()
{
    func1();
    func2();
}

void example2()
{
    int i = 0, j = 0;
    i + j; // C4552
    // try the following line instead
    // (i + j);

    int k = 233;
}

int main()
{
    example1();
    example2();

    return 0;
}