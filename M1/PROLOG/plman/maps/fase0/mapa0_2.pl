%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	2  (T)
%%% PT:	00:10	[STS: 00:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map([['#', '#', '#'],
['#', ' ', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', ' ', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', '.', '#'],
['#', '#', '#']]).
map_size(3, 9).
num_dots(5).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity('T', object, 1, 4, inactive, norule, 
	                 data(movil, not_solid, static, norule, 'telefono movil')).
norule(_).
