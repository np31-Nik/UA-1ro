:-use_module('pl-man-game/main').

hO(OBJ):-havingObject(appearance(OBJ)).


do(ACT):-hO(OBJ),do1(OBJ,ACT).
do(ACT):-do1(n,ACT).


do1(r,move(up)):-see(normal,up,'.'),see(normal,down,'#'),see(normal,up-right,'.'),see(normal,right,'.'),see(normal,up-right,'.').


do1(r,use(left)):-see(normal,left,'|'),not(see(normal,up,'.')).
do1(r,move(up)):-see(normal,up,'.'),see(normal,down-left,'|').
do1(r,move(right)):-see(normal,right,'.').
do1(r,move(left)):-see(normal,left,'.').
do1(r,move(down)):-see(normal,down,'.').
do1(r,move(up)):-see(normal,up,'.').


do1(r,move(down)):-see(normal,down,' '),see(normal,left,'#').
do1(r,move(left)):-see(normal,left,' '),see(normal,up-left,'#').
do1(r,move(up)):-see(normal,up,' ').
do1(r,move(down)):-see(normal,down,' ').
do1(r,move(left)):-see(normal,left,' ').
do1(r,move(right)):-see(normal,right,' ').




do1(n,get(right)):-see(normal,right,'r').

do1(n,move(right)):-see(normal,right,'.').
do1(n,move(left)):-see(normal,left,'.').
do1(n,move(down)):-see(normal,down,'.').
do1(n,move(up)):-see(normal,up,'.').
