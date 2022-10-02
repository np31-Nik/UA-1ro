:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).


do1(est1, move(left)):-see(normal,left,'.'),cambiar(subir).



do1(subir, move(up)):-see(normal,up,'.').
do1(subir, move(down)):-see(normal,up,'#'),cambiar(bajar).
do1(subir, move(down)):-see(normal,up,'?'),cambiar(derechaS).


do1(bajar, move(down)):-see(normal,down,'.').
do1(bajar, move(down)):-see(normal,down,' ').
do1(bajar, move(left)):-see(normal,left,'.'),see(normal,down,'#'),cambiar(subir).
do1(bajar, move(up)):-see(normal,left,'#'),see(normal,down,'#'),cambiar(derechaB).
do1(bajar, move(up)):-see(normal,left,'?'),see(normal,up,' '),cambiar(est1).
do1(bajar, move(up)):-see(normal,down,'?'),see(normal,up,' '),cambiar(derechaB).

do1(derechaS, move(right)):-see(normal,right,' ').
do1(derechaS, move(down)):-see(normal,down,' ').
do1(derechaS, move(right)):-see(normal,right,'.'),cambiar(subir2).

do1(derechaB, move(right)):-see(normal,right,' ').
do1(derechaB, move(up)):-see(normal,up,' ').
do1(derechaB, move(right)):-see(normal,right,'.'),cambiar(subir2).

do1(derecha, move(right)):-see(normal,right,'.'),cambiar(subir2).

do1(bajar2, move(down)):-see(normal,down,'.').
do1(bajar2, move(down)):-see(normal,down,' ').
do1(bajar2, move(right)):-see(normal,right,'.'),see(normal,down,'#'),cambiar(subir2).
do1(bajar2, move(up)):-see(normal,right,'?'),see(normal,up,' '),cambiar(derecha).
do1(bajar2, move(down)):-see(normal,down,'?'),cambiar(final).
do1(bajar2, move(up)):-see(normal,up,' '), cambiar(izqTP).
do1(bajar2, move(none)).

do1(subir2, move(up)):-see(normal,up,'.').
do1(subir2, move(down)):-see(normal,up,'#'),cambiar(bajar2).
do1(subir2, move(up)):-see(normal,up,'?'),cambiar(final).
do1(subir2, move(none)).

do1(izqTP, move(left)):-see(normal,left,' ').
do1(izqTP, move(up)):-see(normal,up,' ').
do1(izqTP, move(up)):-see(normal,up,'?'),cambiar(final).
do1(izqTP, move(down)):-see(normal,down,' '), cambiar(bajar2).
do1(izqTP, move(none)).

do1(final, move(right)):-see(normal,right,' ').
do1(final, move(right)):-see(normal,right,'.'), cambiar(flechas1).
do1(final, move(none)).

%%%
do1(flechas1, move(none)):-see(normal,down,'<').
do1(flechas1, move(none)):-see(normal,down-right,'<').
do1(flechas1, move(left)):-see(normal,left,'.').
do1(flechas1, move(down)):-see(normal,down,'.').
do1(flechas1, move(left)):-see(normal,left,' ').
do1(flechas1, move(right)):-see(normal,left,'#'),not(see(normal,right,'<')),cambiar(flechas2).
do1(flechas1, move(up)):-cambiar(flechas2).

do1(flechas2, move(right)):-see(normal,left,'#').
do1(flechas2, move(down)):-see(normal,down,'.'),not(see(normal,down,'<')),not(see(normal,down-right,'<')),not(see(normal,down-left,'>')),not(see(normal,down,'>')).
do1(flechas2, move(right)):-see(normal,right,'.').
do1(flechas2, move(down)):-see(normal,down,' '),see(normal,right,'#'),cambiar(f1).
do1(flechas2, move(up)).

do1(f1, move(down)):-see(normal,left,'#'),see(normal,right,'#').
do1(f1, move(down)):-see(normal,down,'.'),not(see(normal,down,'E')),not(see(normal,down-left,'E')),not(see(normal,down-right,'E')),cambiar(f0).
do1(f1, move(none)).

do1(f0, move(left)):-see(normal,left,' '),cambiar(f1).
do1(f0, move(up)):-see(normal,up,' ').
do1(f0, move(left)):-see(normal,left,'.'),cambiar(f2).

do1(f2, move(down)):-see(normal,down,' '),not(see(normal,down,'E')),not(see(normal,down-right,'E')),not(see(normal,down-left,'E')).
do1(f2, move(down)):-see(normal,down,'.'),not(see(normal,down,'E')),not(see(normal,down-right,'E')),not(see(normal,down-left,'E')).
do1(f2, move(up)):-see(normal,right,'E'),cambiar(fup).
do1(f2, move(right)):-see(normal,right,'.'),cambiar(fup).
do1(f2, move(up)):-see(normal,left,'E'),see(normal,down,'E').
do1(f2, move(none)).


do1(fup, move(up)):-see(normal,up,' '),not(see(normal,up,'E')),not(see(normal,up-right,'E')),not(see(normal,up-left,'E')).
do1(fup, move(right)):-see(normal,up,'#'),cambiar(f2).
do1(fup, move(none)).
































