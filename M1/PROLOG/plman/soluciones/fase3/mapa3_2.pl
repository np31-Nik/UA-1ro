%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa aparecen varios objetos indeterministas que 
%%% se detallan a continuación:
%%% 1) Enemigo inferior:
%%%	 El enemigo inferior siempre se encuentra dando vueltas
%%%    a una pared y su comportamiento es determinista. Sin 
%%%    embargo, su posición inicial puede ser cualquiera dentro
%%%    del recorrido que hace. Es decir, puede aparecer en 
%%%    cualquier columna de 6-8 y fila de 5-7, excluyendo la
%%%    posición [7,6], que está ocupada por la pared.
%%% 2) Enemigos superiores: 
%%%    Los enemigos de la parte superior de la pantalla aparecen
%%%    siempre en las mismas columnas, pero pueden variar 
%%%    su fila inicial. Sus respectivos comportamientos son
%%%    siempre los mismos (de arriba a abajo, de pared a pared).
%%%    Concretamente, pueden aparecer en cualquier fila de 1-3,
%%%    y cada uno tiene su propia columna inicial como sigue:
%%%     ENE1: col 5, ENE2: col 6, ENE3: col 7, ENE4: col 8,
%%%     ENE5: col 9.
%%% 3) Pistola:
%%%    La pistola puede aparecer en cualquier parte de la zona 
%%%    inferior derecha. Concretamente, en las columnas 10-13
%%%    y en las filas 5-7.
%%% 4) La llave azul:
%%%    La llave azul puede aparecer en cualquier parte de la zona
%%%    superior izquierda. Concretamente, en las columnas 1-4 y
%%%    en las filas 1-3.
%%%
%%% El resto de objetos en este mapa son deterministas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(gunBasic).
load_behaviour(basicDoorKey).
load_behaviour(enemyBasicMovement).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 12).
num_dots(89).
pacman_start(13, 4).
initMap:- 
	addSolidObject('#'), 
	
	% DOOR-KEY
	createGameEntity(OID_BK, 'a', object, rnd(1,4), rnd(1,3), inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_BD, '-', object, 1, 8, inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(normal, black, cyan))]), 
	basicDoorKey(init, OID_BD, [ 'pl-man':destroyGameEntity(OID_BD) ], [ OID_BK ]),

	% GUN
	createGameEntity(OID_G, 'l', object, rnd(10,13), rnd(5,7), inactive, norule, 
			[name(pistola), solid(false), static(false), use_rule(gunBasic),
			description('Pistola cargada con 5 balas'), appearance(attribs(bold, cyan, default))]), 
	gunBasic(init, OID_G, 5, ['E', 'a','|'], keep),

	% UPSIDE ENEMIES
	createGameEntity(EID_0, 'E', mortal, 5, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 9, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 6, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 8, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_4, 'E', mortal, 7, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	enemyBasicMovement(init, EID_0, down-up, ['#']),
	enemyBasicMovement(init, EID_1, down-up, ['#']),
	enemyBasicMovement(init, EID_2, down-up, ['#']),
	enemyBasicMovement(init, EID_3, down-up, ['#']),
	enemyBasicMovement(init, EID_4, down-up, ['#']),

	% DOWNSIDE ENEMY
	randomBetween(0,7,N),
	nth0(N, [ 6, 7, 8, 8, 8, 7, 6, 6 ], X),
	nth0(N, [ 5, 5, 5, 6, 7, 7, 7, 6 ], Y),
	shiftListLeft([r,r,d,d,l,l,u,u], N, ML),
	createGameEntity(EID_5, 'E', mortal, X, Y, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_5, ML, [ no_repeat_moves ]).

norule(_).
norule(_,_,_,_,_).
