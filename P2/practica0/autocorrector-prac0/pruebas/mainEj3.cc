#include <iostream>

using namespace std;

bool checkPassword(const char passwd[]);

void printCheckPasswordTest(const char password[])
{
	cout << "checkPassword("<< password << ")=" << checkPassword(password) << endl;
}

void mainCheckPassword()
{
	printCheckPasswordTest("holaMundo");
	printCheckPasswordTest("hlM7no");
	printCheckPasswordTest("hlM7no8kj43");
	printCheckPasswordTest("hlM7no8kj43aa");
	printCheckPasswordTest("hola, mundo");
	printCheckPasswordTest("0123456789012345");
	printCheckPasswordTest("01234567890123a5");
}

int main() {
    mainCheckPassword();
}
