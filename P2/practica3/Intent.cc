#include "Intent.h"
#include <vector>
#include <string.h>
#include "Example.h"

using namespace std;

Intent::Intent(){
    Intent("");
}

Intent::Intent(string name){
    bool emptyText=true;
    
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
        //throw error(ERR_EMPTY)
    }
    
}

Intent::~Intent(){
    
}
ostream& operator<<(ostream &os, const Intent &intent){
    vector<Example> ejs;
   os << "Intent: " << intent.name << endl;
   os << "Response: " << intent.response << endl;
   for(unsigned i=0;i<intent.numExamples;i++){
       ejs=intent.Intent::getExamples();
       os << ejs[i];
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
    vector<Example> res;
    res.assign(begin(examples),end(examples));
    
    return res;
}

unsigned Intent::getNumExamples() const{
    return numExamples;
}

void Intent::addExample(const Example &example){
    if(numExamples==KMAXEXAMPLES){
        //throw error(ERR_MAXEXAMPLES)
    }else{
        examples[numExamples+1]=example;
        numExamples++;
    }
}

void Intent::deleteExample(int id){
    for(unsigned i=0;i<numExamples;i++){
        if(examples[i].getId()==id){
            examples[i].~Example();
        }
    }
}
void Intent::addResponse(string response){
        this->response=response;

}

float Intent::calculateSimilarity(string text,const char similarity[]) const{
    int sim=0;
    if(numExamples>0){
        if(strcmp(similarity,"jc")==0){
            for(unsigned i=0;i<numExamples;i++){
                sim=examples[i].jaccardSimilarity(text);
            }
        }else if(strcmp(similarity,"ng")==0){
            for(unsigned i=0;i<numExamples;i++){
                sim=examples[i].ngramSimilarity(text);
            }
        }else{
         //throw error(ERR_SIMILARITY)   
        }
    }
    
    return sim;
}   
