:-use_module('pl-man-game/main').

hO(OBJ):-havingObject(appearance(OBJ)).

do(get(right)):-see(normal,right,'a').


do(move(left)):-see(normal,left,'.').

do(move(left)):-see(normal,left,' '),hO('a').
do(use(left)):-see(normal,left,'|'),havingObject.
do(move(right)):-see(normal,right,' ').

