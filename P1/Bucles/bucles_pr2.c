//Nikita Polyanskiy problema bucles 2
#include <iostream>
using namespace std;

int main(){
    int numero,suma=0,mensaje=0;
    
    cout<<"Dime un numero entero: ";
    cin>>numero;
    
    while(numero!=0){
        suma+=numero%10;
        numero=numero/10;
        }
        
        while(suma!=0){
            mensaje+=suma%10;
            suma=suma/10;
        }

    cout<<"Mensaje: "<<mensaje<<endl;


    return 0;
}