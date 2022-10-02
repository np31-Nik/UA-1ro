%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-dynamic d_enemydir/2.

map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', '#', '#', '#', '#', ' ', '#', '#', '.', '.', '.', '#', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '#', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', ' ', ' ', '#', '#', '#', '#', ' ', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
[]]).
map_size(28, 6).
num_dots(41).
pacman_start(1, 2).
initMap:- 
	addSolidObject('#'), 
	retractall(d_enemydir(_, _)),
	createGameEntity('E', mortal, 7, 1, active, enemyrule,  [ appearance(attribs(normal, red, default)) ]), 
	createGameEntity('E', mortal, 19, 2, active, enemyrule, [ appearance(attribs(normal, red, default)) ]).

% rule to move enemies up-down from wall to wall
opositedir(up, down).
opositedir(down, up).

enemyrule(EID):-
	not(d_enemydir(EID,_)),
	assert(d_enemydir(EID, down)), !.
enemyrule(EID):-
	d_enemydir(EID, DIR),
	see(EID, normal, DIR, OBJ),
	(OBJ \= '#' 
	 -> assert(d_doAction(EID, move(DIR)))
	 ; 
	  opositedir(DIR, NewDIR),
	  retractall(d_enemydir(EID, _)),
	  assert(d_enemydir(EID, NewDIR))
	), !.
