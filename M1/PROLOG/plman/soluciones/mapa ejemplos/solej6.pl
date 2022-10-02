:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

do1(est1, move(right)):-see(normal,up-right,'#'),see(normal,down-right,'#'),cambiar(cllaveR).
do1(est1, move(right)):-see(normal,right,' '),not(see(normal,down-right,'|')),not(see(normal,down-left,'|')).
do1(est1, move(none)).

do1(cllaveR, get(right)):-see(normal,right,'r'),cambiar(llaveR).
do1(cllaveR, get(up)):-see(normal,up,'r'),cambiar(llaveRup).
do1(cllaveR, get(down)):-see(normal,down,'r'),cambiar(llaveRdown).
do1(cllaveR, move(up)):-see(normal,up,'.').
do1(cllaveR, move(down)):-see(normal,down,'.').
do1(cllaveR, move(up)):-see(normal,up,'m').
do1(cllaveR, move(down)):-see(normal,down,'m').
do1(cllaveR, move(up)):-see(normal,up,'a').
do1(cllaveR, move(down)):-see(normal,down,'a').
do1(cllaveR, move(up)):-see(normal,up,' ').
do1(cllaveR, move(down)):-see(normal,down,' ').
do1(cllaveR, move(right)).

do1(llaveRup, move(left)):-see(normal,left,' '),cambiar(llaveR).
do1(llaveRup, move(down)).

do1(llaveRdown, move(left)):-see(normal,left,' '),cambiar(llaveR).
do1(llaveRdown, move(up)).

do1(llaveR, move(left)):-see(normal,left,' '),not(see(normal,down-left,'|')), not(see(normal,up-left,'|')).
do1(llaveR, move(left)):-see(normal,left,'.'),cambiar(abrirR).
do1(llaveR, move(none)).

do1(abrirR, use(left)):-see(normal,left,'|'),cambiar(abrirR2).
do1(abrirR, move(up)):-see(normal,up,'.').
do1(abrirR, move(left)):-see(normal,left,'.').

do1(abrirR2, move(right)):-not(havingObject),cambiar(cllaveA).
do1(abrirR2, move(left)):-see(normal,left,'.').
do1(abrirR2, move(down)):-see(normal,down-left,'|'),cambiar(abrirR).
do1(abrirR2, move(down)):-see(normal,down,'.').

