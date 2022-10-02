//Nikita Polyanskiy Problema 1 condicionales
#include <iostream>
using namespace std;

int main(){
    int A,B,aux;

    cout<< "Introduce presion sistolica (alta): ";
    cin>> A;

    cout<< "Introduce presion diastolica (baja): ";
    cin>> B;

    if (A<B){
        aux=A;
        A=B;
        B=aux;
    }
    
    if(A<90 && B<60)
        cout<<("Tienes Hipotension") << endl;
    
    else if(A<=140 && B<=90)
        cout<<("Tension Normal") << endl;
    
    else if(A>180 && B>110)
        cout<<("Tienes hipertension severa (al hospital)") << endl;
    
     else if(A>160 && B>100)
        cout<<("Tienes hipertension moderada") << endl;
    
    else if(A>140 && B>90)
        cout<<("Tienes hipertension ligera") << endl;

    else
        cout<<("Error de lectura") << endl;
    
    

    return 0;
}