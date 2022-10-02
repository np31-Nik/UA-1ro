#include <iostream>
#include <cstring>
#include <time.h>
#include <stdio.h>
using namespace std;

const int MAX=50; //NUMERO MAXIMO DE GATOS QUE PUEDE TENER LA ABUELA TERESA

typedef char TCadena[10]; 

typedef struct{
	int dia;
	int mes;
	int anyo;
}TFecha;

typedef struct{
	TCadena nombre;
	TFecha fec;
}TMascota;

typedef TMascota TGatos[MAX];

void iniciaMininos(TGatos, int &);

int menu(){
 int opc;
 
 cout<<"1.Dar de alta un gato"<<endl;
 cout<<"2.Mostrar gatos para vacunar"<<endl;
 cout<<"3.Lista de gatos"<<endl;
 cout<<"4.Salir"<<endl;
 cin>>opc;
 return opc;
}
void nuevogato(TGatos mininos, int &tam){
 cout<<"introduce el nombre";
 cin>>mininos[tam].nombre;
 cout<<"introduce el dia de adopcion:";
 cin>>mininos[tam].fec.dia;
  cout<<"introduce el mes de adopcion:";
 cin>>mininos[tam].fec.mes;
  cout<<"introduce el año de adopcion:";
 cin>>mininos[tam].fec.anyo;
 tam++;
    
    
    
    
}

void vacuna(TGatos mininos, int &tam){
    
    
    
    
}
void listado(TGatos mininos, int &tam){
 for(int i=0;i<tam;i++){
  cout<<"nombre: "<<mininos[i].nombre<<endl;   
  cout<<"dia: "<<mininos[i].fec.dia<<endl;
  cout<<"mes: "<<mininos[i].fec.mes<<endl;
  cout<<"anyo: "<<mininos[i].fec.anyo<<endl;
    cout<<endl;
     }
    
    
    
}





int main(){
	TGatos mininos;
	int tam, opc;	
        bool salir=false;
	
	iniciaMininos(mininos, tam);	
        
        do{
        opc=menu();
        
        switch(opc){
            case 1:
                nuevogato(mininos,tam);
                break;
            case 2:
                vacuna(mininos,tam);
                break;
            case 3:
                listado(mininos,tam);
                break;
            case 4:
                salir=true;
                break;
            default:
                break;
            }
            
        }while(salir==false);
}


void iniciaMininos(TGatos mininos, int &tam){
	strcpy(mininos[0].nombre,"Manolo");
	mininos[0].fec.dia=1;
	mininos[0].fec.mes=1;
	mininos[0].fec.anyo=2015;
	
	strcpy(mininos[1].nombre,"Kira");
	mininos[1].fec.dia=22;
	mininos[1].fec.mes=12;
	mininos[1].fec.anyo=2018;
	
	strcpy(mininos[2].nombre,"Peluso");
	mininos[2].fec.dia=5;
	mininos[2].fec.mes=3;
	mininos[2].fec.anyo=2017;
	
	strcpy(mininos[3].nombre,"Bolita");
	mininos[3].fec.dia=5;
	mininos[3].fec.mes=3;
	mininos[3].fec.anyo=2017;
	tam=4;
}
