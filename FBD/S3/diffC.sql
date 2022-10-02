SELECT nombre, marca, resolucion
FROM camara,articulo
WHERE articulo.cod=camara.cod AND camara.cod NOT IN(SELECT articulo
FROM linped);

SELECT articulo.cod,nombre,tipo,marca
FROM articulo,camara
WHERE articulo.cod=camara.cod AND (marca LIKE "%Nikon%" OR marca LIKE "%LG" OR marca LIKE "%Sigma%");

SELECT nombre
FROM tv,articulo
WHERE tv.cod=articulo.cod and pantalla > (SELECT pantalla FROM tv WHERE cod="A0686");

SELECT articulo.nombre
FROM articulo,cesta,usuario
WHERE usuario=email AND articulo.cod=articulo AND provincia IN (SELECT codp FROM provincia WHERE nombre LIKE "Valencia%" or nombre like "Alicante%");