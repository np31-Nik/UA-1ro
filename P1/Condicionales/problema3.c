//Nikita Polyanskiy problema 3 condicionales
#include <iostream>
using namespace std;

int main(){
    int velocidad_max;
    float metros,segundos,segundos_min;
    
    cout<<"introduce la distancia (en metros): ";
    cin>> metros;
    
    cout<<"introduce la velocidad maxima (km/h): ";
    cin>> velocidad_max;
    
    cout<<"introduce los segundos que ha tardado el coche en recorrer el tramo: ";
    cin>> segundos;
    
    if(segundos>0){
        
        segundos_min=metros/(velocidad_max/3.6);
    
        cout<<"segundos_min: "<< segundos_min << endl;
    
    
        if(segundos>segundos_min)
            cout<<"OK"<<endl;
        else if (segundos<segundos_min)
            cout<<"Multa"<<endl;
    
        
    }
    else
        cout<<"ERROR"<<endl;
    
    return 0;
}