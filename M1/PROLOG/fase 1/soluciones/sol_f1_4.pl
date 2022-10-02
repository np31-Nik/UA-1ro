:-use_module('pl-man-game/main').


do(get(up)):-see(normal,up,'a').
do(use(up)):-see(normal,up,'/').

do(move(down)):-see(normal,down,'.'),see(normal,down-left,'.').
do(move(down)):-see(normal,down,'.'),see(normal,down-left,'#'),see(normal,down-right,'#'),see(normal,up,'#').

do(move(down)):-see(normal,down,' '),see(normal,up,'.'),see(normal,up-left,'.'),see(normal,right,'#'),see(normal,left,'#'),see(normal,up-right,'#'),see(normal,down-left,'.').

do(move(up)):-see(normal,up,'.').

do(move(left)):-see(normal,left,'.'),see(normal,down,'#'),see(normal,right,' '),see(normal,up-right,'#').

do(move(right)):-see(normal,right,'.').
do(move(left)):-see(normal,left,'.').
do(move(down)):-see(normal,down,'.').



do(move(up)):-see(normal,up,' ').
do(move(left)):-see(normal,left,' '),see(normal,down-right,'#').
do(move(right)):-see(normal,right,' ').

do(move(down)):-see(normal,down,' ').


