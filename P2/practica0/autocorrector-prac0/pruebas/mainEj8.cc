#include <iostream>

using namespace std;

void printX(int n);

void printPrintX(int n)
{
	cout << "printX(" << n << ")" << endl;
	printX(n);
}

void mainPrintX()
{
	printPrintX(1);
	printPrintX(2);
	printPrintX(5);
}

int main()
{
	mainPrintX();
}
