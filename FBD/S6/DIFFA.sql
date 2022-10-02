SELECT linea,articulo,importe*cantidad total
FROM linped
WHERE numPedido=1;

SELECT COUNT(DISTINCT provincia)
FROM usuario;

SELECT COUNT(*)
FROM usuario;

SELECT COUNT(*)
FROM articulo
WHERE pvp>200;

SELECT SUM(pvp)
FROM articulo,cesta
WHERE usuario="bmm@agwab.com" AND cesta.articulo=cod;

SELECT MAX(pantalla)
FROM tv;

SELECT round(AVG(DISTINCT pvp),2)
FROM articulo;

SELECT MAX(pvp), MIN(pvp),AVG(pvp)
FROM articulo;
