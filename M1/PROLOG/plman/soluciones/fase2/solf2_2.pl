:-use_module('pl-man-game/main').
hO(OBJ):-havingObject(appearance(OBJ)).

do(ACT):-hO(OBJ),do1(OBJ,ACT).
do(ACT):-do1(n,ACT).

do1(n,get(right)):-see(normal,right,'a').
do1(n,use(left)):-see(normal,left,'|').

do1(n,move(down)):-see(normal,down,'.'),see(normal,left,'#'),see(normal,right,' '),see(normal,down-left,'#').
do1(a,move(right)):-see(normal,right,'.'),see(normal,left,'#'),see(normal,up,'.').
do1(a,move(left)):-see(normal,left,'.'),see(normal,right,'#'),see(normal,up,'.').
do1(n,move(up)):-see(normal,up,'.').
do1(n,move(down)):-see(normal,down,'.').
do1(n,move(left)):-see(normal,left,'.').
do1(n,move(right)):-see(normal,right,'.').


do1(n,move(up)):-see(normal,up,' ').
do1(n,move(right)):-see(normal,right,' ').
do1(n,move(left)):-see(normal,left,' ').



do1(n,move(down)):-see(normal,down,' ').
