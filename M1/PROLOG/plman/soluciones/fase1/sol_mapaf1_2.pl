:-use_module('pl-man-game/main').

do(get(up)):-see(normal,up,'a'),not(see(normal,up,'E')).
do(use(left)):-see(normal,left,'|').

do(move(down)):-see(normal,down,'.').
do(move(up)):-see(normal,up,'.').
do(move(left)):-see(normal,left,'.').
do(move(right)):-see(normal,right,'.'),not(see(normal,right,'E')).
do(move(none)):-see(normal,right,'E').
do(move(left)):-see(normal,left,' ').

