%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:40	[STS: 01:20]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
[]]).
map_size(34, 8).
num_dots(96).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'),
	createGameEntity(_, '%', object, 31, 2, inactive, norule, 
			[name(cajas), solid(true), static(false), use_rule(norule),
			description('Unas cajas bloquean el paso'), appearance(attribs(normal, cyan, default))]), 

	createGameEntity(EID_0, 'E', mortal, 7, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 25, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 4, 2, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_5, 'E', mortal, 22, 2, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_6, 'E', mortal, 10, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_8, 'E', mortal, 28, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, left-right, ['#']),
	enemyBasicMovement(init, EID_2, left-right, ['#']),
	enemyBasicMovement(init, EID_3, left-right, ['#', '%']),
	enemyBasicMovement(init, EID_5, left-right, ['#', '%']),
	enemyBasicMovement(init, EID_6, left-right, ['#']),
	enemyBasicMovement(init, EID_8, left-right, ['#']).

norule(_).
norule(_,_,_,_,_).
