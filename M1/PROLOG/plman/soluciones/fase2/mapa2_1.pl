%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	1
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', '.', '#', '#', '#', '#', '#', '.', '.', ' ', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '.', '.', ' ', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '.', '.', ' ', '.', '#'],
['#', ' ', ' ', ' ', ' ', '#', '#', '#', '#', '.', '.', ' ', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', ' ', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', ' ', ' ', ' ', ' ', '#', '#', '#', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(14, 11).
num_dots(50).
pacman_start(2, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(EID_E1, 'E', mortal, 4, 4, active, enemyBasicMovement, [ appearance(attribs(normal, red, default)) ] ), 
	enemyBasicMovement(init, EID_E1, left-right, ['#']),
	createGameEntity(EID_E2, 'E', mortal, 11, 1, active, enemyBasicMovement, [ appearance(attribs(normal, red, default)) ] ), 
	enemyBasicMovement(init, EID_E2, up-down, ['#']),
	createGameEntity(EID_E3, 'E', mortal, 4, 7, active, enemyBasicMovement, [ appearance(attribs(normal, red, default)) ] ), 
	enemyBasicMovement(init, EID_E3, left-right, ['#']).

norule(_).
norule(_,_,_,_,_).
