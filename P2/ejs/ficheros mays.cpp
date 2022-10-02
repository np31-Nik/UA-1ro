#include <iostream>
#include <fstream>
using namespace std;


char convert(char c){
	char aux;
	if(c>=97 && c<=122){
		aux=c-32;
	}
	return aux;
}

void resc(ifstream f1, ofstream f2){
	char c;
	while (f1.get(c)){
		f2 << convert(c);
		
	}
}

int main(){
	ifstream fichero1;
	ofstream fichero2;

	char c;
	fichero1.open("fichero.txt");
	fichero2.open("fichero2.txt");
	
	if(fichero1.is_open()){
		if(fichero2.is_open()){
		
			while(fichero1.get(c)){
					resc(fichero1,fichero2);
				}
		}
	}
	
	fichero1.close();
	fichero2.close();
	
	return 0;
}


