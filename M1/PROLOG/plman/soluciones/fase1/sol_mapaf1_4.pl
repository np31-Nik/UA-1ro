:-use_module('pl-man-game/main').

do(move(up)):-see(normal,up,'.'),see(normal,left,'E').
do(move(left)):-see(normal,left,'.').
do(move(right)):-see(normal,right,'.').
do(move(down)):-see(normal,down,'.').
do(move(up)):-see(normal,up,'.'),not(see(normal,up-right,'E')).

do(move(up)):-see(normal,up,' ').
do(move(right)):-see(normal,right,' ').
do(move(down)):-see(normal,down,' ').
do(move(left)):-see(normal,left,' ').

