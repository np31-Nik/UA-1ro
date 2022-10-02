SELECT cod, nombre
FROM articulo
WHERE pvp BETWEEN 400 AND 500;

SELECT cod, nombre
FROM articulo
WHERE pvp IN(415,129,1259,3995);

SELECT codp, nombre
FROM provincia
WHERE nombre NOT IN("Huelva","Sevilla","Asturias","Barcelona");

SELECT codp
FROM provincia
WHERE nombre LIKE "Alicante%";

SELECT cod, nombre, pvp
FROM articulo
WHERE marca LIKE "S%";

SELECT *
FROM usuario
WHERE email LIKE "%@eps%";

SELECT email 
FROM usuario
WHERE codpos NOT IN ("02012","02018","02032");

SELECT nombre
FROM articulo
WHERE nombre LIKE ("%EOS%");

SELECT objetivo.tipo, focal
FROM objetivo
WHERE montura LIKE "Canon%";

SELECT nombre
FROM articulo
WHERE pvp BETWEEN 100 AND 200;


