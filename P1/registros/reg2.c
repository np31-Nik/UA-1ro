#include <iostream>
#include <cstring>
#include <time.h>
#include <stdio.h>
using namespace std;

const int MAXP=15;

typedef char TCadena[15];

typedef struct{
 float precio;
 TCadena nombre;
    
}TProducto;

typedef TProducto TTienda[MAXP];

void alta(TTienda prod, int &tam){

    cout<<"Nombre de producto: ";
    cin>>prod[tam].nombre;
    cout<<"Precio del producto: ";
    cin>>prod[tam].precio;
    tam++;
    
}

void baja(TTienda prod, int &tam){
    TCadena elim;
    int p=-1,i=0;
    char s;
    cout<<"Producto a eliminar: ";
    cin>>elim;
    
    if(tam==0){
     cout<<"Error: No hay productos"<<endl;   
    }else if(tam==1){
     strcpy(prod[tam].nombre,"");
     prod[tam].precio=0;
     tam--;
    }else{
        do{
            if(strcmp(elim,prod[i].nombre)==0)
                p=i;
            else{
                i++;
                cout<<"i:"<<i<<endl;
            }
        }while(p==-1 && i<tam);
        do{
            cout<<"Estas seguro de querer eliminar el producto: "<<prod[p].nombre<<" precio: "<<prod[p].precio<<"? (s/n)";
            cin>>s;
            if(s=='s'){
                strcpy(prod[p].nombre,"");
                prod[p].precio=0;
                tam--; 
            }
        }while(s!='s' && s!='n');
    }
    
}

void modificar(TTienda prod, int &tam){
    TCadena mod;
    int p=-1,i=0;
    
    cout<<"Nombre del producto? ";
    cin>>mod;
    cout<<mod;
    do{
        if(strcmp(mod,prod[i].nombre)==0)
            p=i;
        else{
         i++;
         cout<<"i:"<<i<<endl;
        }
    }while(p==-1 && i<tam);
    
    if(p==-1)
        cout<<"Error: No se ha encontrado el producto"<<endl;
    else{
        cout<<"Precio actual: "<<prod[i].precio<<endl;
        cout<<"Introduce el nuevo precio: ";
        cin>>prod[i].precio;
    }
}


void listado(TTienda prod, int &tam){
    int preciototal=0;
    for(int i=0; i<tam;i++){
     cout<<"Producto "<<i<<endl;
     cout<<"Nombre: "<<prod[i].nombre<<endl;
     cout<<"Precio: "<<prod[i].precio<<endl;
     cout<<endl;
     preciototal+=prod[i].precio;
     }
     cout<<"Precio total de los productos: "<<preciototal<<endl;
    
    
}

void menu(int &op){
    cout<<"Menu:"<<endl;
    cout<<"1. Nuevo Producto"<<endl;
    cout<<"2. Eliminar Producto"<<endl;
    cout<<"3. Modificar producto"<<endl;
    cout<<"4. Listado"<<endl;
    cout<<"5. Salir"<<endl;
    cout<<"Elige una opcion: ";
    cin>>op;
    
}

int main(){
    int op,tam=0;
    TTienda prod;
    do{
        menu(op);
        switch(op){
            case(1):
                alta(prod,tam);
                break;
            case(2):
                baja(prod,tam);
                break;
            case(3):
                modificar(prod,tam);
                break;
            case(4):
                listado(prod,tam);
                break;
            default:
                break;
        }
    }while(op!=5);

return 0;
}