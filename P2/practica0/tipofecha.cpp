#include <iostream>
#include <string.h>
using namespace std;

void fecha(int f){
	int dia=f%100;
	f=f/100;
	int mes=f%100;
	int anyo=f/100;
	char cMes[15];
	
	switch (mes){
		case 1:
			cMes="Enero";
			break;
		case 2:
			strcpy(cMes,"Febrero");
			break;
		case 3:
			strcpy(cMes,"Marzo");
			break;
		default:
			break;
	
	}
	
	cout<<"Hoy es "<<dia<<" de "<<cMes<<" del "<<anyo<<endl;
	
	
}


int main(){
	int f;
	cin>>f;
	fecha(f);
	
	return 0;
}
