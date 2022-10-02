:-use_module('pl-man-game/main').


do(move(none)):-see(normal,down-right,'E'),see(normal,left,'#'),see(normal,up,' '),see(normal,right,' ').

do(move(left)):-see(normal,left,' '),see(normal,down,'#'),see(normal,right,' '),see(normal,up,' ').

do(move(right)):-see(normal,right,'.'),see(normal,down,'.'),see(normal,up,'#'),see(normal,left,' ').

do(move(left)):-see(normal,right,'.'),see(normal,left,'.'),see(normal,up,' '),see(normal,up-left,'#'),see(normal,up-right,'#').

do(move(up)):-see(normal,up,'.'),see(normal,up-right,'#'),see(normal,up-left,'#'),see(normal,left,'.').

do(move(right)):-see(normal,up,'#'),see(normal,down,'#'),see(normal,right,' '),see(normal,left,' '),see(normal,up-right,' '),see(normal,up-left,' ').


do(move(down)):-see(normal,down,'.').
do(move(up)):-see(normal,up,'.').
do(move(left)):-see(normal,left,'.').
do(move(right)):-see(normal,right,'.').

do(move(up)):-see(normal,up,' '),see(normal,down,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),see(normal,right,'#'),see(normal,up-right,'#'),see(normal,down-right,'#').

do(move(up)):-see(normal,up,' '),see(normal,down,' '),see(normal,up-left,'.').

do(move(down)):-see(normal,down,' ').
do(move(up)):-see(normal,up,' ').
do(move(left)):-see(normal,left,' ').
do(move(right)):-see(normal,right,' ').


