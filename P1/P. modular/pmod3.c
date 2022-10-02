#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;

char genOperador(){             			//genera un operador al azar
 	char operador;
 	int n_operador;
 
 	n_operador=1+rand()%(4);
 
 	switch(n_operador){
     		case 1:
         		operador='+';
         		break;
    		 case 2:
        		 operador='-';
         		break;
     		case 3:
        		 operador='*';
         		break;
     		case 4:
         		operador='/';
        		 break;
   	 }	
	return operador;
    
    
}

int numAleatorio(){
return (1+rand()%(9));

}

bool verifica(int a, int b,int res, char op){		//Verifica que el resultado introducido sea correcto
	bool correcto;

	switch(op){
     		case '+':
         		if(a+b==res)
				correcto=true;
			else
				correcto=false;
         		break;
    		 case '-':
        		 if(a-b==res)
				correcto=true;
			else
				correcto=false;
         		break;
       
     		case '*':
        		 if(a*b==res)
				correcto=true;
			else
				correcto=false;
         		break;
         		
     		case '/':
         		if(a/b==res)
				correcto=true;
			else
				correcto=false;
         		break;

   	 }

	return correcto;	

}










int main()
{
	srand(time(NULL));
	char operador;
	int a,b,res, fallos=0;
	a=numAleatorio();

	for(int i=0;i<7;i++){
		
		b=numAleatorio();
		operador=genOperador();


		cout<<a<<operador<<b<<"= ";
		cin>>res; 
	
		if(!verifica(a,b,res,operador)){
			cout<<"Incorrecto, vuelve a intentarlo"<<endl;
			i--;
			fallos++;
			a=numAleatorio();
		}
		else{
			cout<<"Correcto!"<<endl;
			a=res;
			
		}

	}
	cout<<"Fallos: "<<fallos<<endl;







return 0;
}
