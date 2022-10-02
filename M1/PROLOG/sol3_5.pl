:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(llaveA).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).

do(ACT):-estado(EST),do1(EST,ACT).

num_valid(0).
num_valid(1).
num_valid(2).
num_valid(3).
num_valid(4).
num_valid(5).
num_valid(6).
num_valid(7).
num_valid(8).
num_valid(9).


do1(llaveA,drop(up)):-see(normal,right,'#'),havingObject,cambiar(llave1).
do1(llaveA,use(down)):-see(normal,down,'_'),havingObject.
do1(llaveA, get(down)):-see(normal,down,'c').
do1(llaveA, get(right)):-see(normal,right,'c').
do1(llaveA,move(down)):-see(normal,down,' ').

do1(llave1,get(down)):-see(normal,down,NUM),num_valid(NUM),cambiar(abrir).
do1(llave1,get(right)):-see(normal,right,NUM),num_valid(NUM),cambiar(abrir).
do1(llave1,move(down)):-see(normal,down,' ').
do1(llave1,move(down)):-see(normal,down,'c').
do1(llave1, move(left)):-see(normal,left,' ').


do1(abrir,move(up)):-see(normal,right,'#'),cambiar(abrir2).
do1(abrir,move(up)).

do1(abrir2,use(right)):-see(normal,right,'-'),cambiar(verif).
do1(abrir2, move(right)):-see(normal,right,' ').
do1(abrir2,move(up)):-see(normal,up,' ').


do1(verif,drop(up)):-havingObject.
do1(verif,move(left)):-see(normal,right,'-'),cambiar(llave1).
do1(verif,move(right)):-see(normal,right,' ').
do1(verif,move(right)):-see(normal,right,'.'),cambiar(abajo).


do1(abajo,move(down)):-see(normal,down,'.').
do1(abajo,move(right)):-see(normal,right,'.'),cambiar(arq0).


do1(arq0, move(right)):-see(normal,right,'.').
do1(arq0,move(down)):-see(normal,down,'.').
do1(arq0,move(left)):-see(normal,left,'.'),cambiar(arq2),writeln(arq2).

do1(arq2,move(right)):-see(normal,right,'.').
do1(arq2,move(up)):-see(normal,up,' '),not(see(normal,up-left,'>')).
do1(arq2,move(left)):-see(normal,left,'.').
do1(arq2,move(left)):-see(normal,left,' '),cambiar(arq3),writeln(arq3).


do1(arq3,move(down)):-see(normal,down,'.'),not(see(normal,down-left,'>')).
do1(arq3,move(left)):-see(normal,left,' ').
do1(arq3,move(right)):-see(normal,right,'.').
do1(arq3,move(up)):-see(normal,left,')'),cambiar(arriba).
do1(arq3,move(left)):-see(normal,left,'.'),cambiar(arq2),writeln(arq2).


do1(arriba,move(up)):-see(normal,right,'#'),cambiar(esp),writeln(esp).
do1(arriba,move(right)):-see(normal,right,'.'),cambiar(p2a),writeln(p2a).
do1(arriba,move(up)):-see(normal,up,'.').
do1(arriba,move(up)):-see(normal,up,' ').

do1(esp,move(none)):-see(normal,right,'E'),cambiar(p2a),writeln(p2a).
do1(esp,move(none)).

do1(p2a,move(up)):-see(normal,right,'#'),see(normal,down,'#'),cambiar(v2a),writeln(v2a).
do1(p2a,move(right)):-not(see(normal,right,'#')),see(normal,left,'E').
do1(p2a,move(down)):-see(normal,right,'#'),see(normal,up,'#'),cambiar(v2b),writeln(v2b).
do1(p2a,move(right)):-see(normal,right,' ').
do1(p2a, move(up)):-see(normal,up,' '),not(see(normal,up-right,'E')),not(see(normal,up,'E')),not(see(normal,up-left,'E')).
do1(p2a,move(up)):-see(normal,up,'.'),not(see(normal,up-right,'E')),not(see(normal,up,'E')),not(see(normal,up-left,'E')).
do1(p2a,move(down)):-not(see(normal,down-right,'E')),not(see(normal,down,'E')),not(see(normal,down-left,'E')),not(see(normal,down,'#')),cambiar(p2b).
do1(p2a,move(right)):-see(normal,right,'.'),cambiar(p2b),writeln(p2b).

do1(p2b,move(right)):-not(see(normal,right,'#')),see(normal,left,'E').
do1(p2b,move(down)):-see(normal,down,'.'),not(see(normal,down-right,'E')),not(see(normal,down,'E')),not(see(normal,down-left,'E')).
do1(p2b,move(down)):-see(normal,down,' '),not(see(normal,down-right,'E')),not(see(normal,down,'E')),not(see(normal,down-left,'E')).
do1(p2b,move(right)):-see(normal,right,'.'),cambiar(p2a),writeln(p2a).

do1(v2a,get(up)):-see(normal,up,'o').
do1(v2a,get(right)):-see(normal,right,'o').
do1(v2a,get(left)):-see(normal,left,'o').
do1(v2a,move(up)):-see(normal,up,'.').
do1(v2a,move(left)):-see(normal,left,'.').
do1(v2a,move(left)):-see(normal,left,' ').
do1(v2a,move(down)):-see(normal,down,'.').
do1(v2a,move(right)):-see(normal,right,' '),cambiar(p3).

do1(v2b,move(none)):-see(normal,up,'E').
do1(v2b,move(up)):-see(normal,up-left,'E').
do1(v2b,move(none)):-see(normal,down,'E'),cambiar(v2b2),writeln(v2b2).
do1(v2b,move(none)).



do1(v2b2, move(down)):-see(normal,down-left,'E').
do1(v2b2,move(up)):-see(normal,left,' '),cambiar(v2a),writeln(v2a).
do1(v2b2,move(left)):-see(normal,left,'.').


do1(p3,get(up)):-see(normal,up,'o').
do1(p3,get(right)):-see(normal,right,'o').
do1(p3,get(down)):-see(normal,down,'o').

do1(p3,move(none)):-see(normal,down,'.'),see(normal,up,' '),cambiar(tirar).
do1(p3,move(none)):-see(normal,down,'.'),see(normal,up,'.'),cambiar(tirar).

do1(p3,move(up)):-see(normal,up,'.').
do1(p3,move(down)):-see(normal,down,'.').
do1(p3,move(right)):-see(normal,right,'.').

do1(tirar,move(none)):-see(normal,down,'E').
do1(tirar,move(none)):-see(normal,down-right,'E').
do1(tirar,move(none)):-see(normal,down-left,'E').
do1(tirar,use(down)):-see(normal,down,'.'),cambiar(p3g).

do1(p3g,move(up)):-see(normal,up,'.').
do1(p3g,move(down)):-see(normal,down,'.').
do1(p3g,move(right)):-see(normal,right,'.').
do1(p3g,move(left)):-see(normal,left,' '),cambiar(p4),writeln(p4).

do1(p4,move(left)):-see(normal,left,' '),not(see(normal,up-left,'E')),not(see(normal,down,'.')).
do1(p4,move(down)):-see(normal,down,'.'),not(see(normal,down,'E')),not(see(normal,down-right,'E')),not(see(normal,down-left,'E')),cambiar(d).

do1(d,move(down)):-see(normal,down,'.'),see(normal,down-left,'.'),cambiar(p5).
do1(d,move(down)):-see(normal,down,'.').
do1(d,move(down)):-see(normal,down,' ').

do1(p4,move(down)):-see(normal,down,' '),cambiar(p5).

do1(p5,move(left)):-see(normal,left,'.').
do1(p5,move(right)):-see(normal,right,'.').
do1(p5,move(right)):-see(normal,right,' ').
do1(p5,move(down)):-see(normal,down,'.'),cambiar(izq).

do1(izq,move(left)):-see(normal,left,'.').
do1(izq,move(down)):-see(normal,down,'.').
do1(izq,move(right)):-see(normal,right,'.').





















