//Nikita Polyanskiy 1
#include <iostream>
using namespace std;

int main (){
    int numero;

    cout<<"Inserta un numero entero: ";
    cin>> numero;

    if(numero%16==0)
        cout<<numero<<" es divisor de 16"<< endl;

    else
        cout<<numero<<" no es divisor de 16"<< endl;

    return 0;
}
