:-use_module('pl-man-game/main').

dir_Valida(up).
dir_Valida(right).
dir_Valida(left).
dir_Valida(down).

do(move(DIR)) :- see(normal,DIR,'.'),dir_Valida(DIR).
