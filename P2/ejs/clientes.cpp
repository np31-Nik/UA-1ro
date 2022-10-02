#include <iostream>
#include <fstream>
#include <string.h>

using namespace std;


const char fClientes[] = "clientes.dat";
const char iClientes[] = "clientes.idx";

typedef struct{
	char nif[9];
	char nombre[100];
	int saldo;	
}TCliente;



typedef struct{
	int pos;
	char nif[9];
}TICliente;

int buscaPos(char nif[]){
	ifstream index;
	bool encontrado=false;
	int posicion=0;
	TICliente indice;

	//abrir fichero index
	index.open(iClientes, ios::in | ios::binary);

	//abierto?
	if(index.is_open()){
	
		//recorrer y buscar nif
		while(!encontrado && index.read((char *) &indice, sizeof(TICliente))){
			if (strcmp(indice.nif, nif)==0){
				posicion=indice.pos;
				encontrado=true;
			}
		}
			//cerrarlo

		index.close();
	}else{
		//sino error

		cout<<"error de apertura del fichero de indice"<<endl;
	}
	
	return posicion;
}
TCliente buscarPorNIF(char nif[]){
	ifstream datos;
	
	TICliente indice;
	TCliente cliente;
	int posicion=-1;

	posicion=buscaPos(nif);
	

	datos.open(fClientes, ios::in | ios::binary);
	

	
	//si nif encontrado
	if(posicion!=-1){
				//abrir fichero clientes

		datos.open(fClientes, ios::in | ios::binary);	
			//si abierto
		if(datos.is_open()){
			//mover cursor a posicion: seekg
			datos.seekg((posicion-1)*sizeof(TCliente), ios::beg);
			
			//leer registro
			datos.read((char *)&cliente,sizeof(TCliente));
			
		}
		else{
			//sino error
			cout<<"Error de apertura del fichero de datos"<<endl;
		}
	}else{
		//sino error
		cout<<"error, nif no encontrado"<<endl;
	}
			
			
			//cerrar
		
	
	
	//devolver registro
	return cliente;
}

bool modificarCliente(TCliente nuevoCliente){
	ofstream datos;
	
	bool resultado=false;
	int posicion=-1;
	// PROBAR int cuantos= datos.tellp()/sizeof(TCliente);
	
	posicion=buscaPos(nuevoCliente.nif);
		

	//abrir fichero clientes

	datos.open(fClientes, ios::out | ios::binary);	
			//si abierto
	if(datos.is_open()){
		//si nif encontrado
		if(posicion!=-1){		//modifico
					
			datos.seekp((posicion-1)*sizeof(TCliente),ios::beg);
		
		}else{  //añadir nuevo
			//cout<<"eror nif"<<endl;
			//datos.seekp(cuantos);
			datos.seekp(0,ios::end);
		}
		datos.write((const char *)&nuevoCliente,sizeof(TCliente));
		resultado=true;
		datos.close();
		}else{
			cout<<"error apertura"<<endl;
		}
	return resultado;
}


int main(){
	
	
	return 0;
}
