:-use_module('pl-man-game/main').
do(drop(up)):-see(normal,up-left,'E'),havingObject.
do(move(right)):-see(normal,right,' '),see(normal,down,'#'),havingObject.
do(move(up)):-see(normal,up-left,'%').
do(move(left)):-see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),see(normal,down,'#').


do(get(right)):-see(normal,right,'%').
do(move(down)):-see(normal,left,'E'),see(normal,right,'.'),see(normal,up-right,'.'),see(normal,down-right,'.').
do(move(right)):-see(normal,up-right,'E'),see(normal,up,'.'),see(normal,right,'.').
do(move(left)):-see(normal,left,' '),see(normal,up-left,'.'),see(normal,up,'E').
do(move(right)):-see(normal,right,'.'),see(normal,down,'.'),see(normal,down-right,'E'),see(normal,up,'#').
do(move(up)):-see(normal,right,'E'),see(normal,up,' '),see(normal,down,'#').


do(move(left)):-see(normal,left,'.').
do(move(up)):-see(normal,up,'.').
do(move(down)):-see(normal,down,'.').
do(move(right)):-see(normal,right,'.').

do(move(down)):-see(normal,down,' ').
do(move(right)):-see(normal,right,' ').
do(move(left)):-see(normal,left,' ').
do(move(up)):-see(normal,up,' ').





