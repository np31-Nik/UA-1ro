:-use_module('pl-man-game/main').

dir_Valida(right).
dir_Valida(up).
dir_Valida(down).
dir_Valida(left).

do(move(DIR)):-see(normal,DIR,'.'),dir_Valida(DIR).
