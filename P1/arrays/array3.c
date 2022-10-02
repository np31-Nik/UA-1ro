#include <iostream>
#include <string.h>
#include <time.h>
#include <stdlib.h>

using namespace std;

const int MAX=10;

void mundo(int F, int C,int mapa[MAX][MAX]){
    int randomF,randomC;
    
    randomF=rand()%F;
    randomC=rand()%C;
    mapa[randomF][randomC]=4;

    mapa[0][0]=1;
    
	cout<<"0=vacio 1=Jugador, 2=Monstruo, 3=Tesoro, 4=Salida"<<endl;
    for(int i=0;i<F;i++){
        for(int j=0;j<C;j++){
            if(mapa[i][j]!=4 && mapa[i][j]!=1){
                if(rand()%100<=10){
                    mapa[i][j]=2;   
                }else if(rand()%100<=20){
                    mapa[i][j]=3;   
                }
                else
                    mapa[i][j]=0;
            }//if==0
            cout<<mapa[i][j]<<" ";
        }//for j
        cout<<endl;
    }//for i
    
    
    
}

void mover(int mapa[MAX][MAX], char dir,int &posJf, int &posJc,int F, int C, bool &vivo){
    int posif=posJf, posic=posJc;
 switch (dir){
     case 'N':
         if(posJf>0)
             posJf=posJf-1;
        else
             cout<<"Te has chocado con una pared, intenta otra vez"<<endl;
        break;
     case 'S':
         if(posJf<F-1)
             posJf=posJf+1;
         else
             cout<<"Te has chocado con una pared, intenta otra vez"<<endl;
         break;
     case 'E':
         if(posJc<C-1)
             posJc=posJc+1;
         else
            cout<<"Te has chocado con una pared, intenta otra vez"<<endl;
        break;
     case 'O':
         if(posJc>0)
             posJc=posJc-1;
          else
            cout<<"Te has chocado con una pared, intenta otra vez"<<endl;
          break;
     default:
         break;
 }
    if(mapa[posJf][posJc]==2){
     cout<<"has muerto"<<endl;   
     vivo=false;
    }else if(mapa[posJf][posJc]==3){
        cout<<"Has encontrado un tesoro!"<<endl;
        mapa[posif][posic]=0;
        mapa[posJf][posJc]=1;
    }else if(mapa[posJf][posJc]==4){
        cout<<"Has encontrado la salida"<<endl;
        mapa[posif][posic]=0;
        mapa[posJf][posJc]=1;
        vivo=false;
    }else{
        mapa[posif][posic]=0;
        mapa[posJf][posJc]=1;
    }
        

    
    
    
}


void introduceDir(char &dir){
 cout<<"Donde quieres moverte?(N,S,E,O): ";
    cin>>dir;   
    
    
}

void mostrar(int mapa[MAX][MAX], int F, int C){
    for(int i=0;i<F;i++){
        for(int j=0;j<C;j++){
            cout<<mapa[i][j]<<" ";
        }
    
        cout<<endl;
    }
    
}



int main(){
    int F,C, posJf=0,posJc=0;
    int mapa[MAX][MAX];
    char dir;
    bool vivo=true;
    srand(time(NULL));
    
    cout<<"Cuantas filas quieres?(max10): ";
    cin>>F;
    cout<<"Cuantas columnas quieres?(max10): ";
    cin>>C;
    mundo(F,C,mapa);

    do{
    introduceDir(dir);
    mover(mapa,dir,posJf,posJc,F,C,vivo);
    mostrar(mapa,F,C);
    }while(vivo==true);
    

return 0;
}
