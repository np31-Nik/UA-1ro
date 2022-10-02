salario(carlos,2000).
salario(ana,1000).
salario(luis,1500).
salario(eva,2500).

gastos(carlos,1500).
gastos(ana,1000).
gastos(luis,2000).
gastos(eva,500).

%neto(X,Y):- salario(X,S),gastos(X,G),Y is S-G.
%rn:- neto(X,N).....
%

resultadoneto(X,N):- salario(X,S) , gastos(X,G), N is (S-G), N<0,maplist(write,[X,' es derrochador/a \n']).
resultadoneto(X,N):- salario(X,S) , gastos(X,G), N is (S-G), N>0,maplist(write,[X,' es ahorrador/a\n']).
resultadoneto(X,N):- salario(X,S) , gastos(X,G), N is (S-G), N=0,maplist(write,[X,' gasta lo mismo que gana\n']).

