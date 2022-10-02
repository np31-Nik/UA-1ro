#include <iostream>
using namespace std;


void patio(char sala[8][20]){
 
    cout<<"Patio de butacas"<<endl;
    cout<<" ";
    
    for(int i=19;i>=1;i=i-2){
       
            cout<<i<<" ";  

     
        
    }
    for(int i=2;i<=20;i=i+2){
        
            cout<<i<<" ";   
    }
    cout<<endl;
    
    for(int i=0;i<8;i++){
        cout<<i+1<<" ";
        for(int j=18;j>=0;j=j-2){
            if(sala[i][j]=='*')
                cout<<sala[i][j];
            /*else if(j<=9)
                cout<<sala[i][j]<<" ";
*/
            else
                cout<<"  ";
        
        }
        for(int j=1;j<=19;j=j+2){
             if(sala[i][j]=='*')
                cout<<sala[i][j];
           /*
            else if(j<=9)
                cout<<sala[i][j]<<" ";
        */
            else
                cout<<"  ";
            
        }
        cout<<endl;
        
    }
    cout<<endl;
    
}

void ini(char sala[8][20]){
 for(int i=0;i<8;i++){
  for(int j=0;j<20;j++){
      sala[i][j]=0;
  }
 }
    
    
}


int main(){
 char sala[8][20];
 int f,c;
 char continuar;
 ini(sala);
 patio(sala);
    
 do{
    cout<<"Que fila desea?";
    cin>>f;
    cout<<"Que columna desea?";
    cin>>c;
    
    if(sala[f][c]=='*'){
        cout<<"Error: Ya esta reservada"<<endl;
    }else{
        sala[f-1][c-1]='*';
        cout<<"Reserva realizada"<<endl;
    }
    patio(sala);
    
    do{
        cout<<"Quieres continuar?";
        cin>>continuar;
        
    }while(continuar!='n' && continuar!='s');
 }while(continuar=='s');
    return 0;
}