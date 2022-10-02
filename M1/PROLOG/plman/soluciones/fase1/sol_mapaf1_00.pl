:-use_module('pl-man-game/main').

do(move(right)):-see(normal,right,'.').
do(move(left)):-see(normal,left,'.').
do(move(up)):-see(normal,up,'.').
do(move(down)):-see(normal,down,'.').

do(move(left)):-see(normal,left,' ').
do(move(down)):-see(normal,down,' ').
