:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(izq).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).



do(ACT):-estado(EST),do1(EST,ACT).

do1(izq, use(left)):-see(normal,left,'F'),havingObject.
do1(izq, use(right)):-see(normal,right,'F'),havingObject.
do1(izq, use(up)):-see(normal,up,'F'),havingObject.
do1(izq, use(down)):-see(normal,down,'F'),havingObject.

do1(izq, get(left)):-see(normal,left,'l'),not(havingObject).
do1(izq, get(right)):-see(normal,right,'l'),not(havingObject).
do1(izq, get(up)):-see(normal,up,'l'),not(havingObject).
do1(izq, get(down)):-see(normal,down,'l'),not(havingObject).

do1(der, use(left)):-see(normal,left,'F'),havingObject.
do1(der, use(right)):-see(normal,right,'F'),havingObject.
do1(der, use(up)):-see(normal,up,'F'),havingObject.
do1(der, use(down)):-see(normal,down,'F'),havingObject.

do1(der, get(left)):-see(normal,left,'l'),not(havingObject).
do1(der, get(right)):-see(normal,right,'l'),not(havingObject).
do1(der, get(up)):-see(normal,up,'l'),not(havingObject).
do1(der, get(down)):-see(normal,down,'l'),not(havingObject).

do1(izq2, use(left)):-see(normal,left,'F'),havingObject.
do1(izq2, use(right)):-see(normal,right,'F'),havingObject.
do1(izq2, use(up)):-see(normal,up,'F'),havingObject.
do1(izq2, use(down)):-see(normal,down,'F'),havingObject.

do1(izq2, get(left)):-see(normal,left,'l'),not(havingObject).
do1(izq2, get(right)):-see(normal,right,'l'),not(havingObject).
do1(izq2, get(up)):-see(normal,up,'l'),not(havingObject).
do1(izq2, get(down)):-see(normal,down,'l'),not(havingObject).

do1(der2, use(left)):-see(normal,left,'F'),havingObject.
do1(der2, use(right)):-see(normal,right,'F'),havingObject.
do1(der2, use(up)):-see(normal,up,'F'),havingObject.
do1(der2, use(down)):-see(normal,down,'F'),havingObject.

do1(der2, get(left)):-see(normal,left,'l'),not(havingObject).
do1(der2, get(right)):-see(normal,right,'l'),not(havingObject).
do1(der2, get(up)):-see(normal,up,'l'),not(havingObject).
do1(der2, get(down)):-see(normal,down,'l'),not(havingObject).




do1(izq, move(left)):-see(normal,left,'.').
do1(izq, move(left)):-see(normal,left,' ').
do1(izq, move(none)):-not(see(normal,up,'#')),cambiar(der).
do1(izq, move(down)):-see(normal,up,'#'),see(normal,left,'#'),see(normal,up-left,'#'),cambiar(der2).
do1(izq, move(left)):-see(normal,left,'l').

do1(der, move(right)):-see(normal,right,'.').
do1(der, move(right)):-see(normal,right,' ').
do1(der, move(up)):-not(see(normal,up,'#')),cambiar(izq).
do1(der, move(right)):-see(normal,right,'l').

do1(der2, move(right)):-see(normal,right,'.').
do1(der2, move(right)):-see(normal,right,' ').
do1(der2, move(down)):-see(normal,down,'.'),cambiar(izq2).

do1(izq2, move(left)):-see(normal,left,'.').
do1(izq2, move(left)):-see(normal,left,' ').
do1(izq2, move(down)):-see(normal,down,'.'),cambiar(der2).


