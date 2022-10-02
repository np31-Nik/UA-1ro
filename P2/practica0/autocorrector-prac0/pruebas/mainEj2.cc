#include <iostream>

using namespace std;

unsigned factorial(unsigned n);


void printFactorialTest(int n)
{
	cout << "factorial(" << n << ")=" << factorial(n) << endl;
}
void mainFactorial()
{
	printFactorialTest(1);
	printFactorialTest(2);
	printFactorialTest(3);
	printFactorialTest(5);
}

int main() {
    mainFactorial();
}
