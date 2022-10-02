#include <iostream>
#include<fstream>
using namespace std;



int main(){
int n=3;
string s1[n];
string aux;
int contador=0;

ifstream f1("fichero.txt");

if(f1.is_open()){
	while(f1.getline(aux)){
		s1[contador]=aux;
		contador++;
		if(contador==n)
		contador=0;
		
	}
	
	
	
}

f1.close();


return 0;
};
