ayuntamiento(mario,alcalde).
ayuntamiento(juan,asesor).
ayuntamiento(ana,concejalurbanismo).
ayuntamiento(luis,concejalurbanismo).
ayuntamiento(benito,concejalfiesta).
ayuntamiento(clara,concejalfiesta).
ayuntamiento(sonia,concejalfiesta).

sueldo(concejalfiesta,2000).
sueldo(concejalurbanismo,2500).
sueldo(alcalde,).
sueldo(asesor,2200).



corrupto(X):- ayuntamiento(X,T),sueldo(T,S),
