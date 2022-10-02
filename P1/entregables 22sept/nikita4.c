//Nikita Polyanskiy 4
#include <iostream>
using namespace std;

int main(){
    float n;
    
    cout << "Inserta un numero mayor que 0 o menor que -20: ";
    cin >> n;
    
    if(n>0 || n<-20)
        cout << "El numero es adecuado" << endl;
    
    else
        cout << "INCORRECTO" << endl;
        
    return 0;
    
}
