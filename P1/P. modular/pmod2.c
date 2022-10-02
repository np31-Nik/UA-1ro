#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;

int reparteCarta(){
    int carta=1+rand()%(13);
    
    return carta;
}

void calculaTotal(int &puntos_totales,int &carta_aleatoria){
    
    if(carta_aleatoria>9)
        carta_aleatoria=10;
    else if(carta_aleatoria==1)
        carta_aleatoria=11;
    
    
    
        puntos_totales+=carta_aleatoria;
    
}




int main()
{
srand(time(NULL));
int puntos_totales=0,carta_aleatoria,banca=1+rand()%21;
char otra_carta;

    do{
        carta_aleatoria=reparteCarta();
        calculaTotal(puntos_totales,carta_aleatoria);
    
        cout<<"Te ha salido un "<<carta_aleatoria<<endl;
        cout<<"Ahora tienes "<<puntos_totales<<" puntos"<<endl;
        if(puntos_totales<21){
            do{
                cout<<"Quieres otra carta? (s/n): ";
                cin>>otra_carta;
            }while(otra_carta!='s' && otra_carta!='n');
        }
        else
            cout<<"Te has pasado de 21"<<endl;
    }while(otra_carta=='s' && puntos_totales<21);

    cout<<"La banca tiene "<<banca<<endl;
    if(puntos_totales<=21){
    if(banca>puntos_totales)
        cout<<"Ha ganado la banca!"<<endl;
    else if(banca<puntos_totales)
        cout<<"Has ganado!"<<endl;
    else if(banca==puntos_totales)
        cout<<"Empate!"<<endl;
    }
    else{
        cout<<"Ha ganado la banca!"<<endl;
    }
    
return 0;
}