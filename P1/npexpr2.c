//Nikita Polyanskiy P550048833 Examen Practica 2 18/12/19
#include <iostream>
#include <string.h>
using namespace std;

const int P_MAX=20; //Piezas maximas
const int MTR=8; //caracteres de matricula
const int MAX_REP=50; //Reparaciones maximas

typedef char Tcadena[MTR];
typedef int Tpiezas[P_MAX];

typedef struct{
    char matricula[MTR];
    char tipo;
    float factura;
    Tpiezas piezas;
}Treparacion;

typedef Treparacion Tcoches[MAX_REP];

void menu(int &opcion){
    cout<<endl;
    cout<<"Menu"<<endl;
    cout<<"1.Nueva reparacion"<<endl;
    cout<<"2.Reparacion finalizada"<<endl;
    cout<<"3.Listar reparaciones pendientes"<<endl;
    cout<<"4.Informe de piezas"<<endl;
    cout<<"5.Salir"<<endl;
    cout<<"Selecciona una opcion: ";
    cin>>opcion;
    cout<<endl;
}

void nueva(Tcoches reps, int &cantidad){
    char tipocorrecto;
    
    cout<<"Introduce la matricula: ";
    cin>>reps[cantidad].matricula;
    do{
        cout<<"Introduce el tipo de reparacion(R/I/A): ";
        cin>>reps[cantidad].tipo;
        
        if(reps[cantidad].tipo=='A'){
            cout<<"Has seleccionado el tipo de reparacion: Averia, es correcto?(s/n): ";
            cin>>tipocorrecto;
        }else if(reps[cantidad].tipo=='R'){
            cout<<"Has seleccionado el tipo de reparacion: Revision anual, es correcto?(s/n): ";
            cin>>tipocorrecto;
        }else if(reps[cantidad].tipo=='I'){
            cout<<"Has seleccionado el tipo de reparacion: Pre-ITV, es correcto?(s/n): ";
            cin>>tipocorrecto;
        }
        else{
            cout<<"Error: Tipo de reparacion incorrecto, vuelve a introducirlo"<<endl;
            tipocorrecto='n';
        }
    }while(tipocorrecto!='s');
    
    cantidad++;
}

void finalizada(Tcoches reps, int &cantidad){
    Tcadena buscar; //Para buscar la matricula
    int p=0; //piezas
    int i=0; 
    int piezaR;
    bool continuar=true; //Hasta que encuentre pieza -1
    bool encontrada=false; //Si no encuentra la matricula
    
    cout<<"Introduce la matricula: ";
    cin>>buscar;
    do{
        if(strcmp(buscar,reps[i].matricula)==0){
            if(reps[i].factura==0){
                    encontrada=true;
                    cout<<"Precio de la reparacion?: ";
                    cin>>reps[i].factura;
                    cout<<"Introduce las piezas utlizadas(-1 para terminar):"<<endl;;

                    do{
                        cin>>piezaR;
                        if(piezaR==-1)
                            continuar=false;
                        else
                            reps[i].piezas[p]=piezaR;
                        p++;
                    }while(p<20 && continuar);
                        
            }
            
        }
        i++;
    }while(encontrada==false && i<cantidad);
    
    if(encontrada==false)
        cout<<"Error: No se ha encontrado la matricula"<<endl;
}

void listado(Tcoches reps, int &cantidad){
    bool pendiente=false; //Variable para saber si no hay ninguna reparacion pendiente
    
    cout<<"Reparaciones pendientes: "<<endl;
    for(int i=0;i<cantidad;i++){
        if(reps[i].factura==0){
            pendiente=true;
            cout<<reps[i].matricula<<" - ";
                if(reps[i].tipo=='A'){
                        cout<<"Averia"<<endl;
                    }else if(reps[i].tipo=='R'){
                        cout<<"Reparacion anual"<<endl;
                    }else if(reps[i].tipo=='I'){
                        cout<<"Pre-ITV"<<endl;
                    }
                
        }
    }
    if(pendiente==false)
        cout<<"Advertencia: No hay ninguna reparacion pendiente"<<endl;
}

void informePiezas(Tcoches reps, int &cantidad){
    int buscarP;
    bool encontrada=false;
    cout<<"Numero de pieza: ";
    cin>>buscarP;
    
    for(int i=0;i<cantidad;i++){
        for(int j=0;j<P_MAX;j++){
            if(reps[i].piezas[j]==buscarP) {
                encontrada=true;
                cout<<reps[i].matricula<<" - ";
                if(reps[i].tipo=='A'){
                        cout<<"Averia";
                    }else if(reps[i].tipo=='R'){
                        cout<<"Reparacion anual";
                    }else if(reps[i].tipo=='I'){
                        cout<<"Pre-ITV";
                    }
                cout<<" - "<<reps[i].factura<<endl;
        
            }
        }
    }
    if(encontrada==false)
        cout<<"Error: No se ha utilizado la pieza "<<buscarP<<endl;
}


int main(){
    int opcion,cantidad=0;
    Tcoches reps;
    
    do{
        menu(opcion);
        
        switch(opcion){
            case 1:
                nueva(reps,cantidad);
                break;
            case 2:
                finalizada(reps,cantidad);
                break;
            case 3:
                listado(reps,cantidad);
                break;
            case 4:
                informePiezas(reps,cantidad);
            default:
                break;      
        }
    }while(opcion!=5);
    
    
    
    return 0;
}