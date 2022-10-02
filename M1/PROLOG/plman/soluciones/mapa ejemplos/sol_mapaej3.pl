:-use_module('pl-man-game/main').
dir_Valida(up).
dir_Valida(right).
dir_Valida(down).
dir_Valida(left).

do(move(DIR)):-see(normal,DIR,'.'),dir_Valida(DIR),
	writeln('Me he comido un coco').
do(get(DIR)):-see(normal,DIR,'a'),dir_Valida(DIR).
do(use(DIR)):-see(normal,DIR,'-'),dir_Valida(DIR).

