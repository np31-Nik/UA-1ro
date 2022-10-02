%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2
%%% PT:	00:07	[STS: 00:21]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', ' ', ' ', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '#', '#', '#', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '#', '#', '#', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '#', '#', '#', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', ' ', ' ', ' ', ' ', ' ', '.', '#', '.', ' ', ' ', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(13, 15).
num_dots(49).
pacman_start(6, 2).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('*', object, 6, 1, inactive, norule, 
			[ name(puerta), solid(true), static(true), use_rule(norule), 
			  description('Puerta giratoria bloqueada.'), appearance(attribs(bold, cyan, default)) ]),
	createGameEntity('{', object, 1, 13, inactive, norule, 
			[ name(llave), solid(false), static(false), use_rule(llaveUsoRule), 
			  description('Llave de plata.'), appearance(attribs(bold, cyan, default)) ]).

llaveUsoRule(LlaveId,_, X, Y, _):-
      entityLocation(PtaEID,X,Y,'*'),
	changeEntityAppearance(PtaEID,'+',_),
	makeObjectNotSolid(PtaEID),
	changeObjectName(PtaEID,puerta_abierta,puerta),
	destroyGameEntity(LlaveId),
	msgWindowWriteln('Puerta giratoria desbloqueada!'), !.
llaveUsoRule(_,_, _, _, _):-
	msgWindowWriteln('No puedo usar la llave asi!'), !.

norule(_).
