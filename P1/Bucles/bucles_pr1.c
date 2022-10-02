//Nikita Polyanskiy problema bucles 1
#include <iostream>
using namespace std;

int main(){
    int mollas=0, mejillones=0, mollas_totales=0;

    do{
        cout<<"Cuantas mollas hay?: ";
            cin>>mollas;

        if(mollas!=-1){
            mollas_totales+=mollas;
            mejillones++;
        }
    
    }while(mollas!=-1);

    cout<<"Mejillones: "<< mejillones<<endl;
    cout<<"Mollas totales: "<<mollas_totales<<endl;
    
    if(mejillones>mollas_totales)
        cout<<"TIMO"<<endl;
    
    else if(mejillones==mollas_totales)
        cout<<"JUSTO"<<endl;
    
    else if(mejillones<mollas_totales)
        cout<<"SUERTE"<<endl;




return 0;
}