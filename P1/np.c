//Nikita Polyanskiy P550048833 Programacion1 Examen de practicas 6/11/19
#include<iostream>
using namespace std;

int pedirNum(){		//pide un numero y lo verifica
	int num;
	
	do{
		cout<<"Introduce un numero del 100 al 999999: ";
		cin>>num;
	
		if(num<100 || num>999999)
			cout<<"ERROR: numero incorrecto"<<endl;

	}while(num<100 || num>999999);

	return num;
}	

void factorizacion(int num,int &num_factores,int &suma_factores){	
	int factor=2;

	if(num!=0){
		cout<<"Factorizacion de "<<num<<": ";

		while(num!=0 && num>=factor){

			if(num%factor==0){
				cout<<factor<<", ";
				num_factores++;
				suma_factores+=factor;
				num=num/factor;
			
			}else{
				factor++;
			}
		}
		

		cout<<"1"<<endl;	//todos los numeros tienen como factor a 1
		suma_factores++;
		num_factores++;
	}

}

int extraer(int &num){		//extrae los ultimos 2 digitos
	int resto;
	

	resto=num%100;
	num=num/100;
	
	return resto;


}


int main(){
	int num,suma_factores=0,num_factores=0;
	char continuar;

	do{
		suma_factores=0,num_factores=0;
		num=pedirNum();
	
		while(num!=0){
			factorizacion(extraer(num),num_factores,suma_factores);
		}
	
		cout<<"Suma de los factores: "<<suma_factores<<endl;
		cout<<"Numero total de factores: "<<num_factores<<endl;
		cout<<endl;

		do{
			cout<<"Desea solicitar otro numero? (s/n): ";
			cin>>continuar;
		}while(continuar!='s' && continuar!='n');

		cout<<endl;
	}while(continuar=='s');

	return 0;
}
