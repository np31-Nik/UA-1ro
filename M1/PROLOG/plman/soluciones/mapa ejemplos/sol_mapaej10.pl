:-use_module('pl-man-game/main').

do(move(none)):-see(normal,down-right,'|').



do(move(up)):-see(normal,up,'.'). 
do(move(down)):-see(normal,down,'.').

do(move(right)):-see(normal,right,'.').
do(move(left)):-see(normal,left,'.').

do(move(none)).
