:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(ini).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

do1(ini, get(left)):-see(normal,left,'l'),cambiar(pistola0).
do1(ini, get(down)):-see(normal,down,'l'),cambiar(pistola0).
do1(ini, get(left)):-see(normal,up,'l'),cambiar(pistola0).

do1(ini, move(down)):-see(normal,down,'.').
do1(ini, move(up)):-see(normal,up,'.').
do1(ini, move(left)):-see(normal,left,'.').


do1(pistola0, move(right)):-see(normal,right,' ').
do1(pistola0, move(up)):-see(normal,up,' ').
do1(pistola0, move(up)):-see(normal,up,'.'),cambiar(pistola).


do1(pistola, get(left)):-see(normal,left,'a'),see(normal,right,'l'), cambiar(llave).
do1(pistola, use(up)):-see(normal,up,'E'),cambiar(tiro1).
do1(pistola, use(down)):-see(normal,down,'E'),cambiar(tiro0izq).
do1(pistola, use(left)):-see(normal,left,'E'),cambiar(tiro0izq).
do1(pistola, drop(right)):-see(normal,left,'a').


do1(pistola, move(up)):-see(normal,up,'.').
do1(pistola, move(down)):-see(normal,down,'.').
do1(pistola, move(left)):-see(normal,left,'.').

do1(tiro0izq, move(down)):-see(normal,down,'.').
do1(tiro0izq, move(down)):-see(normal,down,' ').
do1(tiro0izq, move(none)):-see(normal,up-left,'E').
do1(tiro0izq, move(left)):-see(normal,left,'.'),cambiar(tiro1),write('tiro1').

do1(tiro1, use(up)):-see(normal,up,'E'),cambiar(tiro1izq).
do1(tiro1, use(left)):-see(normal,left,'E'),cambiar(tiro1izq).
do1(tiro1, move(none)).

do1(tiro1izq, move(none)):-see(normal,up-left,'E'),cambiar(tiro2),write('tiro2').
do1(tiro1izq, move(left)):-see(normal,left,'.'),cambiar(tiro2),write('tiro2').

do1(tiro2, use(up)):-see(normal,up,'E'),cambiar(tiro2izq).
do1(tiro2, use(left)):-see(normal,left,'E'),cambiar(tiro2izq).
do1(tiro2, move(none)).

do1(tiro2izq, move(none)):-see(normal,up-left,'E'),cambiar(tiro3),write('tiro3').
do1(tiro2izq, move(left)):-see(normal,left,'.'),cambiar(tiro3),write('tiro3').

do1(tiro3, use(up)):-see(normal,up,'E'),cambiar(tiro3izq).
do1(tiro3, use(left)):-see(normal,left,'E'),cambiar(tiro3izq).
do1(tiro3, move(none)).

do1(tiro3izq, move(none)):-see(normal,up-left,'E'),cambiar(tiro4),write('tiro4').
do1(tiro3izq, move(left)):-see(normal,left,'.'),cambiar(tiro4),write('tiro4').

do1(tiro4, use(up)):-see(normal,up,'E'),cambiar(pistola).
do1(tiro4, use(left)):-see(normal,left,'E'),cambiar(pistola).
do1(tiro4, move(none)).


do1(bajarl, move(down)):-see(normal,left,'#'),see(normal,right,'#'),see(normal,down,' '),cambiar(bajar).
do1(bajarl, move(down)):-see(normal,down,'.').
do1(bajarl, move(down)):-see(normal,down,' ').
do1(bajarl, move(down)):-see(normal,down,'l').
do1(bajarl, move(right)):-see(normal,down,'#'),see(normal,right,' '), cambiar(subirl).
do1(bajarl, move(right)):-see(normal,down,'#'),see(normal,right,'.'), cambiar(subirl).
do1(bajarl, move(right)):-see(normal,down,'#'),see(normal,right,'l'), cambiar(subirl).

do1(subirl, move(up)):-see(normal,up,'.').
do1(subirl, move(up)):-see(normal,up,' ').
do1(subirl, move(up)):-see(normal,up,'l').
do1(subirl, move(right)):-see(normal,up,'#'),see(normal,right,'.'),cambiar(bajarl).
do1(subirl, move(right)):-see(normal,up,'#'),see(normal,right,' '),cambiar(bajarl).
do1(subirl, move(right)):-see(normal,up,'#'),see(normal,right,'l'),cambiar(bajarl).
do1(subirl, move(down)):-see(normal,up,'#'),see(normal,right,'#'),cambiar(bajar).

do1(llave, move(up)):-see(normal,up,'.').
do1(llave, move(down)):-see(normal,down,'.').
do1(llave, move(left)):-see(normal,left,'.').
do1(llave, move(none)):-see(normal,down,'#'),see(normal,left,'#'),cambiar(subirl).



do1(izq,move(down)):-see(normal,down,'.'),see(normal,up,'E').
do1(izq,move(left)):-see(normal,left,'.'),see(normal,up,'E').




do1(bajar,move(down)):-see(normal,down,'.'),see(normal,up,'E').
do1(bajar,move(left)):-see(normal,left,'.'),see(normal,up,'E').
do1(bajar, move(down)):-see(normal,down,'.').
do1(bajar, move(down)):-see(normal,down,' ').
do1(bajar, move(none)):-see(normal,down,'#'),see(normal,left,' '), cambiar(2).
do1(bajar, move(none)):-see(normal,down,'#'),see(normal,left,'.'), cambiar(2).
do1(bajar, move(none)).


do1(2, move(left)):-see(normal,left,'.'),not(see(normal,up-left,'E')),not(see(normal,left,'E')).

do1(2, move(left)):-see(normal,right,'#'),see(normal,up,'#'),cambiar(3),write(3).
do1(2, use(down)):-see(normal,down,'-').
do1(2, move(down)):-see(normal,down,'.').
do1(2, move(right)):-see(normal,right,'.').
do1(2, move(left)):-see(normal,left,' ').
do1(2, move(right)):-see(normal,right,' ').



do1(3, move(up)):-see(normal,up,'.'),cambiar(4).
do1(3, move(down)):-see(normal,down,'.').
do1(3, move(right)):-see(normal,right,'.').

do1(3, move(left)):-see(normal,left,' ').
do1(3, move(up)):-see(normal,up,' ').

do1(4, move(up)):-see(normal,up,'.').
do1(4, move(down)):-see(normal,down,'.'),not(see(normal,down,'E')).
do1(4, move(right)):-see(normal,right,'.'),not(see(normal,down-right,'E')),not(see(normal,right,'E')).
do1(4, move(left)):-see(normal,left,'.').

do1(4, move(right)):-see(normal,right,' ').
do1(4, move(left)):-see(normal,left,' ').





















