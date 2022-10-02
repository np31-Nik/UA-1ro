//Nikita Polyanskiy problema 4 condicionales
#include <iostream>
#include <cmath>
using namespace std;

int main(){
    int canal_estoy, canal_ir,d;
    
    cout<<"En que canal estoy?: ";
    cin>> canal_estoy;
    
    cout<<"A que canal quiero ir?: ";
    cin>> canal_ir;
    
    d=abs(canal_estoy-canal_ir);
//d es la diferencia de canales       
    if(d<=49){
            
        if(canal_estoy<canal_ir)
            cout<<d<<" siguiente"<<endl;
            
        if(canal_estoy>canal_ir)
            cout<<d<<" anterior"<<endl;
    }

    if(d>49){

	if(canal_estoy<canal_ir)
	    cout<<99-d<<" anterior"<<endl;

	if(canal_estoy>canal_ir)
	    cout<<99-d<<" siguiente"<<endl;
	    
        }
   return 0;
}
