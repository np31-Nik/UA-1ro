#include <iostream>

using namespace std;

bool friends(unsigned x,unsigned y);


void printMainFriends(unsigned x, unsigned y)
{
	cout << "friends(" << x << "," << y << ")=" << friends(x,y) << endl;
}

void mainFriends()
{
	printMainFriends(2,2);
	printMainFriends(220,284);
	printMainFriends(20,54);
	printMainFriends(6,6);
}


int main()
{
	mainFriends();
}
