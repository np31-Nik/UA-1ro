#include <iostream>
#include <vector>

using namespace std;

int main(){


    bool emptyText=true;
    string name="hola";
    
    if(name.size()>0){
        for(unsigned i=0;i<name.size() && emptyText==true;i++){
            if(!isspace(name[i])){
                emptyText=false;                
            }
        }
    }
    
    if(!emptyText){
        cout<<"bien"<<endl;
    }else{
        cout<<"Vacia"<<endl;
    }
    
return 0;
}
