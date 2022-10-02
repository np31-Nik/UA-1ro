#include <iostream>
using namespace std;

void dibujar(char c1, char c2, int n,int &car_dib,int &esp_int){
    int espacio_interior=0, car_dibujados=0;
    
    if(c2=='R'){
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                cout<<c1; 
                car_dibujados++;
        
            }
            cout<<endl;
        }
    
    }
    else if(c2=='V'){
        
        for(int i=0;i<n;i++){
            
            if(i==0||i==n-1){               //para dibujar la primera y la ultima linea
                for(int k=0;k<n;k++){
                    cout<<c1;
                    car_dibujados++;
                }
                cout<<endl;
            }else{                          //para las demas lineas
                    cout<<c1;
                    car_dibujados++;
                
                    for(int j=0;j<n-2;j++){
                        cout<<" ";
                        espacio_interior++;
                    }
                    cout<<c1;
                    cout<<endl;
              } 
        }
    }else{
        cout<<"Error: Caracter incorrecto"<<endl;
    }
    car_dib=car_dibujados;
    esp_int=espacio_interior;
}

void leePar(char &c1,char &c2,int &n){
    
    cout<<"Introduce un caracter: ";
    cin>>c1;
    cout<<"Introduce otro caracter (R/V): ";
    cin>>c2;
        do{

            cout<<"Introduce un numero entero (entre 4 y 20): ";
            cin>>n;
            if(n<4 || n>20)
                cout<<"Error: Numero incorrecto"<<endl;   

        }while(n<4 || n>20);
    
    
    
}



main(){
    char c1,c2;
    int n,esp_int=0, car_dib=0;

    leePar(c1,c2,n);
    dibujar(c1,c2,n,car_dib,esp_int);

    
    cout<<"Espacio interior:"<<esp_int<<endl;
    cout<<"Caracteres dibujados: "<<car_dib<<endl;
    
return 0;
}