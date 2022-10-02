//Nikita Polyanskiy Problema 2 condicionales
#include <iostream>
using namespace std;

int main(){
    int horas, minutos, minutos_faltan;
    
    cout<<("Introduce las horas (0-23): ")<< endl;
    cin>> horas;
    
    cout<<("Introduce los minutos (0-59): ")<< endl;
    cin>> minutos;
    
    minutos_faltan=(60-minutos)+((23-horas)*60);
    
    cout<<"Faltan " << minutos_faltan << " minutos"<< endl;
    
    return 0;
}
    
    