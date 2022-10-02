#include <iostream>
using namespace std;


void comprobarAmigo(int a, int b){
	int suma=0;	
		
	for(int i=1;i<a;i++){

		if(a%i==0)
			suma+=i;		

	}
	
	if(suma==b)
		cout<<a<<" y "<<b<<" son amigos"<<endl;
	else
		cout<<a<<" y "<<b<<" no son amigos"<<endl;


}

void introducirPar(int &a, int &b){

	do{
		cout<<"Introduce numero a (mayor que 0): ";
		cin>>a;
	}while(a<1);

	do{
		cout<<"Introduce numero b (mayor que 0): ";
		cin>>b;
	}while(b<1);
	
}


int main(){

	int pares,a,b;
	cout<<"Cuantos pares de numeros vamos a comprobar? ";
	cin>>pares;
	for(int i=0;i<pares;i++){
		introducirPar(a,b);
		comprobarAmigo(a,b);
	}	


return 0;

}
