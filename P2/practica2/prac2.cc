//Nikita Polyanskiy P550048833
#include <iostream>
#include <string.h>
#include <vector>
#include <stdlib.h>
#include <time.h>
#include <sstream>
#include <cstdlib>
#include <algorithm>
#include <limits>
#include <fstream>

using namespace std;

string cleanString(string);

enum Error{
  ERR_OPTION,
  ERR_INTENT,
  ERR_EXAMPLE,
  ERR_RESPONSE,
  ERR_FILE,
  ERR_THRESHOLD,
  ERR_SIMILARITY,
  ERR_ARGS
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
    case ERR_ARGS:
      cout << "ERROR: invalid arguments" << endl;
  }
}


const int KSIZE=10;
const int KMAXTEXTS=15;
const int KMAXTEXTL=1000;
const string INTNAME="Intent name: ";
const string FILNAME="Enter filename: ";

struct BinIntent{
char name[KMAXTEXTS];
unsigned numExamples;
char response[KMAXTEXTL];
};

struct BinChatbot{
float threshold;
char similarity[3];
unsigned numIntents;
};

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

void showMainMenu(){
  cout << "1- Train" << endl
       << "2- Test" << endl
       << "3- Report" << endl
       << "4- Configure" << endl
       << "5- Import data" << endl
       << "6- Export data" << endl
       << "7- Load chatbot" << endl
       << "8- Save chatbot" << endl
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

bool buscarIntent(Chatbot &megabot,string buscar,int &pos){
    //funcion que recorre el vector intents hasta encontrar uno que coincida el nombre
    bool encontrado=false;
        
    if(megabot.intents.size()!=0){
        for(unsigned i=0;i<megabot.intents.size() && encontrado==false;i++){
            if(buscar==megabot.intents[i].name){
                pos=i;
                encontrado=true;
            }
        }
    }
    return encontrado;
    
    
}
void addReadIntent(Chatbot &megabot,string name_new){
    bool repetido=false;
    Intent intent_new;      //Intent a añadir
    int pos=0;              //Necesario para funcion buscarIntent

    repetido=buscarIntent(megabot, name_new,pos);      //verificar que no esta repetido
    
    
    if(repetido==false){
        intent_new.name=name_new;
        megabot.intents.push_back(intent_new);      //Se añade el nuevo intent
    }
    else{
        error(ERR_INTENT);
    }
    
    
}

void addIntent(Chatbot &megabot){
    string name_new;        //Nombre del intent a añadir

    
    cout<<"Intent name: ";
    getline(cin,name_new);
    
    addReadIntent(megabot,name_new);
  
}


void deleteIntent(Chatbot &megabot){
    char confirm;                   //Caracter para confirmar borrado
    bool encontrado=false;
    string intent_delete;           //Intent a borrar
    int pos=0;                      //posicion del intent a borrar
    
    cout<<"Intent name: ";
    getline(cin,intent_delete);
    
    encontrado=buscarIntent(megabot,intent_delete,pos);
    
    if(encontrado){
        do{
            cout<<"Confirm [Y/N]?: ";
            cin>>confirm;
            cin.get();
        
        }while(confirm!='y' && confirm!='Y' && confirm!='n' && confirm!='N');
        
        if(confirm=='y' || confirm=='Y'){
                
            for(unsigned j=pos;j<megabot.intents.size();j++){     
                        
                if(j==megabot.intents.size()-1){
                //Reduce el tamaño de intents totales
                    megabot.intents.resize(megabot.intents.size()-1);
                                
                }else{
                //Mueve los intents siguientes una posicion atras
                    megabot.intents[j]=megabot.intents[j+1];
                }
                                
            }
        }
    }else{
        error(ERR_INTENT);
    }
}


void cleanExample(string &clean){
    //Funcion para normalizar string
    for(unsigned i=0;i<clean.size();i++){ 
    //Recorrer string
        if(!isdigit(clean[i])){
        //Si no es numero
            if(isalpha(clean[i])){
            //Si es letra
                if(isupper(clean[i])){
                //si es mayuscula cambiar a minuscula
                    clean[i]=clean[i]+32;
                }
                if(clean[i]=='s' && (clean[i+1]==32||i==clean.size()-1) &&
                    (i==0 || isalnum(clean[i-1]) || clean[i-1]==32)){
                    //si la letra final de una palabra es s, se borra
                    clean.erase(clean.begin()+i);
                    i--;
                }
               
            }else{
                 if(clean[i]!=32){
                    //si es otro simbolo, lo borra

                    if(i!=0 && clean[i-1]=='s'){
                    clean.erase(clean.begin()+i);
                    i=i-2;
                        
                    }else{
                    clean.erase(clean.begin()+i);
                    i--;
                    }
                }
            }
        }
    }
}

bool comprobarExample(Chatbot &megabot,Example new_example,int pos,string text){
    bool fin=true;
    bool vacia=true;
    
    //Comprueba si la cadena esta vacia
    for(unsigned i=0;i<text.size() && vacia==true;i++){
        if(isalnum(text[i])){
         vacia=false;   
        }
    }
    //Comprueba si ya hay un example con los mismos tokens
    /*if(!vacia){
        for(unsigned i=0;i<megabot.intents[pos].examples.size();i++){
            for(unsigned j=0;j<megabot.intents[pos].examples[i].tokens.size();j++){
                if(megabot.intents[pos].examples[i].tokens == new_example.tokens)
                    repetido=true;   
                }
                    
            }
    }
    
        if(repetido || vacia){
            fin=false;
        }
        */
    if(vacia){
        fin=false;
    }
    
        return fin;
}
    
void fullCleanExtract(string &limpiar,vector<string> &tokens){
    //Funcion para normalizar un string e extraer sus tokens
    string palabra;

    limpiar=cleanString(limpiar);
    cleanExample(limpiar);
    
    stringstream ss(limpiar);
    
    while(ss>>palabra){
        tokens.push_back(palabra);
        
    }
}
void addReadExample(Chatbot &megabot,string example,string intent){
    int pos=0;
    Example new_example;
    
    new_example.id=megabot.nextId;
    new_example.text=example;
    
    new_example.tokens.clear();
                
    fullCleanExtract(example,new_example.tokens);
    
    
    if(comprobarExample(megabot,new_example,pos,example)){
    //se comprueba que no haya cadenas vacias
        buscarIntent(megabot,intent,pos);
        megabot.nextId++;
        megabot.intents[pos].examples.push_back(new_example);
        
    }
    
}

void addExample(Chatbot &megabot){
    bool encontrado=false;
    int pos=0;
    string intent_add;
    string example_add;

    cout<<"Intent name: ";
    getline(cin,intent_add);
    
    encontrado=buscarIntent(megabot,intent_add,pos);
    
    if(encontrado){
        do{
            cout<<"New example: ";
            getline(cin,example_add);
            
            if(example_add!="q"){
                addReadExample(megabot,example_add,intent_add);
            }
       
        }while(example_add!="q");
    
    }else{
        error(ERR_INTENT);
    }
}

void deleteExample(Chatbot &megabot){
    int id_delete;
    bool encontrado=false;
    cout<<"Example id: ";
    cin>>id_delete;
    cin.get();
    
    //Busca el example en intents y lo borra
    for(unsigned i=0;i<megabot.intents.size();i++){
        for(unsigned j=0;j<megabot.intents[i].examples.size();j++){
            if(megabot.intents[i].examples[j].id==id_delete){
                encontrado=true;
                megabot.intents[i].examples.erase(megabot.intents[i].examples.begin()+j);
            }
        }
    }
    if(!encontrado){
        error(ERR_EXAMPLE);   
    }
    
    
}
void addReadResponse(Chatbot &megabot,string intent_name,string new_response){
    int pos=0;
    
    if(buscarIntent(megabot,intent_name,pos)){
        megabot.intents[pos].response=new_response;
    }    
}

void addResponse(Chatbot &megabot){
    string intent_name;
    int pos=0;
    
    cout<<"Intent name: ";
    getline(cin,intent_name);
    
    if(buscarIntent(megabot,intent_name,pos)){
        cout<<"New response: ";
        getline(cin,megabot.intents[pos].response);
        
    }
    else{
        error(ERR_INTENT);
    }
    
}

void train(Chatbot &megabot){
    char option;
    do{
    showTrainMenu();
    cin>>option;
    cin.get();
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

int numTokens(vector<string> tokens,vector<string> &unicos){
    //Funcion que cuenta el numero de tokens sin repetir y crea un vector con ellos
    int num=0;
    
    unicos.clear();
   
    sort(tokens.begin(),tokens.end());
    tokens.erase(unique(tokens.begin(),tokens.end()),tokens.end());
    
    unicos=tokens;
    num=unicos.size();
    
    return num;
    
    
}

int tokensComun(vector<string> vecA,vector<string> vecB){
    //Funcion que cuenta el numero de elementos comunes de 2 vectores
    int comun=0;
    vector<string> vecComun;
    
    sort(vecA.begin(),vecA.end());
    sort(vecB.begin(),vecB.end());
    set_intersection(vecA.begin(),vecA.end(),vecB.begin(),vecB.end(),back_inserter(vecComun));
   
    comun=vecComun.size();
    
    return comun;
    
    
}
void calcularTriGramas
(Chatbot &megabot,vector<string> tokens,vector<string> &trigramas){
    //funcion que obtiene los trigramas sin repetir de un vector de tokens
    string tri;
    bool repetido=false;
    
    for(unsigned i=0;i<tokens.size();i++){
        if(tokens[i].size()>=3){
            for(unsigned j=0;j<tokens[i].size();j++){
                tri.push_back(tokens[i][j]);
                
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
    /*
    for(unsigned i=0;i<trigramas.size();i++){
            cout<<"trigramas<<"<<trigramas[i]<<endl;
   
    }
    */
    
}
int similitud(Chatbot &megabot,vector<string> tokens, char similarity[3]){
    //Funcion que calcula coeficiente de jaccard o ngramas y devuelve el intent correspondiente
    float jc=0;
    float jcMax=0;
    int A=0;
    int B=0;
    int intent_id=0;
    int comun=0;
    vector<string> vecA;
    vector<string> vecB;
    
    if(strcmp(similarity,"jc")==0){
        A=numTokens(tokens,vecA);

        for(unsigned i=0;i<megabot.intents.size();i++){
            for(unsigned j=0;j<megabot.intents[i].examples.size();j++){
            
                B=numTokens(megabot.intents[i].examples[j].tokens,vecB);
                comun=tokensComun(vecA,vecB);
            
                jc=(float)comun/(float)(A+B-comun);
                
                if(jc>jcMax){
                    jcMax=jc;
                    intent_id=i;
                }
                
            }
            
        }
    }else if(strcmp(similarity,"ng")==0){
        calcularTriGramas(megabot,tokens,vecA);
        A=vecA.size();    
        for(unsigned i=0;i<megabot.intents.size();i++){
            for(unsigned j=0;j<megabot.intents[i].examples.size();j++){
                calcularTriGramas(megabot,megabot.intents[i].examples[j].tokens,vecB);
                comun=tokensComun(vecA,vecB);
                B=vecB.size();
                
                //calculo de ngramas, usando mismas variables que para jc
                jc=(float)comun/(float)(A+B-comun);
             
                if(jc>jcMax){
                    jcMax=jc;
                    intent_id=i;
                }
                
            }
        }
        
    }
    
    //Si no se pasa el umbral, se devuelve -1
    if(jcMax<megabot.threshold){
        intent_id=-1;
    }
    return intent_id;
        
    
}


void test(Chatbot &megabot){
    int position=rand() % KSIZE;
    int id=0;
    string consulta;
    vector<string> tokens;
    vector<string> abc;
    
    cout<<">>"<<greetings[position]<<endl;
    do{
        cout<<"<<";
        getline(cin,consulta);
        
        if(consulta!="q"){
            //Vaciar vector tokens
            tokens.clear();
            
            //Normalizar consulta y obtener tokens
            fullCleanExtract(consulta,tokens);
            
            //calular el id de intents
            id=similitud(megabot,tokens,megabot.similarity);
            
            if(id==-1){
                error(ERR_RESPONSE);
            }else{
                cout<<">>"<<megabot.intents[id].response<<endl;        
            }
        }
    }while(consulta!="q");
}

void report(const Chatbot &megabot){
    float num_examples=0; //Contador de los examples totales
    
    cout<<"Similarity: ";
    if(strcmp(megabot.similarity,"jc")==0){
        cout<<"Jaccard"<<endl;
    }else if(strcmp(megabot.similarity,"ng")==0){
        cout<<"N-grams"<<endl;
    }
    cout<<"Threshold: "<<megabot.threshold<<endl;
    
    for(int i=0;i<(int)megabot.intents.size();i++){
        
        cout<<"Intent: "<<megabot.intents[i].name<<endl;
        cout<<"Response: "<<megabot.intents[i].response<<endl;
        
        for(int j=0;j<(int)megabot.intents[i].examples.size();j++){
            cout<<"Example "<<megabot.intents[i].examples[j].id<<": "<<megabot.intents[i].examples[j].text<<endl;
            cout<<"Tokens "<<megabot.intents[i].examples[j].id<<": ";
            num_examples++;

            for(int k=0;k<(int)megabot.intents[i].examples[j].tokens.size();k++){
                cout<<"<"<<megabot.intents[i].examples[j].tokens[k]<<"> ";
                }
                
            cout<<endl;
        }
    }
    
    cout<<"Total intents: "<<megabot.intents.size()<<endl;
    cout<<"Total examples: "<<num_examples<<endl;
    cout<<"Examples per intent: ";
    
    if(megabot.intents.size()>0){
        cout<<((num_examples)/(float)(megabot.intents.size()))<<endl;  
    }else{
        cout<<"0"<<endl;                       
    }
}

void limpiarBuffer(){
    //Funcion para limpiar el buffer, para que no haya restos
    //de cadena despues de usar cin
    
    cin.clear();
    cin.ignore(numeric_limits<streamsize>::max(), '\n');   
}

void configure(Chatbot &megabot){
    float threshold=-1;
    char algorithm[50];
    
    cout<<"Enter threshold: ";
    cin>>threshold;
    
    limpiarBuffer();
    
    if(threshold<0 || threshold>1){
        error(ERR_THRESHOLD);
    }else{
        megabot.threshold=threshold;
    }
    
    cout<<"Enter algorithm: ";
    cin.get(algorithm,3);
    
    limpiarBuffer();

    if(strcmp(algorithm,"jc")!=0 && strcmp(algorithm,"ng")!=0){
        error(ERR_SIMILARITY);
    }else{
        strcpy(megabot.similarity,algorithm);
    }
}

void importFichero(Chatbot &megabot, ifstream &file){
    //Funcion secundaria para leer de un fichero y almacenar en chatbot
    bool hashtag=false,response=false; //para saber si ha leido # y un response
    char c;
    string leido,intent;
    
    while(file >> noskipws >> c && !file.eof()){
        if(!response){
            if(c=='#' && !hashtag){
                hashtag=true;
                   
            }else if(c!='#' && hashtag){
                leido.push_back(c);
                    
            }else if(c=='#' && hashtag){
                hashtag=false;
                leido.push_back('\n');
                addReadIntent(megabot,leido);
                intent=leido;
                leido.clear();

            }else if (c!='#' && !hashtag){
                leido.push_back(c);
                if(c=='\n'){
                    addReadResponse(megabot,intent,leido);
                    leido.clear();
                    response=true;
                }
            }
        }else{
            if(c!='#'){
                leido.push_back(c);
                if(c=='\n'){
                    addReadExample(megabot,leido,intent);
                    leido.clear();
                }
            }else{
                response=false;
                hashtag=true;                
            }
        }
    }   
}

void importData(Chatbot &megabot){
    //Funcion principal para leer de un fichero y almacenar los datos en chatbot
    string filename;
    ifstream file;
    
    cout<<"Enter filename: ";
    getline(cin,filename);
    
    file.open(filename.c_str());
    
    if(file.is_open()){
        importFichero(megabot,file);
        file.close();
    }else{
        error(ERR_FILE);
    }
}

void escribirData(Chatbot &megabot,string filename,int pos=-1){
    //funcion para escribir en un fichero
    ofstream fi;
    fi.open(filename);
    if(fi.is_open()){
        if(pos==-1){
        //Por defecto pos = -1, escribira todos los intents
            for(unsigned i=0;i<megabot.intents.size();i++){
                fi << "#";
                fi << megabot.intents[i].name;
                fi << "#";
                fi << megabot.intents[i].response << endl;
                
                for(unsigned j=0;j<megabot.intents[i].examples.size();j++){
                    fi << megabot.intents[i].examples[j].text<<endl;
                }
            }
        }else{
        //si pos tiene otro valor, escribira solo el intent en esa posicion
            fi << "#";
            fi << megabot.intents[pos].name;
            fi << "#";
            fi << megabot.intents[pos].response<<endl;
            
            for(unsigned j=0;j<megabot.intents[pos].examples.size();j++){
                fi << megabot.intents[pos].examples[j].text<<endl;
            }
        }
        fi.close();
    }else{
        error(ERR_FILE);
    }
    
}
void confirm(string text, char &c){
    //Funcion para pedir confirmacion Y/N
    do{
        cout<<text;
        cin>>c;
        cin.get();
    }while(c!='y' && c!='Y' && c!='n' && c!='N');
}

void exportData(Chatbot &megabot){
    //funcion principal para escribir en un fichero
    char c=0;
    string intent_name,file_name;
    int pos=-1;
    confirm("Save all intents [Y/N]?: ",c);
    
    
    if(c=='y' || c=='Y'){
        cout<<"Enter filename: ";
        getline(cin,file_name);
        escribirData(megabot,file_name);
        
    }else if(c=='n' || c=='N'){
        cout<<INTNAME;
        getline(cin,intent_name);

        if(!buscarIntent(megabot,intent_name,pos)){
                error(ERR_INTENT);
        }else{
            cout<<FILNAME;
            getline(cin,file_name);
            escribirData(megabot,file_name,pos);
        }
    }
}
void nuevoChatbot(Chatbot &megabot){
    //funcion para crear un nuevo chatbot / reiniciar
    megabot.intents.clear();
    megabot.nextId=1;
    megabot.threshold=0.25;
    strcpy(megabot.similarity,"jc");
    
}

void cargarDatos(Chatbot &megabot,ifstream &fi){
    //Funcion para cargar datos de un fichero binario al chatbot
    string limpiar;
    char example_read[KMAXTEXTL];
    
    BinChatbot binary;
    BinIntent bIntent;
    
    Intent new_intent;
    Example new_example;
    
    //reinicia el chatbot
    nuevoChatbot(megabot);
            
    fi.read((char *)&binary,sizeof(BinChatbot));
            
    megabot.threshold=binary.threshold;
    strcpy(megabot.similarity,binary.similarity);
            
            
    for(unsigned i=0;i<binary.numIntents;i++){
        fi.read((char *)&bIntent,sizeof(BinIntent));
                
        new_intent.name=bIntent.name;
        new_intent.response=bIntent.response;
                
        for(unsigned j=0;j<bIntent.numExamples;j++){
            fi.read(example_read,KMAXTEXTL);
                    
            new_example.text=example_read;
            new_example.id=megabot.nextId;
            megabot.nextId++;
                    
            limpiar=new_example.text;
            fullCleanExtract(limpiar,new_example.tokens);
                    
            new_intent.examples.push_back(new_example);
                    
            new_example.tokens.clear();

        }
        megabot.intents.push_back(new_intent);
        new_intent.examples.clear();
    }
            
}

void loadChatbot(Chatbot &megabot){
    char c;
    string file_name;
    ifstream fi;
    
    cout<<FILNAME;
    getline(cin,file_name);
    
    fi.open(file_name, ios::binary);
    if(fi.is_open()){
        confirm("Confirm [Y/N]?: ",c);
        if(c=='y' || c=='Y'){
            cargarDatos(megabot,fi);   
        }
        fi.close();    

    }else{
        error(ERR_FILE);
    }
    
}

void saveChatbot(Chatbot &megabot){
    char file_name[KMAXTEXTL];
    ofstream fi;
    BinChatbot binary;
    BinIntent bIntent;
    char exmpl[KMAXTEXTL];
    string to_char;
    
    cout<<FILNAME;
    cin>>file_name;
    
    fi.open(file_name, ios::binary);
    
    if(fi.is_open()){
        binary.threshold=megabot.threshold;
        strcpy(binary.similarity,megabot.similarity);
        binary.numIntents=megabot.intents.size();
        
        fi.write((const char*) &binary,sizeof(BinChatbot));
        
        for(unsigned i=0;i<binary.numIntents;i++){
            //recortar cadena name a tamaño KMAXTEXTS-1
            to_char=megabot.intents[i].name;
            to_char.resize(KMAXTEXTS-1);
            
            //pasar datos a bIntent
            strcpy(bIntent.name,to_char.c_str());
            bIntent.numExamples=megabot.intents[i].examples.size();
            strcpy(bIntent.response,megabot.intents[i].response.c_str());
            
            fi.write((const char*)&bIntent,sizeof(BinIntent));
            
            for(unsigned j=0;j<megabot.intents[i].examples.size();j++){
                strcpy(exmpl,(char*)megabot.intents[i].examples[j].text.c_str());
                fi.write(exmpl,KMAXTEXTL);
            }
        }
        fi.close();
    }else{
     error(ERR_FILE);   
    }
}
void mainMenu(Chatbot &megabot){
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
        case '4':
            configure(megabot);
            break;
        case '5':
            importData(megabot);
            break;
        case '6':
            exportData(megabot);
            break;
        case '7':
            loadChatbot(megabot);
            break;
        case '8':
            saveChatbot(megabot);
            break;
        case 'q':
            break;
        default:
            error(ERR_OPTION);
        }
    }while(option!='q');
    
}
void arguments(Chatbot &megabot,int argc, char *argv[]){
    //Funcion principal del programa, verifica los argumentos
  bool Btest=false;
  bool load=false;
  bool import=false;
  bool err=false;
  string load_file;
  string import_file;
  ifstream fi;
  
    if(argc>1){
        //Si hay mas de 1 argumento (mas que ./prac2.cc)
        
        for(int i=1;i<argc && err==false;i++){
            
            if(strcmp(argv[i],"-t")==0){
                Btest=true;
                
            }else if((strcmp(argv[i],"-l")==0) || (strcmp(argv[i],"-i")==0)){
                
                if(argc-1>=i+1){
                    
                    if(strcmp(argv[i],"-l")==0){
                        load=true;
                        load_file.assign(argv[i+1]);
                        i++;

                        
                    }else if(strcmp(argv[i],"-i")==0){
                        import=true;
                        import_file.assign(argv[i+1]);
                        i++;
                    }
                    
                }else{
                    err=true;
                    error(ERR_ARGS);
                    
                }
            }else{
                err=true;
                error(ERR_ARGS);            
            }
        }
        
        if(load){
            fi.open(load_file);
            
            if(fi.is_open()){
                cargarDatos(megabot,fi);
            }else{
                error(ERR_FILE);
            }
            fi.close();
        }
        
        if(import){
            fi.open(import_file);
            
            if(fi.is_open()){
                importFichero(megabot,fi);
            }else{
                error(ERR_FILE);
            }
            fi.close();
        }
        
        if(Btest){
            test(megabot);
        }
    }
    
    mainMenu(megabot); 
}


int main(int argc, char *argv[]){
  Chatbot megabot;
  nuevoChatbot(megabot);
    
  srand(666);
  
  arguments(megabot,argc,argv);
  
  return 0;
}
