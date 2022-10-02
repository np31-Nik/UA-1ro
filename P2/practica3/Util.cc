#include "Util.h"
#include <sstream>

using namespace std;

const int KSIZE=10;

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

string Util::welcome(){
    return greetings[rand() % KSIZE];
}

vector<string> Util::extractTokens(string text){
    vector<string> tokens;
    string palabra;

    text=cleanString(text);

    //Funcion para normalizar string y obtener tokens
    for(unsigned i=0;i<text.size();i++){ 
    //Recorrer string
        if(!isdigit(text[i])){
        //Si no es numero
            if(isalpha(text[i])){
            //Si es letra
                if(isupper(text[i])){
                //si es mayuscula cambiar a minuscula
                    text[i]=text[i]+32;
                }
                if(text[i]=='s' && (text[i+1]==32||i==text.size()-1) &&
                    (i==0 || isalnum(text[i-1]) || text[i-1]==32)){
                    //si la letra final de una palabra es s, se borra
                    text.erase(text.begin()+i);
                    i--;
                }
               
            }else{
                 if(text[i]!=32){
                    //si es otro simbolo, lo borra

                    if(i!=0 && text[i-1]=='s'){
                    text.erase(text.begin()+i);
                    i=i-2;
                        
                    }else{
                    text.erase(text.begin()+i);
                    i--;
                    }
                }
            }
        }
    }

    stringstream ss(text);
    
    while(ss>>palabra){
        tokens.push_back(palabra);
        
    }
    
    return tokens;
}

void Util::error(Error e){
  switch(e){
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
      break;
    case ERR_FILE:
      cout << "ERROR: cannot open file" << endl;
      break;
    case ERR_THRESHOLD:
      cout << "ERROR: the threshold value must be between 0 and 1" << endl;
      break;
    case ERR_SIMILARITY:
      cout << "ERROR: valid values are \"jc\" (Jaccard) and \"ng\" (n-grams)" << endl;
      break;
    case ERR_EMPTY:
      cout << "ERROR: empty strings are not permited" << endl;
      break;
    case ERR_MAXEXAMPLES:
      cout << "ERROR: cannot add more examples" << endl;
  }
}
