%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:30	[STS: 02:00]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(gunBasic).
load_behaviour(basicDoorKey).
load_behaviour(enemyFollower).
load_behaviour(mineExplosion).
load_behaviour(enemyBasicMovement).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '#', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', ' ', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', ' ', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(41, 7).
num_dots(167).
pacman_start(3, 3).
initMap:- 
	addSolidObject('#'), 

	% MINE
	createGameEntity(OID_MN, '+', object, 1, 1, active, mine, 
			[name(mina), solid(false), static(false), use_rule(norule),
			description('Mina que explota nada mas ser depositada en el suelo'), appearance(attribs(bold, cyan, default))]), 
	mine(init, OID_MN, 1, 1, [ no_destroy(['.']) ]),

	% GUN
	createGameEntity(OID_G, 'l', object, 11, 1, inactive, norule, 
			[name(colt_42), solid(false), static(false), use_rule(gunBasic),
			description('Revolver colt42 con 6 balas'), appearance(attribs(bold, cyan, default))]),
	gunBasic(init, OID_G, 6, ['E'], keep),
 
	% KEYS
	createGameEntity(OID_BK, 'a', object, 20, 5, inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_OK, 'n', object, 22, 1, inactive, norule, 
			[name(llave_naranja), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta naranja'), appearance(attribs(normal, yellow, default))]), 
	createGameEntity(OID_MK, 'm', object, 29, 5, inactive, norule, 
			[name(llave_magenta), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta magenta'), appearance(attribs(normal, magenta, default))]), 
	% DOORS
	createGameEntity(OID_MD, '|', object, 23, 1, inactive, norule, 
			[name(puerta_magenta), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave magenta'), appearance(attribs(normal, black, magenta))]), 
	createGameEntity(OID_BD, '|', object, 28, 4, inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(normal, black, cyan))]), 
	createGameEntity(OID_OD, '|', object, 30, 4, inactive, norule, 
			[name(puerta_naranja), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave naranja'), appearance(attribs(normal, black, yellow))]), 
	basicDoorKey(init, OID_MD, [ 'pl-man':destroyGameEntity(OID_MD) ], [ OID_MK ]),
	basicDoorKey(init, OID_BD, [ 'pl-man':destroyGameEntity(OID_BD) ], [ OID_BK ]),
	basicDoorKey(init, OID_OD, [ 'pl-man':destroyGameEntity(OID_OD) ], [ OID_OK ]),

	% FIRST ENEMY
	createGameEntity(EID_4, 'E', mortal, 7, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	entitySequentialMovement(init, EID_4, [ u,u,l,d,d,d,d,l,u,u,u,u,r,d,d,d,d,r,u,u ], [ no_repeat_moves ]),

	% STATIC ENEMY
	createGameEntity(EID_8, 'E', mortal, 21, 4, active, norule, [appearance(attribs(normal, red, default))]), 

	% FOLLOWER GHOSTS
	createGameEntity(EID_1, 'F', mortal, 34, 1, active, enemyFollower, [appearance(attribs(bold, magenta, default))]), 
	createGameEntity(EID_7, 'F', mortal, 38, 3, active, enemyFollower, [appearance(attribs(bold, magenta, default))]), 
	createGameEntity(EID_9, 'F', mortal, 35, 5, active, enemyFollower, [appearance(attribs(bold, magenta, default))]),
	enemyFollower(init, EID_1, ['@'], [up, down, left, right], [delay(1)]),
	enemyFollower(init, EID_7, ['@'], [up, down, left, right], [delay(1)]),
	enemyFollower(init, EID_9, ['@'], [up, down, left, right], [delay(1)]),

	% 5 ENEMIES
	createGameEntity(EID_0, 'E', mortal, 16, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 15, 2, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 17, 2, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_5, 'E', mortal, 14, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_6, 'E', mortal, 18, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, down-up, ['#']),
	enemyBasicMovement(init, EID_2, down-up, ['#']),
	enemyBasicMovement(init, EID_3, down-up, ['#']),
	enemyBasicMovement(init, EID_5, down-up, ['#']),
	enemyBasicMovement(init, EID_6, down-up, ['#']).
norule(_).
norule(_,_,_,_,_).
