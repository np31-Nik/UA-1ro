//Nikita Polyanskiy P550048833
#include <iostream>
#include <string.h>
#include <vector>
#include <stdlib.h>
#include <time.h>
using namespace std;

string cleanString(string);

enum Error{
  ERR_OPTION,
  ERR_INTENT,
  ERR_EXAMPLE,
  ERR_RESPONSE
};

const int KSIZE=10;

struct Example{
    int id;
    string text;
    vector<string> tokens;
};

struct Intent{
    string name;
    vector<Example> examples;
    string response;
};

struct Chatbot{
    int nextId;
    float threshold;
    char similarity[3];
    vector<Intent> intents;
};


const string greetings[KSIZE]={
  "Hola, ¿en qué puedo ayudarte?",
  "¿Qué puedo hacer hoy por ti?",
  "Oh, gran prócer de los bits, ¿cuál es tu deseo?",
  "Buenas",
  "¿Qué quieres?",
  "¿Otra vez necesitas ayuda?",
  "¡Hola! Soy Megabot 3000. ¿En qué puedo ayudarte?",
  "Bonito día para ser Megabot 3000",
  "Pregunta sin miedo",
  "Soy todo oídos"
};

void error(Error n){
  switch(n){
    case ERR_OPTION:
      cout << "ERROR: wrong menu option" << endl;
      break;
    case ERR_INTENT:
      cout << "ERROR: wrong intent name" << endl;
      break;
    case ERR_EXAMPLE:
      cout << "ERROR: wrong example id" << endl;
      break;
    case ERR_RESPONSE:
      cout << "Lo siento, pero no tengo respuesta para eso" << endl;
  }
}

void showMainMenu(){
  cout << "1- Train" << endl
       << "2- Test" << endl
       << "3- Report" << endl
       << "q- Quit" << endl
       << "Option: ";
}

void showTrainMenu(){
  cout << "1- Add intent" << endl
       << "2- Delete intent" << endl
       << "3- Add example" << endl
       << "4- Delete example" << endl
       << "5- Add response" << endl
       << "b- Back to main menu" << endl
       << "Option: ";
}

void addIntent(Chatbot &megabot){
    string txt;
    cin.ignore();
    cout<<"Intent name: ";
    getline(cin,txt);
    cout<<txt;
    
}

void deleteIntent(Chatbot &megabot){

}

void addExample(Chatbot &megabot){

}

void deleteExample(Chatbot &megabot){

}

void addResponse(Chatbot &megabot){

}

void train(Chatbot &megabot){
    char option;
    do{
    showTrainMenu();
    cin>>option;
        switch(option){
            case '1':
                addIntent(megabot);
                break;
            case '2':
                deleteIntent(megabot);
                break;
            case '3':
                addExample(megabot);
                break;
            case '4':
                deleteExample(megabot);
                break;
            case '5':
                addResponse(megabot);
                break;
            case 'b':
                break;
            default:
                error(ERR_OPTION);
                break;
    
        }   
    }while(option!='b');
    
            
}

void test(const Chatbot &megabot){

}

void report(const Chatbot &megabot){
    
    cout<<"Similarity: "<<megabot.similarity<<endl;
    cout<<"Threshold: "<<megabot.threshold<<endl;
    
    for(int i=0;i<(int)megabot.intents.size();i++){
        
        cout<<"Intent: "<<megabot.intents[i].name<<endl;
        cout<<"Response: "<<megabot.intents[i].response<<endl;
        
        for(int j=0;j<(int)megabot.intents[i].examples.size();j++){
            
            cout<<"Example "<<megabot.intents[i].examples[j].id<<": "<<megabot.intents[i].examples[j].text<<endl;
            cout<<"Tokens "<<megabot.intents[i].examples[j].id<<": ";
            
            for(int k=0;k<(int)megabot.intents[i].examples[j].tokens.size();k++){
                cout<<"<"<<megabot.intents[i].examples[j].tokens[k]<<"> ";
                }
            cout<<endl;
        }
    }
    
    cout<<"Total intents: "<<megabot.intents.size()<<endl;
    cout<<"Total examples: "<<megabot.nextId-1<<endl;
    cout<<"Examples per intent: ";
    
    if(megabot.intents.size()>0){
        cout<<((megabot.nextId-1)/(megabot.intents.size()))<<endl;  
    }else{
        cout<<"0"<<endl;                       
    }
}

int main(){
  Chatbot megabot;
  megabot.nextId=1;
  megabot.threshold=0.25;
  strcpy(megabot.similarity,"jc");
    
  srand(666);

  char option;
  do{
    showMainMenu();
    cin >> option;
    cin.get();
        
    switch (option){ 
      case '1':
        train(megabot);
        break;
      case '2':
        test(megabot);
        break;
      case '3':
        report(megabot);
        break;
      case 'q':
        break;
      default:
        error(ERR_OPTION);
    }
  }while(option!='q');
    
  return 0;
}
