SELECT COUNT(*)
FROM stock
WHERE entrega="Descatalogado";

SELECT MAX(pvp)
FROM articulo,stock
WHERE stock.entrega="Próximamente" AND articulo=cod;

SELECT MAX(importe), MIN(importe),AVG(importe)
FROM linped,articulo
WHERE articulo=articulo.cod AND articulo.nombre="Bravia KDL-32EX402";

SELECT SUM(cantidad)
FROM linped,articulo
WHERE articulo=cod AND nombre LIKE "UE22%";

SELECT round(AVG(importe),3)
FROM linped
WHERE linea=4;

SELECT (MAX(importe)-MIN(importe))
FROM linped
WHERE numPedido=30;

SELECT min(nacido)
FROM usuario;

SELECT COUNT(*), COUNT(marca),COUNT(DISTINCT marca)
FROM articulo;

