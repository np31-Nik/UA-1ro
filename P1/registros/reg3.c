#include <iostream>
#include <cstring>
#include <time.h>
#include <stdio.h>
using namespace std;

typedef char TCadena[15];

typedef struct{
    int numero;
    TCadena nombre;
    char ingrediente1;
    char ingrediente2;
    char ingrediente3;
    int hora;
    int minutos;
}TPedido;

typedef TPedido PedidosMax[100];

void menu(int &op){
     cout<<"Menu:"<<endl;
    cout<<"1. Nuevo Pedido"<<endl;
    cout<<"2. Pedido enviado"<<endl;
    cout<<"3. Ingredientes"<<endl;
    cout<<"4. Salir"<<endl;
    cout<<"Elige una opcion: ";
    cin>>op;
    
    
}

void nuevoPedido(int &numpedido,PedidosMax pedido){
    char extra;
    cout<<"Nombre de la pizza: ";
    cin>>pedido[numpedido].nombre;
    do{
        cout<<"Quieres ingredientes extra? (s/n)";
        cin>>extra;
    }while(extra!='s' && extra!='n');
    
    if(extra=='s'){
        cout<<"Ingrediente extra 1? (max 3): ";
        cin>>pedido[numpedido].ingrediente1;
        cout<<"Ingrediente extra 2? (max 3): ";
        cin>>pedido[numpedido].ingrediente2;
        cout<<"Ingrediente extra 3? (max 3): ";
        cin>>pedido[numpedido].ingrediente3;
    }
    
    
    
}

int main(){
    int dia,mes;
    time_t t;
    struct tm *tlocal; 
    t=time(NULL);
    tlocal=localtime(&t);
    dia=tlocal->tm_mday;
    mes=tlocal->tm_mon+1; 

    
    int op numpedido=0;
    PedidosMax pedidos; 

    do{
        menu(op);
        switch(op){
            case(1):
                nuevoPedido(numpedido,pedidos);
                break;
            case(2):
                enviado();
                break;
            case(3):
                nIngredientes();
                break;
            default:
                break;         
            }
    }while(op!=4);

return 0;
}