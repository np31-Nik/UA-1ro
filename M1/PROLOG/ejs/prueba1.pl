%HECHOS
mujer(ana).
mujer(eva).
hombre(jorge).
hombre(juan).

gusta(juan,ana).
gusta(ana,juan).
gusta(jorge,eva).

edad(ana,25).
edad(juan,27).
edad(jorge,18).
edad(eva,16).


%REGLAS
pareja(X,Y) :- gusta(X,Y), gusta(Y,X).
mayordeedad(X) :-edad(X,Y), Y<18, maplist(write,[X, ' es menor de edad \n']).
mayordeedad(X) :-edad(X,Y), Y>=18, maplist(write,[X, ' es mayor de edad \n']).

