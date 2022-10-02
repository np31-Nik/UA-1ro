#include <iostream>

using namespace std;

int calculator(const int numbers[],unsigned size,const char operators[]);

#define funcPrintArray(array, size)\
	cout << "{";\
	for (int i=0; i < (int)size; i++)\
	{\
		if (i)\
			cout << ",";\
		cout << array[i];\
	}\
	cout << "}";


void printCalculatorTest(const int numbers[], int numbers_length, int size, const char operators[])
{
	cout << "calculator(";
	funcPrintArray(numbers, numbers_length);
	cout << "," << size << operators << ")=" << calculator(numbers, size, operators) << endl;
}

void mainCalculator()
{
	const int numbers1[]={10,15,4,-5};
	int numbers_length1 = 4;

	printCalculatorTest(numbers1, numbers_length1, 4, "+*/");
	printCalculatorTest(numbers1, numbers_length1, 2, "+*/");
	printCalculatorTest(numbers1, numbers_length1, 3, "+*/");
	printCalculatorTest(numbers1, numbers_length1, 4, "+:/");
	printCalculatorTest(numbers1, numbers_length1, 1, "+:/");
}

int main()
{
	mainCalculator();
}
