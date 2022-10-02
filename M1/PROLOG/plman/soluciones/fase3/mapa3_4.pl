%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa hay varios objetos indeterministas, que 
%%% enumeramos a continuación:
%%% 1) Puerta aritmética: 
%%%    La puerta aritmética de la sala superior izquierda mues-
%%%    tra multiplicaciones(*) o divisiones(/)de forma aleatoria
%%% 2) Pasadizo de acceso a la sala de las llaves aritméticas:
%%%    La pared que une la sala superior izquierda con la sala
%%%    inferior izquierda tiene siempre un pasadizo para poder
%%%    acceder. Sin embargo, este pasadizo puede estar en cual-
%%%    quier parte de esta pared. Es decir, fila 4, columnas 1-5
%%% 3) Llaves aritméticas:
%%%    En la sala de las llaves aritméticas (inferior izquierda)
%%%    aparecen siempre 2 llaves falsas y 1 auténtica (la que 
%%%    indicará el resultado de la operación aritmética). Las
%%%    llaves pueden estar en cualquier parte de la sala, y nun-
%%%    ca aparecerán 2 llaves en el mismo sitio.
%%% 4) Pistola:
%%%    La pistola aparece siempre en uno de los 2 pasillos 
%%%    horizontales que rodean la sala central (arriba o abajo).
%%%    Concretamente, puede estar entre las columnas 9-20 y
%%%    en las filas 1 o 6.
%%%
%%% El resto de elementos en este mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(arithmeticDoor).
load_behaviour(gunBasic).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', '.', '.', '.', '.', '.', ' ', '.', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', ' ', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '#', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(22, 8).
num_dots(85).
pacman_start(1, 2).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_N1, 1, object, 7, 1, inactive, norule, 
			[name(operando1), solid(true), static(true), use_rule(norule),
			description('Operando de la puerta aritmética'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_OP, '*', object, 7, 2, inactive, norule, 
			[name(operador), solid(true), static(true), use_rule(norule),
			description('Operador de la puerta aritmética'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_N2, 2, object, 7, 3, inactive, norule, 
			[name(operando2), solid(true), static(true), use_rule(norule),
			description('Operando de la puerta aritmética'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_GUN, 'l', object, rnd(9,20), rnd([1,6]), inactive, norule, 
			[name(pistola), solid(false), static(false), use_rule(gunBasic),
			description('Pistola con 2 balas'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(EID_0, 'E', mortal, 10, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 18, 4, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	( % Random hole in the wall
		X is random(5)+1,
		setDCellContent(X, 4, ' ')
	),
	enemyBasicMovement(init, EID_0, right-left, ['#']),
	enemyBasicMovement(init, EID_1, left-right, ['#']),
	gunBasic(init, OID_GUN, 2, ['E'], keep),
    arithmeticDoor(init, OID_OP, OID_N1, OID_N2, RES, [operators(['*', '/'])]),
	createGameEntity(RES, object, rnd(1,6), rnd(5,6), inactive, norule, 
			[name(llave_aritmetica), solid(false), static(false), use_rule(arithmeticDoorKey),
			description('Objeto llave para puertas aritmeticas'), appearance(attribs(bold, cyan, default))]), 
	arithmeticDoor(createRandomKeys, OID_OP, 2, location(rnd(1,6), rnd(5, 6)), _,
      [ distributed, add_properties([appearance(attribs(bold, cyan, default))]) ]).

norule(_).
norule(_,_,_,_,_).
