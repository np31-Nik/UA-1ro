:-use_module('pl-man-game/main').

hO(OBJ):-havingObject(appearance(OBJ)).
do(ACT):-hO(OBJ),do1(OBJ,ACT).
do(ACT):-do1(n,ACT).

do1(º,move(right)):-see(normal,right,'r').
do1(º,move(down)):-see(normal,down,' ').
do1(º,move(right)):-see(normal,right,' '),not(see(normal,down-right,'#')).

do1(º,drop(left)):-see(normal,up-left,'#'),see(normal,down,'#'),see(normal,down-right,'#'),see(normal,down-left,'#').
do1(º,move(left)):-see(normal,down,'#'),see(normal,left,' ').

do1(a,use(left)):-see(normal,left,'|').
do1(a,drop(left)):-see(normal,right,'r').

do1(a,move(right)):-see(normal,right,'.'),see(normal,left,'.'),see(normal,up-left,'#'),see(normal,down-left,'#'),see(normal,up,'.').
do1(a,move(down)):-see(normal,down,'.').
do1(a,move(left)):-see(normal,left,'.').
do1(a,move(right)):-see(normal,right,'.').

do1(a,move(up)):-see(normal,up,'.').



do1(r,move(left)):-see(normal,up-left,'a').
do1(r,use(left)):-see(normal,left,'|').
do1(r,drop(right)):-see(normal,left,'º').
do1(r,move(right)):-see(normal,right,'.').
do1(r,move(up)):-see(normal,up,'.'),see(normal,down,'.'),see(normal,up-right,' '),see(normal,up-left,' ').
do1(r,move(left)):-see(normal,left,'.'),see(normal,down,'#').
do1(r,move(down)):-see(normal,down,'.').
do1(r,move(up)):-see(normal,up,'.').
do1(r,move(left)):-see(normal,left,'.').
do1(r,move(right)):-see(normal,right,'.').

do1(r,move(right)):-see(normal,left,'#'),see(normal,up,'#'),see(normal,right,' ').
do1(r,move(up)):-see(normal,up-left,'#'),see(normal,up,' '),see(normal,right,' ').
do1(r,move(up)):-see(normal,up-left,'.'),see(normal,up,' '),see(normal,right,' ').
do1(r,move(down)):-see(normal,down,' ').
do1(r,move(left)):-see(normal,left,' ').
do1(r,move(right)):-see(normal,right,' ').

do1(n,get(left)):-see(normal,left,'º'),not(see(normal,right,' ')).
do1(n,move(right)):-see(normal,left,'º'),see(normal,right,' ').
do1(n,get(right)):-see(normal,right,'r').
do1(n,get(down)):-see(normal,down,'a').


do1(n,move(down)):-see(normal,left,'E'),see(normal,up,'#').
do1(n,move(down)):-see(normal,up,'E'),not(see(normal,down,'#')).

do1(n,move(left)):-see(normal,up-left,'v'),see(normal,left,'.'),not(see(normal,up-left,'|')).
do1(n,move(left)):-see(normal,up-left,'v'),see(normal,left,' ').
do1(n,move(right)):-see(normal,right,'.'),see(normal,up-right,'.'),see(normal,down,'#'),see(normal,down-right,'#'),see(normal,down-left,'#'),see(normal,left,'.'),see(normal,up-left,'.').

do1(n,move(none)):-see(normal,down-right,'^'),see(normal,right,'|').

do1(n,move(down)):-see(normal,down-left,'E'),see(normal,down,' '),see(normal,down-right,'#').
do1(n,move(none)):-see(normal,left,'.'),see(normal,up-left,'|'),see(normal,down,'#').
do1(n,move(none)):-see(normal,left,'|'),see(normal,down,'#').

do1(n,move(right)):-see(normal,up,'#'),see(normal,up-right,'#'),see(normal,up-left,'#'),see(normal,down,'.'),see(normal,right,'.').
do1(n,move(right)):-see(normal,up,'#'),see(normal,up-right,'|'),see(normal,up-left,'#'),see(normal,down,'.'),see(normal,right,'.').
do1(n,move(none)):-see(normal,right,'|'),see(normal,down,'.').
do1(n,move(down)):-see(normal,down,'.').
do1(n,move(up)):-see(normal,up,'.').
do1(n,move(left)):-see(normal,left,'.').
do1(n,move(right)):-see(normal,right,'.').


do1(n,move(none)):-see(normal,left,'*').
do1(n,move(left)):-see(normal,left,' '),see(normal,down-right,'#'),see(normal,down,'#').
do1(n,move(up)):-see(normal,up,' ').
do1(n,move(right)):-see(normal,right,' ').
do1(n,move(left)):-see(normal,left,' ').
do1(n,move(down)):-see(normal,down,' ').



