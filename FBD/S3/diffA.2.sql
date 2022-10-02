SELECT nombre
FROM articulo
WHERE pvp BETWEEN 100 AND 300;

SELECT nombre
FROM camara,articulo
WHERE articulo.cod=camara.cod && marca NOT LIKE "S%";

SELECT cod
FROM tv
WHERE panel LIKE "%LCD%" OR panel LIKE "%LED%";