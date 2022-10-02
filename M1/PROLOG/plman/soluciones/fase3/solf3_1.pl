:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

do1(est1, use(up)):-see(normal,up,'*'), cambiar(est2).
do1(est1, get(right)):-see(normal,right,8).
do1(est1, get(left)):-see(normal,left,8).

do1(est1, move(right)):-see(normal,right,'.').
do1(est1, move(left)):-see(normal,left,'.').

do1(est1, move(up)):-see(normal,up,'.'),see(normal,right,1),see(normal,down,' '),see(normal,left,'#').

do1(est1, move(right)):-see(normal,right,4).
do1(est1, move(right)):-see(normal,right,2).
do1(est1, move(right)):-see(normal,right,1).
do1(est1, move(left)):-see(normal,left,1).
do1(est1, move(left)):-see(normal,left,2).
do1(est1, move(left)):-see(normal,left,4).




do1(est1, move(up)):-see(normal,up,'.').
do1(est1, move(down)):-see(normal,down,'.').

do1(est1, move(up)):-see(normal,up,' ').
do1(est1, move(left)):-see(normal,left,' ').







do1(est2, move(right)):-see(normal,right,'.'),see(normal,up,'#').
do1(est2, move(down)):-see(normal, down, '.').
do1(est2, move(left)):-see(normal,left,'.').
do1(est2, move(up)):-see(normal,up,'.').
do1(est2, move(up)):-see(normal,up,' ').



