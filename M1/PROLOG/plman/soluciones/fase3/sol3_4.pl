:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est0).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).

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
op_valid(*).
op_valid('/').


do(ACT):-estado(EST),do1(EST,ACT).

do1(est0, move(down)):-see(normal,down,'.').
do1(est0,move(up)):-see(normal,up,' '),cambiar(est1).

do1(est1, get(left)):-see(normal,left,NUM),num_valid(NUM),cambiar(llave1).
do1(est1, move(up)):-see(normal,up,'.').
do1(est1, move(right)):-see(normal,right,'.').
do1(est1, move(left)):-see(normal,left,'.').
do1(est1, move(down)):-see(normal,down,'.').
do1(est1, move(down)):-see(normal,down,' '),cambiar(d).
do1(est1 ,move(left)):-see(normal,left,' ').

do1(d, move(down)):-cambiar(kleft).


do1(kleft, move(left)):-not(see(normal,left,'#')).
do1(kleft, move(up)):-see(normal,down,'#'),see(normal,left,'#'),cambiar(llaves).
do1(kleft, move(right)):-see(normal,left,'#'),cambiar(kright).

do1(kright, move(right)):-not(see(normal,right,'#')).
do1(kright, move(down)):-not(see(normal,down,'#')),cambiar(kleft).

do1(llaves, get(left)):-see(normal,left,NUM),num_valid(NUM),cambiar(llave1).
do1(llaves, get(right)):-see(normal,right,NUM), num_valid(NUM),cambiar(llave1).
do1(llaves, get(down)):-see(normal,down,NUM), num_valid(NUM),cambiar(llave1).
do1(llaves, move(right)):-not(see(normal,right,'#')).

do1(llave1, use(right)):-see(normal,right,OP), op_valid(OP), cambiar(verif).
do1(llave1, move(down)):-see(normal,down-right,OP),op_valid(OP).
do1(llave1, move(up)):-see(normal,up,' ').
do1(llave1, move(right)):-see(normal,right,' ').
do1(llave1, move(right)):-see(normal,right,NUM),num_valid(NUM).
do1(llave1, move(up)):-see(normal,up,NUM),num_valid(NUM).
do1(llave1, move(left)):-cambiar(salir).

do1(salir, move(up)):-see(normal,up,' '),cambiar(llave1).
do1(salir, move(left)):-not(see(normal,left,'#')).

do1(verif, drop(down)):-see(normal,right,' '),cambiar(der).
do1(verif, drop(down)):-see(normal,right,OP), op_valid(OP),cambiar(cambio).

do1(cambio, drop(down)):-havingObject.
do1(cambio, move(down)):-see(normal,down,' '),see(normal,down-left,'#'),cambiar(d2).
do1(cambio, move(down)):-not(see(normal,down,'#')).
do1(cambio, move(left)):-see(normal,left,' ').

do1(d2, move(down)):-cambiar(id2).

do1(id2, move(left)):-not(see(normal,left,'#')).
do1(id2, move(none)):-cambiar(llaves).


do1(der, get(up)):-see(normal,up,'l').
do1(der, get(right)):-see(normal,right,'l').
do1(der, move(right)):-see(normal,right,' ').
do1(der, move(right)):-see(normal,right,'.').
do1(der, move(up)):-see(normal,up,'.').
do1(der, move(down)):-see(normal,down,'.'), cambiar(abajo).

do1(abajo, get(down)):-see(normal,down,'l').
do1(abajo, move(down)):-see(normal,down,'.').
do1(abajo, move(none)):-see(normal,down,'#'), cambiar(izq).

do1(izq, get(left)):-see(normal,left,'l').
do1(izq, move(left)):-see(normal,left,'.').
do1(izq, move(up)):-see(normal,up,'.').
do1(izq, move(up)):-see(normal,up,' ').
do1(izq, move(right)):-see(normal,right,' '),see(normal,down-right,'#'),not(see(normal,down,'.')).
do1(izq, move(right)):-see(normal,right,' '),see(normal,down,'#').
do1(izq, move(right)):-see(normal,right,' '),see(normal,down-left,'#').
do1(izq, move(down)):-see(normal,down,'.'), cambiar(pistola1).


do1(pistola1, use(down)):-see(normal,down,'E'),cambiar(dp).
do1(pistola1, move(none)).

do1(dp,move(left)):-see(normal,left,'.').
do1(dp, move(down)):-cambiar(pistolaL).

do1(pistolaL, use(down)):-see(normal,down,'E'),cambiar(pistola2).
do1(pistolaL, move(left)):-see(normal,left,'.').
do1(pistolaL, move(right)):-see(normal,right,'.').
do1(pistolaL, move(right)):-see(normal,right,' ').
do1(pistolaL, move(none)).

do1(pistola2, move(left)):-see(normal,left,'.').
do1(pistola2, move(right)):-see(normal,right,'.').
do1(pistola2, move(down)):-see(normal,down,'.').
do1(pistola2, move(right)):-see(normal,right,' ').




