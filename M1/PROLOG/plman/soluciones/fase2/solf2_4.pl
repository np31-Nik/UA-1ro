:-use_module('pl-man-game/main').

hO(OBJ):-havingObject(appearance(OBJ)).

do(ACT):-hO(OBJ),do1(OBJ,ACT).
do(ACT):-do1(0,ACT).


do1(0,get(left)):-see(normal,left,'n').
do1(0,get(down)):-see(normal,down,'m').
do1(0,get(down)):-see(normal,down,'a').
do1(0,get(up)):-see(normal,up,'+').
do1(0,get(right)):-see(normal,right,'l').

do1('+',drop(right)):-see(normal,right,'.'),see(normal,left,'E'),see(normal,down,'#').

do1('+',move(left)):-see(normal,left,'.').
do1('+',move(right)):-see(normal,right,'.').
do1('+',move(up)):-see(normal,up,'.').
do1('+',move(down)):-see(normal,down,'.').

do1('+',move(right)):-see(normal,right,' '),see(normal,up,'#').
do1('+',move(down)):-see(normal,down,' '),see(normal,right,'#').


do1('l',use(right)):-see(normal,right,'E').
do1('l',drop(left)):-see(normal,down,'a').

do1('l',move(down)):-see(normal,down,'.').
do1('l',move(up)):-see(normal,up,'.').
do1('l',move(right)):-see(normal,right,'.').
do1('l',move(left)):-see(normal,left,'.').

do1('a',drop(left)):-see(normal,down,'m').
do1('a',use(right)):-see(normal,right,'|').
do1('a',move(right)):-see(normal,right,' '),see(normal,down,' '),see(normal,up,' '),see(normal,down-right,'#'),see(normal,up-right,'#').
do1('a',move(up)):-see(normal,up,'.').
do1('a',move(down)):-see(normal,down,' '),see(normal,right,'#').
do1('a',move(right)):-see(normal,left,'l').
do1('a',move(left)):-see(normal,left,'.').
do1('a',move(down)):-see(normal,down,'.').
do1('a',move(right)):-see(normal,right,'.').


do1('m',drop(right)):-see(normal,left,'n').
do1('m',use(left)):-see(normal,left,'|').
do1('m',move(left)):-see(normal,up,'#'),see(normal,left,' ').
do1('m',move(up)):-see(normal,up,'.').
do1('m',move(left)):-see(normal,left,'a').
do1('m',move(up)):-see(normal,up,' '),not(see(normal,left,'#')).
do1('m',move(down)):-see(normal,down,' '),see(normal,left,'#').
do1('m',move(left)):-see(normal,left,' '),see(normal,up,'#').


do1('n',move(left)):-see(normal,left,'.').
do1('n',move(right)):-see(normal,right,'.').
do1('n',move(up)):-see(normal,up,'.').
do1('n',move(down)):-see(normal,down,'.').
do1('n',move(down)):-see(normal,down,' '),see(normal,left,'#').


do1('n',use(right)):-see(normal,right,'|').
do1('n',move(right)):-see(normal,right,'m').
do1('n',move(right)):-see(normal,right,'a').
do1('n',move(right)):-see(normal,right,' ').
do1('n',move(down)):-see(normal,down,' ').



do1(0,move(up)):-see(normal,up,'.'),see(normal,up-left,'#'),see(normal,right,'.').
do1(0,move(up)):-see(normal,up,'.'),see(normal,down,'#'),see(normal,left,' '),see(normal,right,'.').

do1(0,move(left)):-see(normal,left,'.').
do1(0,move(right)):-see(normal,right,'.').
do1(0,move(up)):-see(normal,up,'.').
do1(0,move(down)):-see(normal,down,'.').

do1(0,move(right)):-see(normal,right,' '),see(normal,down,'#').
do1(0,move(up)):-see(normal,up,' ').
do1(0,move(left)):-see(normal,left,' ').
do1(0,move(down)):-see(normal,down,' ').
do1(0,move(right)):-see(normal,right,' ').






