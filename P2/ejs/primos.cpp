// primos [-L] [-N #], #=numero entero
#include <iostream>
using namespace std;

int main (int argc, char *argv[]){
	if(argc>4){
		cout<<"Error"<<endl;
	}else{
		for(int i=0;i<argc;i++){
			if(argv[i]==(char *)'-L'){
				cout<<"menos L"<<endl;
			}else if(argv[i]==(char *)'-N'){
				cout<<"menos N"<<endl;
			}
		}
	}
	
	
	return 0;
}


