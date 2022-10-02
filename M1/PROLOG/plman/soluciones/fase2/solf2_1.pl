:-use_module('pl-man-game/main').

do(move(up)):-see(normal,up,'.'),see(normal,up-right,'#'),see(normal,up-left,' ').
do(move(left)):-see(normal,left,'.').
do(move(right)):-see(normal,right,'.').
do(move(up)):-see(normal,up,'.').
do(move(down)):-see(normal,down,'.').

do(move(right)):-see(normal,right,' '),see(normal,down,'#').
do(move(left)):-see(normal,left,' ').
do(move(down)):-see(normal,down,' ').

