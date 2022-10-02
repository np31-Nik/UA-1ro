#include "Example.h"
#include <sstream>
#include <algorithm>

#include "Util.h"

using namespace std;

int Example::nextId=1;

Example::Example(){
    Example("");
}

Example::Example(string text){
    bool emptyText=true;
    bool emptyTokens=true;
    vector<string> tokenz;
    
    if(text.size()>0){
        for(unsigned i=0;i<text.size() && emptyText==true;i++){
            if(!isspace(text[i])){
                emptyText=false;                
            }
        }
        tokenz=Util::extractTokens(text);
        
        if(tokenz.size()>0){
            emptyTokens=false;
        }
    }
    
    if(!emptyText && !emptyTokens){
        this->text=text;
        this->tokens=tokenz;
        this->id=nextId;
        nextId++;
    }else{
        //throw error(ERR_EMPTY)
    }
    
}

Example::~Example(){
    
}

ostream& operator<<(ostream &os, const Example &example){
    vector<string> tokens=example.getTokens();
    os << "Example " << example.getId() << ": " << example.getText() <<endl;
    os << "Tokens " << example.getId() << ":";
    
    for(unsigned int i=0;i<tokens.size();i++){
        os << " <" << tokens[i] << ">";
    }
    
    return os;
}

void Example::resetNextId(){
    nextId=1;
}

int Example::getId() const{
    return id;
}

string Example::getText() const{
    return text;
}

vector<string> Example::getTokens() const{
    return tokens;
}

int Example::numTokens(vector<string> tokens) const{
    //funcion que calcula el numero de tokens en un vector
    sort(tokens.begin(),tokens.end());
    tokens.erase(unique(tokens.begin(),tokens.end()),tokens.end());
    
    return tokens.size();
    
}

int Example::tokensComun(vector<string> vecA,vector<string> vecB) const{
    //funcion que calcula el numero de tokens en comun
    vector<string> vecComun;
    
    sort(vecA.begin(),vecA.end());
    sort(vecB.begin(),vecB.end());
    set_intersection(vecA.begin(),vecA.end(),vecB.begin(),vecB.end(),back_inserter(vecComun));
   
    return vecComun.size();
    
}
float Example::jaccardSimilarity(string text) const{
    //funcion que calcula similitud jc del example y un string text
    vector<string> token_text=Util::extractTokens(text);
    int A=numTokens(token_text);
    int B=numTokens(this->tokens);
    int comun=tokensComun(this->tokens,token_text);
    float jc=0;
    
    jc=(float)comun/(float)(A+B-comun);
    
    return jc;
}

vector<string> Example::calcularTrigramas(vector<string> tok) const{
    //funcion que obtiene los trigramas sin repetir de un vector de tokens
    string tri;
    vector<string> trigramas;
    bool repetido=false;
    
    for(unsigned i=0;i<tok.size();i++){
        if(tok[i].size()>=3){
            for(unsigned j=0;j<tok[i].size();j++){
                tri.push_back(tok[i][j]);
                
                if(j>=2){
                    if(trigramas.size()==0){
                        trigramas.push_back(tri);
                        
                    }else{
                        
                        repetido=false;
                        for(unsigned k=0;k<trigramas.size() && repetido==false;k++){
                            if(trigramas[k]==tri){
                                repetido=true;   
                            }

                        }
                        if(repetido==false){
                            trigramas.push_back(tri);   
                        }
                    }

                    tri.erase(0,1);
                }
                
            }
            tri.clear();   
        }
           
    }
    return trigramas;
}

float Example::ngramSimilarity(string text) const{
    //funcion que calcula la similitud ng
    vector<string> tok=Util::extractTokens(text);
    vector<string> vecA=calcularTrigramas(tok);
    vector<string> vecB=calcularTrigramas(this->tokens);
    int comun=tokensComun(vecA,vecB);
    int A=vecA.size();    
    int B=vecB.size();
    float ng=0;
    
    ng=(float)comun/(float)(A+B-comun);
    
    return ng;
}
