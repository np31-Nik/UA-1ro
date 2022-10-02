#include <iostream>
using namespace std;


void deleteChar(char str[],char c);

void printDeleteCharTest(char test[], char charToDelete)
{
  	cout << "deleteChar(\"" << test << "\"," << charToDelete << "), test=\"";
  	deleteChar(test, charToDelete);
  	cout << test << "\"" << endl;
}

void mainDeleteChar()
{
	char test1[] = "cadena de pruebaas";
	printDeleteCharTest(test1, 'a');

	char test2[] = "cadena de pruebaas";
	printDeleteCharTest(test2, 'e');

	char test3[] = "hola, mundo";
	printDeleteCharTest(test3, 'a');

	char test4[] = "hola, mundo";
	printDeleteCharTest(test4, 'o');
}


int main() {
    mainDeleteChar();
}
