:-use_module('pl-man-game/main').

do(move(none)):-see(normal,left,'E'),see(normal,right,' ').
do(move(none)):-see(normal,right,'E'),see(normal,left,' ').
do(move(right)):-see(normal,right,'.').
do(move(down)):-see(normal,down,'.').
do(move(left)):-see(normal,left,'.').
do(move(up)):-see(normal,up,'.').

do(move(left)):-see(normal,left,' '),see(normal,up-left,'#'),not(see(normal,up-right,' ')).
do(move(right)):-see(normal,right,' ').
do(move(down)):-see(normal,down,' ').
do(move(up)):-see(normal,up,' ').

