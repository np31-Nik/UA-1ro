#include "Chatbot.h"
#include <string.h>
#include "Intent.h"
#include "Util.h"
#include <limits>
using namespace std;


Chatbot::Chatbot(){
    threshold=0.25;
    strcpy(similarity,"jc");
}

Chatbot::Chatbot(float threshold, const char similarity[]){
    if(threshold>=0 && threshold<=1){
        if((strcmp(similarity,"jc")!=0) && (strcmp(similarity,"jc")!=0)){
            //throw error(ERR_SIMILARITY)
        }else{
            this->threshold=threshold;
            strcpy(this->similarity,similarity);
        }
    }else{
        //throw error(ERR_THRESHOLD)
    }
}


Chatbot::~Chatbot(){
}

ostream& operator<<(ostream &os, const Chatbot &chatbot){
   int numExamplesTot=0;
   
    os << "Similarity: " << chatbot.getSimilarity() << endl;
    os << "Threshold: " << chatbot.getThreshold() << endl;
    for(unsigned i=0;i<chatbot.intents.size();i++){
        os << chatbot.intents[i];
        numExamplesTot+=chatbot.intents[i]->Intent::getNumExamples();
    }
    os << endl;
    os << "Total intents: " << chatbot.intents.size() << endl;
    os << "Total examples: " << numExamplesTot << endl;
    os << "Examples per intent: " << (float)chatbot.intents.size()/numExamplesTot;
    
    return os;
}


float Chatbot::getThreshold() const{
    return threshold;
}

string Chatbot::getSimilarity() const{
    string sim(similarity);
    
    return sim;
}

int Chatbot::searchIntent(string name) const{
    int pos=-1;
    bool found=false;
    for(unsigned i=0;i<intents.size() && found==false;i++){
        if(intents[i]->Intent::getName()==name){
            pos=i;
            found=true;
        }
    }
    return pos;
}

bool Chatbot::addIntent(Intent* pIntent){
    //todo
}

bool Chatbot::deleteIntent(string name,bool askConfirm){
    //todo
}

bool Chatbot::addExample(string name){
    bool found=false;
    string example_add;
    int pos=-1;
    
    if(name==""){
        cout<<"Intent name: ";
        getline(cin,name);
    }
    for(unsigned i=0;i<intents.size() && found==false;i++){
        if(name==intents[i]->getName()){
            found=true;
            pos=i;
        }
    }
    if(!found){
    //throw error(ERR_INTENT)        
    }else{
        found=false;
        do{
            cout<<"New example: ";
            getline(cin,example_add);
            
            if(example_add!="q"){
                intents[pos]->Intent::addExample(example_add);
                found=true;
            }
       
        }while(example_add!="q");
    }
    
    return found;
}

bool Chatbot::deleteExample(int id){
    bool deleted=false;
    vector<Example> ejs;
    
    if(id==0){
        cout<<"Example id: ";
        cin>>id;
        cin.get();
    }
    for(unsigned i=0;i<intents.size();i++){
        ejs=intents[i]->Intent::getExamples();
        for(unsigned j=0;j<intents[i]->Intent::getNumExamples();j++){
            if(ejs[i].getId()==id){
                intents[i]->Intent::deleteExample(id);
                deleted=true;
            }
        }
    }
    
    if(!deleted){
    //error ERR_EXAMPLE
    }
    return deleted;    
}

bool Chatbot::addResponse(string name, string response){
    bool found=false;
    
    if(name==""){
        cout <<"Intent name: ";
        getline(cin,name);
    }
    if(response==""){
        cout <<"New response: ";
        getline(cin,response);
    }
    for(unsigned i=0;i<intents.size() && found==false;i++){
        if(name==intents[i]->Intent::getName()){
            intents[i]->Intent::addResponse(response);
            found=true;
        }
    }
    if(!found){
        //error(ERR_INTENT)
    }
    return found;
}

string Chatbot::bestResponse(string query, bool debug) const{
    string res;
    vector<Example> ejs;
    float umbral;
    bool found=false;
    for(unsigned i=0;i<intents.size() && found==false;i++){
        ejs=intents[i]->getExamples();
        for(unsigned j=0;j<intents[i]->Intent::getNumExamples() && found==false;j++){
            if(strcmp(similarity,"jc")==0){
                umbral=ejs[j].jaccardSimilarity(query);
            }else if(strcmp(similarity,"ng")==0){
                umbral=ejs[j].ngramSimilarity(query);
                if(umbral>=threshold){
                    if(debug){
                        res='('+umbral+')';
                    }
                    res=res+intents[i]->Intent::getResponse();
                    found=true;
                }
            }
        }
    }
    return res;
}




void Chatbot::test(bool debug) const{
    string query;
    
    cout<<">>" << Util::welcome() << endl;
    
    do{
        cout<<"<<";
        getline(cin,query);
    
        if(query!="q"){
            cout<<">>" << bestResponse(query,debug) << endl;
        }
    }while(query!="q");
}

void Chatbot::configure(float threshold,const char similarity[]){
    char sim[3];
    strcpy(sim,similarity);
    if(threshold==-1){
        cout<<"Enter threshold: ";
        cin>>threshold; 
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        
        
    }
    
    if(threshold<0 || threshold>1){
            //error(ERR_THRESHOLD)
    }else{
        this->threshold=threshold;
    }
    
    if(strcmp(similarity,"")==0){
        cout << "Enter algorithm: ";
        cin.get(sim,3);
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        
        
    }
    
    if(strcmp(similarity,"jc")!=0 && strcmp(similarity,"ng")!=0){
            //error(ERR_SIMILARITY)
    }else{
        strcpy(this->similarity,sim);
    }
    
}


