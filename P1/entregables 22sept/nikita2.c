//Nikita Polyanskiy 2
#include <iostream>
using namespace std;

int main(){
    char caracter;
    
    cout << "Introduce + o - " << endl;
    cin >> caracter;
    
    if(caracter=='+'){
        cout << "POSITIVO" << endl;
    }
    else if(caracter=='-'){
        cout << "NEGATIVO" << endl;
    }
    else{
        cout << "INCORRECTO" << endl;
    }
    return 0;
}
