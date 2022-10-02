:-use_module('pl-man-game/main').

:-dynamic estado/1.
estado(est1).

cambiar(EST):-retractall(estado(_)),assert(estado(EST)).


do(ACT):-estado(EST),do1(EST,ACT).

