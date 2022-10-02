:-use_module('pl-man-game/main').


do(move(up)):-see(normal,up,'.').
do(move(right)):-see(normal,right,'.'),not(see(normal,down-right,'E')),not(see(normal,up-right,'E')).

do(move(none)):-see(normal,left,'E').
do(move(none)):-see(normal,right,'E').

do(move(none)):-see(normal,down-left,'E').
do(move(none)):-see(normal,up-right,'E').

do(move(left)):-see(normal,left,' '),not(see(normal,down-left,'E')),not(see(normal,right,'.')).

do(move(down)):-see(normal,down,'.').
do(move(down)):-see(normal,down,' ').

