//Nikita Polyanskiy problema bucles 3
#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;

int main(){
    bool oportunidad=true,continuar=true; 
    int n1,n2,resultado;
    float aciertos=0;
    char jugar='s';
    srand(time(NULL));
    
    do{
        aciertos=0;

        for(int i=0;i<5;i++){
            n1=rand()%10;
            n2=rand()%10;
            oportunidad=true;
            continuar=true;
        
            do{
                cout<<"Ej"<<i+1<<": "<<n1<<"*"<<n2<<"= ";
                cin>>resultado;
    
    
                if(resultado==n1*n2){
                    cout<<"Correcto!"<<endl;
                    if(oportunidad){
                        aciertos++;
                        continuar=false;
                    }
                    else{
                        aciertos+=0.5;
                        continuar=false;
                    }
 
                }
    
                else if(resultado>n1*n2){
                    cout<<"Incorrecto, la solucion es menor"<<endl;
                    if(oportunidad)
                        oportunidad=false;
                    else if(!oportunidad)
                        continuar=false;
                }
    
                else if(resultado<n1*n2){
                    cout<<"Incorrecto, la solucion es mayor"<<endl;
                    if(oportunidad)
                        oportunidad=false;
                    else if(!oportunidad)
                        continuar=false;
                }
    
            }while(continuar==true);
    
        }
    
        cout<<"Aciertos: "<<aciertos<<endl;
        cout<<"Quieres volver a jugar? (s/n): ";
        cin>>jugar;
    
    }while(jugar=='s');
    

return 0;
}