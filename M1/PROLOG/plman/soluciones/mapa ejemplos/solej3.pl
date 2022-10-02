:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

do1(est1, move(down)):-see(normal,down,' ').
do1(est1, move(down)):-see(normal,down,'.').
do1(est1, move(left)):-see(normal,down,'#'),cambiar(izq).

do1(izq, move(left)):-see(normal,left,' ').
do1(izq, move(left)):-see(normal,left,'.').
do1(izq, move(right)):-see(normal,left,'#'),cambiar(der).

do1(izq2, move(left)):-see(normal,left,' ').
do1(izq2, move(left)):-see(normal,left,'.').
do1(izq2, move(up)):-see(normal,left,'#'),cambiar(der).





do1(der, move(right)):-see(normal,right,'.').
do1(der, move(right)):-see(normal,right,' ').
do1(der, move(up)):-see(normal,right,'#'),cambiar(izq2).
