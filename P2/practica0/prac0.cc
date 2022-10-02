//Pasaporte P550048833 Nikita Polyanskiy
#include <iostream>
#include <string.h>
using namespace std;

void deleteChar(char str[],char c){
    int L=strlen(str);
    for(int i=0;i<L;i++){
        if(str[i]==c){
            for(int j=i;j<L;j++){
                str[j]=str[j+1];
                }
                i--;
        }
    }
    
}

unsigned factorial(unsigned n){
    unsigned res=1;
    if(n!=1){
        for(unsigned i=1;i<n;i++){
         res+=res*i;  
        }
    }
    return res;
}

bool checkPassword(const char passwd[]){
    bool check=true,lower=false,upper=false,digit=false;
    int L=strlen(passwd);
    int i=0;
    if(L==16){
        while(i<L && check==true){
            if(!isdigit(passwd[i]))
                check=false;
            i++;
        }
    }else if(L>=8 && L<=12){
        while(i<L && check==true){
            if(islower(passwd[i]))
                lower=true;
            if(isupper(passwd[i]))
                upper=true;
            if(isdigit(passwd[i]))
                digit=true;
            i++;
        }
        if(lower==false || upper==false || digit==false)
            check=false;
    }else{
        check=false;
    }
    
    return check;
    
}

int calculator(const int numbers[], unsigned size, const char operators[]){
    int res=numbers[0];
    unsigned i=0;
    bool correcto=true;
    
    while(i<size-1 && correcto==true){
        if(operators[i]=='+')
            res+=numbers[i+1];
        else if(operators[i]=='-')
            res-=numbers[i+1];
        else if(operators[i]=='*')
            res=res*numbers[i+1];
        else if(operators[i]=='/')
            res=res/numbers[i+1];
        else
            correcto=false;
        i++;
    }
    return res;
}


unsigned buildNumber(const unsigned numbers[],unsigned size){
    unsigned res=0;
    if(size!=0){
        if(size==1)
            res=numbers[0];
        else{
            for(unsigned i=0;i<size;i++){
                
                    res=res*10;
                    res+=numbers[i];
                
                
            }
        }
    }
    return res;
        
}

bool friends(unsigned x, unsigned y){
    unsigned sumax=0, sumay=0;
    bool amigos=false;
    
    for(unsigned i=1;i<x;i++){
        if(x%i==0)
            sumax+=i;
    }
    for(unsigned i=1;i<y;i++){
        if(y%i==0)
            sumay+=i;
    }
     if(sumay==x && sumax==y)
         amigos=true;
     return amigos;
    
    
}

const unsigned kMATSIZE=5;

int sumNeighbors(int m[][kMATSIZE],int row, int column){
    int suma=0;

    for(int i=row-1;i<=row+1;i++){
        for(int j=column-1;j<=column+1;j++){
            if(j>=0 && j<=(int)kMATSIZE-1 && i>=0 && i<=(int)kMATSIZE-1){
                if(i!=row || j!=column){
                    suma+=m[i][j];
                }
            }
        }
    }
  
    return suma;
    
    
    
    
}


void printX(int n){
    int i_space=n;
    int o_space=0;
    
    if(n%2==0){
        cout<<"ERROR"<<endl;
    }else{
        for(int i=0;i<n/2;i++){
            for(int o=0;o<o_space;o++){
                cout<<" ";
            }
            cout<<"X";
            for(int j=0;j<i_space-2;j++){
                cout<<" ";
            }
            cout<<"X";
            cout<<endl;
            i_space-=2;
            o_space++;
        }
        for(int o=0;o<o_space;o++){
            cout<<" ";
        }
        cout<<"X";
        cout<<endl;
        o_space--;
        i_space+=2;
        
        for(int i=0;i<n/2;i++){
            for(int o=0;o<o_space;o++){
                cout<<" ";
            }
            cout<<"X";
            for(int j=0;j<i_space-2;j++){
                cout<<" ";
            }
            cout<<"X";
            cout<<endl;
            o_space--;
            i_space+=2;
            
        }
    }
        
    
}












































































