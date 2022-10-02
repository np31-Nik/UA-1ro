#include <iostream>
#include <stdio.h>
#include <time.h>
#include <cstring.h>

const int MAX=100;

typedef char Tcadena[100];

typedef struct {
    char nombre [50];
    float precio ;
}Tproductos

typedef Tproductos Ttienda[MAX];


void introducir( Ttienda prod , int &cantidad){
    cout<< "Introduce sus nombre";
     cin.getline(prod.nombre,50);
     cout << "PRECIO";
     cin>>prod.precio;
 cantidad++;
}