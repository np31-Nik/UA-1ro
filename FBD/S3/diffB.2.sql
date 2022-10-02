SELECT nombre
FROM articulo,cesta
WHERE cod=articulo AND fecha BETWEEN "2010-11-01" AND "2010-12-31";

SELECT distinct numPedido
FROM linped,articulo
WHERE articulo=cod AND pvp>importe;

