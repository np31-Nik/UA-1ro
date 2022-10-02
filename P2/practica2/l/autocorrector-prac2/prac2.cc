// Morales Gomez, Juan Ramón   DNI:48732239T

#include <iostream>
#include <cstring>
#include <stdlib.h>
#include <vector>
#include <string.h>
#include <sstream>
#include <fstream>
using namespace std;
string cleanString(string);

enum Error
{
	ERR_OPTION,
	ERR_INTENT,
	ERR_EXAMPLE,
	ERR_RESPONSE,
	ERR_FILE,
	ERR_THRESHOLD,
	ERR_SIMILARITY,
	ERR_ARGS
};

string cleanString(string);
const int KSIZE = 10;
const int KMAXTEXTL = 1000;
const int KMAXTEXTS = 15;

struct Example
{
	int id;
	string text;
	vector<string> tokens;
};
struct Intent
{
	string name;
	vector<Example> examples;
	string response;
};
struct Chatbot
{
	int nextId;
	float threshold;
	char similarity[3];
	vector<Intent> intents;
};
struct BinIntent
{
	char name[KMAXTEXTS];
	unsigned numExamples;
	char response[KMAXTEXTL];
};
struct BinChatbot
{
	float threshold;
	char similarity[3];
	unsigned numIntents;
};

const string greetings[KSIZE] = {
	"Hola, ¿en qué puedo ayudarte?",
	"¿Qué puedo hacer hoy por ti?",
	"Oh, gran prócer de los bits, ¿cuál es tu deseo?",
	"Buenas",
	"¿Qué quieres?",
	"¿Otra vez necesitas ayuda?",
	"¡Hola! Soy Megabot 3000. ¿En qué puedo ayudarte?",
	"Bonito día para ser Megabot 3000",
	"Pregunta sin miedo",
	"Soy todo oídos"};

//funcion que busca la posicion de un intent
int control(const Chatbot &megabot, string name)
{
	int con = -1;

	for (unsigned i = 0; i < megabot.intents.size(); i++)
	{
		if (name == megabot.intents[i].name)
		{
			con = i;
		}
	}
	return con;
}




//quita los no alpha númerico
string cleanNotAlnum(string str)
{
	string res;

	for (unsigned i = 0; i < str.length(); i++)
	{
		if (isalnum(str[i]) != 0 || str[i] == ' ' || isdigit(str[i]) != 0)
		{
			res += str[i];
		}
	}
	return res;
}



//Quita las mayusculas
string removeUpper(string str)
{

	string res;
	for (unsigned i = 0; i < str.length(); i++)
	{

		if (isupper(str[i]) != 0)
		{

			res += tolower(str[i]);
		}
		else
		{

			res += str[i];
		}
	}

	return res;
}



//Quita las s de fin de palabra
string quitarS(string str)
{

	string res;
	int i;
	int len = str.length();

	//Quitamos la ultima s de cada palabra menos de la última
	for (i = 1; i < len; i++)
	{

		if ((str[i] == ' ' && str[i - 1] == 's'))
		{

			str.erase(i - 1, 1);
			i--;
			len = str.length();
		}
	}

	//Borra la s de la ultima palabra
	if (str[len - 1] == 's')
	{

		str.erase(i - 1, 1);
		i--;
		len = str.length();
	}
	res = str;
	return res;
}



//Elimina elementos repetidos del vector
void repeticiones(vector<string> &cadena)
{

	for (unsigned a = 0; a < cadena.size(); a++)
	{
		for (unsigned b = a + 1; b < cadena.size(); b++)
		{
			if (cadena[a] == cadena[b])
			{
				cadena.erase(cadena.begin() + b);
			}
		}
	}
}



void error(Error n)
{
	switch (n)
	{
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

void showMainMenu()
{
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

void showTrainMenu()
{
	cout << "1- Add intent" << endl
		 << "2- Delete intent" << endl
		 << "3- Add example" << endl
		 << "4- Delete example" << endl
		 << "5- Add response" << endl
		 << "b- Back to main menu" << endl
		 << "Option: ";
}



void addIntent(Chatbot &megabot)
{
	Intent intent;
	cout << "Intent name: ";
	getline(cin, intent.name);

	if (control(megabot, intent.name) == -1)
	{ // condición que no ha localizado el nombre
		megabot.intents.push_back(intent);
	}
	else
	{
		error(ERR_INTENT);
	}
}


void deleteIntent(Chatbot &megabot)
{
	unsigned lugar;
	Intent intent;
	char respuesta;
	cout << "Intent name: ";
	getline(cin, intent.name);
	lugar = control(megabot, intent.name);
	if (lugar == -1)
	{//Si no lo encuentra salta error
		error(ERR_INTENT);
	}
	else
	{
		do
		{

			cout << "Confirm [Y/N]?: ";
			cin >> respuesta;
		} while (respuesta != 'Y' && respuesta != 'y' && respuesta != 'N' && respuesta != 'n');
		if (respuesta == 'y' || respuesta == 'Y')
		{
			megabot.intents.erase(megabot.intents.begin() + lugar);//borra el intent si lo detecta lugar
		}
	}
}



//Funcion que separa un string en tokens
vector<string> tokeniza(string str)
{

	vector<string> palabras;

	istringstream buffer(str);

	do
	{

		string palabra;

		buffer >> palabra;
		if (palabra.empty() == false)
		{

			palabras.push_back(palabra);
		}
	} while (buffer);

	return palabras;
}



void addExample(Chatbot &megabot)
{
	Example example;
	string cadena;
	string ejemplo;
	Intent intent;

	cout << "Intent name: ";
	getline(cin, intent.name);

	int lugar = control(megabot, intent.name);

	if (lugar != -1)
	{
		if (intent.name == megabot.intents[lugar].name)
		{
			do
			{
				cout << "New example: ";
				getline(cin, ejemplo);

				example.text = ejemplo;
				example.id = megabot.nextId;

				if (ejemplo != "q")
				{

					//Limpiamos el texto
					ejemplo = cleanString(ejemplo);

					//Quitamos los no alfanumericos
					ejemplo = cleanNotAlnum(ejemplo);

					//Quitamos las mayusculas
					ejemplo = removeUpper(ejemplo);
					//Quitamos las s
					ejemplo = quitarS(ejemplo);

					//Tokenizamos el ejemplo del usuario
					example.tokens = tokeniza(ejemplo);

					if (!example.tokens.empty())
					{

						megabot.intents[lugar].examples.push_back(example);
						example.tokens.clear();

						//Aumentamos en 1 el id para el siguiente example
						megabot.nextId++;
					}
				}
			} while (ejemplo != "q");
		}
	}
	else
	{
		error(ERR_INTENT);
	}
}



void deleteExample(Chatbot &megabot)
{
	Example example;
	Chatbot chatbot;
	int numero;
	bool encontrado = false;

	cout << "Example id: ";
	cin >> numero;
	//Aqui recorremos todos los id de los ejemplos y  si lo encontramos lo borramos y vuelve existe igual a true
	for (unsigned j = 0; j < megabot.intents.size(); j++)
	{
		for (unsigned k = 0; k < megabot.intents[j].examples.size(); k++)
		{
			if (megabot.intents[j].examples[k].id == numero)
			{
				megabot.intents[j].examples.erase(megabot.intents[j].examples.begin() + k);
				encontrado = true;
				break;
			}
		}
	}
	if (encontrado == false)
	{
		error(ERR_EXAMPLE);
	}
}



void addResponse(Chatbot &megabot)
{

	string intentName;
	string respuesta;

	cout << "Intent name: ";
	getline(cin, intentName);

	int pos = control(megabot, intentName);

	if (pos == -1)
	{ //Si la funcion control no detecta el nombre salta error
		error(ERR_INTENT);
	}
	else
	{

		cout << "New response: ";
		getline(cin, respuesta);

		megabot.intents[pos].response = respuesta; // el response del megabot es al string respuesta
	}
}



void train(Chatbot &megabot)
{
	char option;
	do
	{
		showTrainMenu();
		cin >> option;
		cin.get();
		switch (option)
		{
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
		}
	} while (option != 'b');
}



float jaccardSimilarity(vector<string> usuario, vector<string> maquina)
{
	float jc = 0.0;
	float comunes = 0.0;
	float distintas = 0.0;
	//Sacar las comunes
	for (unsigned i = 0; i < usuario.size(); i++)
	{
		for (unsigned j = 0; j < maquina.size(); j++)
		{
			if (maquina[j] == usuario[i])
			{
				comunes++;
			}
		}
	}

	distintas = maquina.size() + usuario.size() - comunes;
	jc = comunes / distintas;
	return jc;
}



void test(const Chatbot &megabot)
{

	float jc = 0.0;
	float jcMaximo = 0.0;
	int posIntent = 0;

	string respuesta;
	vector<string> tokensUsario;
	vector<string> tokensMaquina;
	int position = rand() % KSIZE;
	cout << ">> " << greetings[position] << endl;

	do
	{
		cout << "<< ";
		getline(cin, respuesta);

		if (respuesta != "q")
		{
			respuesta = cleanString(respuesta);
			respuesta = cleanNotAlnum(respuesta);
			respuesta = removeUpper(respuesta);
			respuesta = quitarS(respuesta);

			//Tokens del usuario
			tokensUsario = tokeniza(respuesta);

			repeticiones(tokensUsario);

			for (unsigned i = 0; i < megabot.intents.size(); i++)
			{
				for (unsigned j = 0; j < megabot.intents[i].examples.size(); j++)
				{
					tokensMaquina.clear(); // llamamos a la funcion tokensMaquina y lo limpiamos
					tokensMaquina = megabot.intents[i].examples[j].tokens;
					repeticiones(tokensMaquina);//eliminamos las repeticiones que puede llegar
					jc = jaccardSimilarity(tokensUsario, tokensMaquina);

					if (jc > jcMaximo)
					{
						jcMaximo = jc;
						posIntent = i;
					}
				}
			}

			if (jcMaximo >= megabot.threshold)
			{// muestra la respuesta si es valida
				cout << ">> " << megabot.intents[posIntent].response << endl;
				jcMaximo = 0.0;
				posIntent = 0;
			}
			else
			{
				error(ERR_RESPONSE);
				jcMaximo = 0.0;
				posIntent = 0;
			}
		}
	} while (respuesta != "q"); // q para salir
}



void report(const Chatbot &megabot)
{
	float size_example = 0;
	float Ex_per_In;

	if (strcmp(megabot.similarity, "jc") == 0)
	{

		cout << "Similarity: Jaccard" << endl;
	}
	else
	{

		cout << "Similarity: N-grams" << endl;
	}

	cout << "Threshold: " << megabot.threshold << endl;

	for (unsigned i = 0; i < megabot.intents.size(); i++)
	{
		cout << "Intent: " << megabot.intents[i].name << endl;
		cout << "Response: " << megabot.intents[i].response << endl;

		for (unsigned j = 0; j < megabot.intents[i].examples.size(); j++)
		{
			size_example++;
			cout << "Example " << megabot.intents[i].examples[j].id << ": "
				 << megabot.intents[i].examples[j].text << endl;
			cout << "Tokens " << megabot.intents[i].examples[j].id << ": ";

			unsigned tokensFinal = megabot.intents[i].examples[j].tokens.size();

			for (unsigned k = 0; k < megabot.intents[i].examples[j].tokens.size() - 1; k++)
			{
				cout << "<" << megabot.intents[i].examples[j].tokens[k] << "> ";
			}
			cout << "<" << megabot.intents[i].examples[j].tokens[tokensFinal - 1] << ">";

			cout << endl;
		}
	}

	cout << "Total intents: " << megabot.intents.size() << endl;
	cout << "Total examples: " << size_example << endl;

	// calcular Examples per intent
	if (megabot.intents.size() > 0)
	{

		Ex_per_In = size_example / megabot.intents.size();
		cout << "Examples per intent: " << Ex_per_In << endl;
	}
	else
	{

		cout << "Examples per intent: 0" << endl;
	}
}

/*###########################################
		FUNCIONES PRACTICA 2
###########################################
*/

void configure(Chatbot &megabot)
{
	char algoritmo[3];
	float threshold = 0.0;

	cout << "Enter threshold: " << endl;
	cin >> threshold;
	cin.get();

	if (threshold < 0 || threshold > 1)
	{ // si no esta comprendido entre 0 y 1 salta error
		error(ERR_THRESHOLD);
	}
	else
	{
		megabot.threshold = threshold;
	}

	cout << "Enter algorithm: ";
	cin.getline(algoritmo, 3);

	if (strcmp(algoritmo, "jc") == 0 || strcmp(algoritmo, "ng") == 0)  
	{ //Si el algoritmo introducido es jc o ng
		strcpy(megabot.similarity, algoritmo);// lo copiamos
	}
	else
	{
		error(ERR_SIMILARITY);
	}
}



void importData(Chatbot &megabot)
{
	int pos = 1;
	string doc;
	string intents;
	string response;
	string example;
	cout << "Enter filename: ";
	getline(cin, doc);
	ifstream fichero;
	if (fichero.is_open())
	{
		string text;
		while (getline(fichero, text))
		{
			if (text[0] == '#')
			{
				response = "";
				intents = "";
				example = "";
				for (unsigned j = 1; text[j] != '#'; j++)
				{
					intents += text[j];
					pos = j;
				}
				
			}
			if (text[pos + 1] == '#')
			{
				for (unsigned k = pos + 2; k < text.length(); k++)
				{
					response += text[k];
				}
				
				response = "";
			}
			else
			{
				for (unsigned l = 0; l < text.length(); l++)
				{
					example += text[l];
				}
				
				example = "";
			}
		}
		fichero.close();
	}
	else
		error(ERR_FILE);
}



void exportData(Chatbot &megabot)
{
	string save;
	Intent intent;

	string doc;
	unsigned lugar;

	do
	{
		cout << "Save all intents [Y/N]?: " << endl;
		getline(cin, save);
	} while (save != "Y" && save != "y" && save != "N" && save != "n");

	//CASO GUARDAR TODOS LOS INTENTS
	if (save == "y" || save == "Y")
	{
		string text, text2, text3;
		cout << "Enter filename: ";
		getline(cin, doc);

		ofstream fichero;
		fichero.open(doc.c_str(), ios::out);
		if (fichero.is_open())
		{
			for (unsigned i = 0; i < megabot.intents.size(); i++)
			{ //recorremos el megabot intents

				fichero << "#" << megabot.intents[i].name; 
				fichero << "#" << megabot.intents[i].response << endl;
				for (unsigned j = 0; j < megabot.intents[i].examples.size(); j++)
				{// recorremos el megabot intents examples

					fichero << megabot.intents[i].examples[j].text << endl;
				}
			}
			fichero.close(); // cerramos el fichero
		}
		else
		{

			error(ERR_FILE);
		}
	}
	else if (save == "n" || save == "N")
	{

		string intentName;
		cout << "Intent name: ";
		getline(cin, intentName);

		int pos = control(megabot, intentName);

		if (pos == -1)
		{ // si no detecta el nombre salta error

			error(ERR_INTENT);
		}
		else
		{

			cout << "Enter filename: ";
			getline(cin, doc);

			ofstream fichero;
			fichero.open(doc.c_str(), ios::out);

			if (fichero.is_open())
			{

				fichero << "#" << megabot.intents[pos].name;
				fichero << "#" << megabot.intents[pos].response << endl;
				for (unsigned i = 0; i < megabot.intents[pos].examples.size(); i++)
				{ // recorremos la posicion del intent del ejemplo

					fichero << megabot.intents[pos].examples[i].text << endl;
				}
				fichero.close();
			}
			else
			{

				error(ERR_FILE); 
			}
		}
	}
}



void pushExamples(Chatbot &megabot, string limpio, string intentName)
{
	Example nuevoExample;
	int posIntent = control(megabot, intentName);
	nuevoExample.text = limpio;
	nuevoExample.id = megabot.nextId++;
	if (posIntent != 1)
	{
		if (limpio != "q")
		{
			//Limpiamos el texto
			limpio = cleanString(limpio);

			//Quitamos los no alfanumericos
			limpio = cleanNotAlnum(limpio);

			//Quitamos las mayusculas
			limpio = removeUpper(limpio);
			//Quitamos las s
			limpio = quitarS(limpio);

			//Tokenizamos el ejemplo del usuario
			nuevoExample.tokens = tokeniza(limpio);

			if (!nuevoExample.tokens.empty())
			{
				megabot.intents[posIntent].examples.push_back(nuevoExample);
				nuevoExample.tokens.clear();
				//megabot.nextId++;
			}
		}
	}
	
	
	
}



void loadChatbot(Chatbot &megabot)
{
	string nombre;
	char example_read[KMAXTEXTL];

	BinChatbot BinBot;
	string save;
	Intent nuevo_intent;
	Example nuevo_example;
	int pos = 0;

	cout << "Enter filename: ";
	getline(cin, nombre);

	ifstream archivo;
    archivo.open(nombre.c_str(), ios::binary);
    
	if (archivo.is_open())
	{
		do
		{
			cout << "Confirm [Y/N]?: ";
			getline(cin, save);
		} while (save != "Y" && save != "y" && save != "N" && save != "n");

		if (save == "y" || save == "Y")
		{
			megabot.intents.clear();
			megabot.nextId = 1;

			archivo.read((char *)&BinBot, sizeof(BinChatbot));
			megabot.threshold = BinBot.threshold;
			strcpy(megabot.similarity, BinBot.similarity);

			for (unsigned i = 0; i < BinBot.numIntents; i++)
			{
				BinIntent bIntent;
				Intent intent;
				//Leemos un registro de tipo BinIntent
				//Almacenamos la información leída en el registro intent pasado como parámetero a la funcion
				archivo.read((char *)&bIntent, sizeof(BinIntent));
				intent.name = bIntent.name;
				intent.response = bIntent.response;
				pos = control(megabot, intent.name);
				if (pos == -1)
				{
					megabot.intents.push_back(intent);
				}
				else
				{
					error(ERR_INTENT);
				}
				//Ahora leemos el total de numExamples, este valor lo hemos leido antes del registro BinIntent
				//Para ello usamos un bucle, donde en cada iteracion leemos un registro de tipo BinExamples
				for (unsigned j = 0; j < bIntent.numExamples; j++)
				{
					archivo.read((char *)&example_read, sizeof(example_read)); //leemos el registro
					string text = example_read;
					pushExamples(megabot, text, intent.name);
				}
			}
		}
	}else{
     error(ERR_FILE);   
    }
}



void saveChatbot(Chatbot &megabot)
{
	string nombre;
	cout << "Enter filename: ";
	getline(cin, nombre);
	ofstream archivo;
	archivo.open(nombre.c_str(), ios::out | ios::binary);
	char texto[KMAXTEXTL];

	if (archivo.is_open())
	{
		BinChatbot bc;

		BinIntent bi;
		
		strcpy(bc.similarity, megabot.similarity);
		bc.threshold = megabot.threshold;
		bc.numIntents = megabot.intents.size();
		archivo.write((const char *)&bc, sizeof(BinChatbot));

		for (unsigned j = 0; j < megabot.intents.size(); j++)
		{
			strncpy(bi.name, megabot.intents[j].name.c_str(), KMAXTEXTS - 1); //recorta si es necesario el name
			bi.name[KMAXTEXTS - 1] = '\0';//Maximo de 14 caracteres
			bi.numExamples = megabot.intents[j].examples.size();
			strncpy(bi.response, megabot.intents[j].response.c_str(), KMAXTEXTL - 1);//recorta si es necesario el response
			bi.response[KMAXTEXTL - 1] = '\0'; //Maximo de 999 caracters
			archivo.write((const char *)&bi, sizeof(BinIntent));

			for (unsigned k = 0; k < megabot.intents[j].examples.size(); k++)
			{//bucle que recorre los intents para llegar a los examples
				strncpy(texto, megabot.intents[j].examples[k].text.c_str(), KMAXTEXTL - 1);

				texto[KMAXTEXTL - 1] = '\0';
				archivo.write((const char *)&texto, KMAXTEXTL);
			}
		}
		archivo.close();
	}
	else
	{
		error(ERR_FILE);
	}
}



int main()
{
	Chatbot megabot;
	megabot.nextId = 1;
	megabot.threshold = 0.25;
	strcpy(megabot.similarity, "jc");

	srand(666);

	char option;
	do
	{
		showMainMenu();
		cin >> option;
		cin.get();

		switch (option)
		{
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
	} while (option != 'q');

	return 0;
}
