:-use_module('pl-man-game/main').

do(move(up)):-see(normal,up,'.').
do(move(down)):-see(normal,down,'.').
do(move(right)):-see(normal,right,'.').
do(get(down)):-see(normal,down,'l').
do(use(right)):-see(normal,right,'E').
do(move(up)):-see(normal,up,' ').
do(move(right)):-see(normal,right,' ').
