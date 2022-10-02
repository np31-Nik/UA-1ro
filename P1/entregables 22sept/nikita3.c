//Nikita Polyanskiy 3
#include <iostream>
using namespace std;

int main(){
    int opcion;
    
    cout << "OPCIONES" << endl << "1. Reducido" << endl << "2. Mediano" << endl << "3. Grande" << endl << "Introduce la opcion elegida: ";
    
    cin >> opcion;
    
    cout << "Has seleccionado ";
    
    if(opcion==1)
    cout << "el tamaño Reducido" << endl;
    
    else if(opcion==2)
    cout << "el tamaño Mediano" << endl;
    
    else if(opcion==3)
    cout << "el tamaño Grande" << endl;
    
    else
    cout << "una opcion incorrecta" << endl;

    return 0;
    
}
