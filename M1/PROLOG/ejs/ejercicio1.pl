poblacion(alicante,1934127).
poblacion(castellon,604344).
poblacion(valencia,2578719).

superficie(alicante,5816).
superficie(castellon,6632).
superficie(valencia,10763).


densidadpoblacion(X) :-poblacion(X,Y), superficie(X,Z), D is Y/Z, maplist(write,['la densidad de poblacion de ',X,' es ',D]).








