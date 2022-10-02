//Nikita Polyanskiy entregable bucles 3
#include <iostream>
using namespace std;

int main(){
    int num, R,S=0;
    
    cout<<"Introduce un numero entero: ";
    cin>> num;
    
    do{
    R=num%10;
    S=S+R;
    num=num/10;
    }while(num>0);

    cout<<"La suma de todas sus cifras es: "<< S <<endl;

    return 0;
}
