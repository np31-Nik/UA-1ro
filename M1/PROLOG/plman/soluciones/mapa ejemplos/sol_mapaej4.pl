:-use_module('pl-man-game/main').

dir_Valida(up).
dir_Valida(right).
dir_Valida(down).
dir_Valida(left).

obstaculo('V').
obstaculo('U').

do(move(DIR)):-see(normal,DIR,'.'),dir_Valida(DIR).
do(drop(right)):-see(normal,left,'V'),see(normal,right,' ').
do(get(left)):-see(normal,left,'U').
do(get(left)):-see(normal,left,'V'),see(normal,right,'U').

