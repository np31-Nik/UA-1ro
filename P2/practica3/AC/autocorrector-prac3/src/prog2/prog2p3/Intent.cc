#include "Intent.h"
#include <vector>
#include <string.h>
#include "Example.h"
#include "Util.h"

using namespace std;



Intent::Intent(string name){
    bool emptyText=true;
    try{
    if(name.size()>0){

        for(unsigned i=0;i<name.size() && emptyText==true;i++){
            if(!isspace(name[i])){
                emptyText=false;                
            }
        }
    }
    
    if(!emptyText){
        this->name=name;
    }else{
        throw ERR_EMPTY;
    }
    }catch(Error e){
        Util::error(e);
    }
    
}

Intent::~Intent(){
    
}
ostream& operator<<(ostream &os, const Intent &intent){
    vector<Example> ejs;
   os << "Intent: " << intent.name << endl;
   os << "Response: " << intent.response << endl;
   for(unsigned i=0;i<intent.examples.size();i++){
       ejs=intent.Intent::getExamples();
       os << ejs[i] << endl;
   }
    return os;
}

string Intent::getName() const{
    return this->name;
}

string Intent::getResponse() const{
    return this->response;
}

vector<Example> Intent::getExamples() const{
    return examples;
}

unsigned Intent::getNumExamples() const{
    return examples.size();
}

void Intent::addExample(const Example &example){
    if(examples.size()==KMAXEXAMPLES){
        throw ERR_MAXEXAMPLES;
    }else{
        examples.push_back(example);
    }
}

void Intent::deleteExample(int id){
    bool found=false;
    for(unsigned i=0;i<examples.size();i++){
        if(examples[i].getId()==id){
            examples.erase(examples.begin()+i);
            found=true;
        }
    }
    if(found==false){
        throw ERR_EXAMPLE;
    }
}
void Intent::addResponse(string response){
        this->response=response;

}

float Intent::calculateSimilarity(string text,const char similarity[]) const{
    float sim=0;
    float maxsim=0;
    try{
        if(strcmp(similarity,"jc")==0){
            for(unsigned i=0;i<examples.size();i++){
                sim=examples[i].jaccardSimilarity(text);
                if(sim>maxsim){
                    maxsim=sim;
                }
            }
        }else if(strcmp(similarity,"ng")==0){
            for(unsigned i=0;i<examples.size();i++){
                sim=examples[i].ngramSimilarity(text);
                  if(sim>maxsim){
                    maxsim=sim;
                }
            }
        }else{
            throw ERR_SIMILARITY;
        }
    
    }catch(Error e){
        Util::error(e);
    }
    
    return maxsim;
}   
