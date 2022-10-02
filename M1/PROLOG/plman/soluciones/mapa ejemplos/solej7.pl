:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

dir_Valida(up).
dir_Valida(right).
dir_Valida(down).
dir_Valida(left).

num_Valid(0).
num_Valid(1).
num_Valid(2).
num_Valid(3).
num_Valid(4).
num_Valid(5).
num_Valid(6).
num_Valid(7).
num_Valid(8).
num_Valid(9).



do1(est1, get(right)):-see(normal,right,NUM),num_Valid(NUM),cambiar(obj1).
do1(est1, get(left)):-see(normal,left,NUM),num_Valid(NUM),cambiar(obj1).
do1(est1, get(up)):-see(normal,up,NUM),num_Valid(NUM),cambiar(obj1).
do1(est1, move(left)):-see(normal,left,'.').
do1(est1, move(right)):-see(normal,right,'.').
do1(est1, move(up)):-see(normal,up,'.').
do1(est1, move(down)):-see(normal,down,'.').
do1(est1, move(left)):-see(normal,left,' ').


do1(obj1, move(down)):-not(see(normal,down,'#')),not(see(normal,down-left,'#')),not(see(normal,down-right,'#')),not(see(normal,down,'+')).
do1(obj1, move(right)):-not(see(normal,right,'#')).
do1(obj1, use(down)):-cambiar(est2).

do1(est2, drop(left)):-havingObject.
do1(est2, move(up)):-cambiar(est1).
