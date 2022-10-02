//Nikita Polyanskiy entregable bucles 1
#include <iostream>
using namespace std;

int main(){
    float num=-1;
    int num_neg=0;
    for (int i=0; num<0;i++){
        cout<<"Inserta un numero real mayor o igual que cero: ";
        cin>> num;
        num_neg=i;
        
    }
    cout<<"Se han introducido "<<num_neg<<" numeros negativos"<<endl;
    return 0;
}