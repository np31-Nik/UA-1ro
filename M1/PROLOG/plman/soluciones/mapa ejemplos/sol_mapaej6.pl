:-use_module('pl-man-game/main').

do(move(up)):-see(normal,up,'.').
do(move(right)):-see(normal,right,'.').
do(move(left)):-see(normal,left,' ').
do(move(down)):-not(see(normal,down,'#')).

