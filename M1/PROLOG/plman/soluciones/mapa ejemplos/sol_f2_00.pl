:-use_module('pl-man-game/main').
%% Alias de predicados
hO(OBJ):-havingObject(appearance(OBJ)).
%% Regla principal que lanza subreglas
do(ACT):-hO(OBJ),do1(OBJ,ACT).
do(ACT):-do1(n,ACT).

do1(n,get(up)):-see(normal,up,'r').
do1(n,get(left)):-see(normal,left,'a').

do1(n,move(right)):-see(normal,right,' ').
do1(n,move(up)):-see(normal,up,' ').

do1(a,drop(left)):-see(normal,up,'r').
do1(a,move(right)):-see(normal,right,' '),see(normal,down,'#').
do1(a,move(left)):-see(normal,left,' ').
do1(a,move(down)):-see(normal,down,' ').
do1(a,use(right)):-see(normal,right,'|').

do1(r,move(right)):-see(normal,right,'.').
do1(r,move(left)):-see(normal,left,'a').
do1(r,move(left)):-see(normal,left,' ').
do1(r,move(up)):-see(normal,up,' ').
do1(r,use(right)):-see(normal,right,'|').
