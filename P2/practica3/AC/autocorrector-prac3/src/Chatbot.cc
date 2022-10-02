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
    
    if(threshold<0 || threshold>1){
        throw ERR_THRESHOLD;
    }else{
        this->threshold=threshold;
    }
    
    if((strcmp(similarity,"jc")==0) || (strcmp(similarity,"ng")==0)){
        strcpy(this->similarity,similarity);
    }else{
        throw ERR_SIMILARITY;
    }
    
    
}


Chatbot::~Chatbot(){
}

ostream& operator<<(ostream &os, const Chatbot &chatbot){
   int numExamplesTot=0;
   Intent* inte;
   
    os << "Similarity: ";
    if(chatbot.getSimilarity()=="jc"){
        os << "Jaccard" << endl;
    }else if(chatbot.getSimilarity()=="ng"){
        os << "N-grams" << endl;
    }
    os << "Threshold: " << chatbot.getThreshold() << endl;
    for(unsigned i=0;i<chatbot.intents.size();i++){
        inte=chatbot.intents[i];
        os << *inte << endl;
        numExamplesTot+=chatbot.intents[i]->Intent::getNumExamples();
    }
    os << "Total intents: " << chatbot.intents.size() << endl;
    os << "Total examples: " << numExamplesTot << endl;
    os << "Examples per intent: ";
    if(numExamplesTot==0 || chatbot.intents.size()==0){
        os << 0;
    }else{
        os << (float)numExamplesTot/chatbot.intents.size();
    }
    
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
    for(unsigned i=0;!found && i<intents.size();i++){
        if((intents[i]->getName()) == name){
            pos=i;
            found=true;
        }
    }
    return pos;
}

bool Chatbot::addIntent(Intent* pIntent){
    bool add=true;
    int pos=-1;
    try{
    pos=searchIntent(pIntent->getName());
    
    if(pos==-1){
        intents.push_back(pIntent);
    }else{
        add=false;
        throw(ERR_INTENT);
    }
    }catch(Error e){
        Util::error(e);
    }
    
    return add;
}

bool Chatbot::deleteIntent(string name,bool askConfirm){
    bool del=true;
    int pos=-1;
    char c;
    try {
    if(name==""){
        cout<<"Intent name: ";
        getline(cin,name);
    }
    pos=searchIntent(name);
    
    if(pos==-1){
        throw(ERR_INTENT);
    }else{
        if(askConfirm){
            do{
            cout<<"Confirm [Y/N]?: ";
            cin>>c;
            cin.get();
            }while(c!='y' && c!='Y' && c!='n' && c!='N');
            if(c=='y' || c=='Y'){
                intents.erase(intents.begin()+pos);
            }
        }else{
            intents.erase(intents.begin()+pos);
   
        }
    }
    }catch(Error e){
        del=false;
        Util::error(e);
    }
    
    return del;
}

bool Chatbot::addExample(string name){
    bool found=false;
    string example_add;
    int pos=-1;
    try{
        if(name==""){
            cout<<"Intent name: ";
            getline(cin,name);
        }
        pos=searchIntent(name);
        if(pos!=-1){
            found=true;
        }
        if(!found){
        throw ERR_INTENT;      
        }else{
            found=false;
            do{
                cout<<"New example: ";
                getline(cin,example_add);
                
                if(example_add!="q"){
                    try{
                    intents[pos]->Intent::addExample(example_add);
                    found=true;
                    }catch(Error e){
                        Util::error(e);
                    }
                }
        
            }while(example_add!="q");
        }
    }catch(Error e){
        Util::error(e);
    }
    
    return found;
}

bool Chatbot::deleteExample(int id){
    bool deleted=false;
    vector<Example> ejs;
    try{
    if(id==0){
        cout<<"Example id: ";
        cin>>id;
        cin.get();
    }
    for(unsigned i=0;i<intents.size();i++){
        ejs=intents[i]->Intent::getExamples();
        for(unsigned j=0;j<ejs.size();j++){
            if(ejs[j].Example::getId()==id){
                intents[i]->Intent::deleteExample(id);
                deleted=true;
            }
        }
    }
    
    if(!deleted){
    throw ERR_EXAMPLE;
    }
    }catch(Error e){
        Util::error(e);
    }
    return deleted;    
}

bool Chatbot::addResponse(string name, string response){
    bool found=false;
    int pos=-1;
    
    try{
        if(name==""){
            cout <<"Intent name: ";
            getline(cin,name);
        }
        pos=searchIntent(name);
        
        if(pos!=-1){
            if(response==""){
                cout <<"New response: ";
                getline(cin,response);
            }
            intents[pos]->Intent::addResponse(response);
            found=true;
        }else{
            throw ERR_INTENT;
        }
    }catch(Error e){
        Util::error(e);
    }
    return found;
}

string Chatbot::bestResponse(string query, bool debug) const{
    string res="";
    string resp;
    vector<Example> ejs;
    float umbral;
    float max=0;
    int idmax;
    bool found=false;


        for(unsigned i=0;i<intents.size();i++){
            ejs=intents[i]->getExamples();
            for(unsigned j=0;j<ejs.size();j++){
                
                if(strcmp(similarity,"jc")==0){
                    umbral=ejs[j].jaccardSimilarity(query);
                    
                }else if(strcmp(similarity,"ng")==0){
                    umbral=ejs[j].ngramSimilarity(query);
                }
                //cout<<umbral<<endl;
                if(umbral>=threshold){
                    if(umbral>max){
                    idmax=i;
                    max=umbral;
                    found=true;
                    }
                }
            }
        }
        if(found){
            if(debug){
                res+='(';
                res+=to_string(max);
                res+=')';
                res+=' ';
            }
            resp=intents[idmax]->Intent::getResponse();
            res+=resp;
        }else{
            res="";
            throw ERR_RESPONSE;
        }
  
    return res;
}




void Chatbot::test(bool debug) const{
    string query;
    string response;
    
    cout<<">> " << Util::welcome() << endl;
    
    do{
        cout<<"<< ";
        getline(cin,query);
        
            if(query!="q"){
                try{
                    response=bestResponse(query,debug);
                    
                        cout<<">> " << response << endl;
                }catch(Error e){
                    Util::error(e);
                }
            }
        
    }while(query!="q");
}

void Chatbot::configure(float threshold,const char similarity[]){
    char sim[3];
    strcpy(sim,similarity);
    try{
        if(threshold==-1){
            cout<<"Enter threshold: ";
            cin>>threshold; 
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            
            
        }
        
        if(threshold<0 || threshold>1){
            throw ERR_THRESHOLD;
        }else{
            this->threshold=threshold;

        }
        
    }catch(Error e){
        Util::error(e);
    }
    try{
        if(strcmp(similarity,"")==0){
            cout << "Enter algorithm: ";
            cin.get(sim,3);
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            
            
        }
        
        if(strcmp(sim,"jc")!=0 && strcmp(sim,"ng")!=0){
                throw ERR_SIMILARITY;
        }else{
            strcpy(this->similarity,sim);
        }
    }catch(Error e){
        Util::error(e);
    }
    
    
}


