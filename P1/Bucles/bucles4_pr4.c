//Nikita POlyanskiy problemas bucles 4
#include <iostream>
using namespace std;

int main(){
    bool salir=false;
    int opcion, size, espacios,puntos;

    do{
        cout<<endl;
        cout<<"Menu"<<endl;
        cout<<"1. Dibujar Triangulo"<<endl;
        cout<<"2. Dibujar rombo"<<endl;
        cout<<"3. Dibujar paralelepipedo"<<endl;
        cout<<"4. Salir"<<endl;
    
        cout<<"Elige una opcion: ";
        cin>>opcion;
    
    
        if(opcion<1 || opcion>4){
            cout<<"ERROR: Elige otra opcion: ";
        }
        else if(opcion==4){
        
            salir=true;
        }
        else{
    
            cout<<"Elige tamaño: ";
            cin>>size;
    
    
            switch(opcion){
                
                case 1:
                {
		    espacios=size-1;
		    puntos=1;
                    for(int i=0;i<size;i++){
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}
			for(int p=0;p<puntos;p++){
				cout<<'.';

			}
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}

			espacios--;
			puntos+=2;
			cout<<endl;
		
			}
                    
                    break;
                }
                    
                case 2:
                {
		    espacios=size;
		    puntos=size;
                    for(int i=0;i<size;i++){
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}
			for(int p=0;p<puntos;p++){
				cout<<'.';

			}
			

			espacios--;
			cout<<endl;
		
			}
                    
                    
                    break;
                }
                
                case 3:
                {
		    espacios=size-1;
		    puntos=1;
                    for(int i=0;i<size;i++){
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}
			for(int p=0;p<puntos;p++){
				cout<<'.';

			}
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}

			espacios--;
			puntos+=2;
			cout<<endl;
                    
                    }
		    espacios+=2;
		    puntos-=4;
    		    for(int i=0;i<size-1;i++){
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}
		        for(int p=0;p<puntos;p++){
				cout<<'.';
			}
			for(int e=0;e<espacios;e++){
				cout<<' ';
			}
			espacios++;
			puntos-=2;
                    	cout<<endl;
                	}
		break;
		}//case 3
                
               
               }//switch
           
        }//else
    
    }while(!salir);

return 0;
}
