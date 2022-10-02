:-use_module('pl-man-game/main').

do(get(down)):-see(normal,down,'p').

do(move(left)):-see(normal,left,'.').
do(move(up)):-see(normal,up,'.').
do(move(right)):-see(normal,right,'.').

do(move(none)):-see(normal,down-right,'E').
do(move(none)):-see(normal,down,'E').

do(move(down)):-see(normal,down,'.').

do(use(up)):-see(normal,up,'%').
do(use(down)):-see(normal,down,'%').

do(move(left)):-see(normal,left,' ').
do(move(right)):-see(normal,right,' ').
do(move(up)):-see(normal,up,' ').
do(move(down)):-see(normal,down,' ').








