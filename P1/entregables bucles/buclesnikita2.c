//Nikita Polyanskiy entregable bucles 2
#include <iostream>
using namespace std;
int main(){
    char c;
    
    do{
	cout<<"Introduce un caracter: ";
        cin>>c;
	
    }while(c!='a' && c!='e'&&c!='i'&&c!='o'&&c!='u');

     cout<<"Has introducido una vocal: "<< c <<endl;
        
    return 0;
}
