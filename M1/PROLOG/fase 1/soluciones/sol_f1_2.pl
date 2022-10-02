:-use_module('pl-man-game/main').

do(get(left)):-see(normal,left,'{').
do(use(right)):-see(normal,right,'*').
do(move(right)):-see(normal,right,'+').

do(move(down)):-see(normal,down,'.').
do(move(up)):-see(normal,up,'.').
do(move(left)):-see(normal,left,'.').
do(move(right)):-see(normal,right,'.').

do(move(left)):-see(normal,left,' ').
do(move(up)):-see(normal,up,' ').
do(move(down)):-see(normal,down,' ').
do(move(right)):-see(normal,right,' ').

