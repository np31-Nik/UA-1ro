SELECT marca,COUNT(*)
FROM articulo
GROUP BY marca;

SELECT cesta.articulo, COUNT(*)
FROM cesta,stock
WHERE disponible=0 AND cesta.articulo=stock.articulo
GROUP BY articulo;

SELECT COUNT(*)
FROM articulo
WHERE cod NOT IN (SELECT cod FROM tv)
AND cod NOT IN(SELECT cod FROM objetivo)
AND cod NOT IN(SELECT cod FROM camara)
AND cod NOT IN(SELECT cod FROM pack)
AND cod NOT IN(SELECT cod FROM memoria);

SELECT numPedido,COUNT(linea)
FROM linped
GROUP BY numPedido;

SELECT numPedido,COUNT(linea)
FROM linped
WHERE cantidad>=3
GROUP BY numPedido;

SELECT linped.numPedido,COUNT(linea)
FROM linped,pedido
WHERE fecha < '2010-09-01' AND linped.numPedido=pedido.numPedido
GROUP BY numPedido;

SELECT cod,sum(cantidad),AVG(importe)
FROM articulo,linped
WHERE cod=articulo
GROUP BY cod;

SELECT cod,SUM(cantidad),AVG(importe)
FROM camara,linped
WHERE articulo=cod
GROUP BY cod;

SELECT COUNT(*)
FROM usuario
WHERE apellidos LIKE "Martínez%";

SELECT month(fecha),year(fecha),COUNT(*)
FROM pedido
GROUP BY MONTH(fecha),YEAR(fecha);

SELECT cod,COUNT(DISTINCT numpedido)
FROM articulo,linped
WHERE articulo=cod AND (cod ="A0233" OR cod ="A1085")
GROUP BY cod;

SELECT cod,COUNT(numpedido)
FROM articulo
LEFT JOIN linped ON(cod=articulo)
GROUP BY cod;

SELECT usuario,SUM(pvp)
FROM cesta,articulo
WHERE articulo=cod
GROUP BY usuario;

SELECT usuario,SUM(pvp)
FROM cesta,articulo
WHERE articulo=cod AND pvp IS NOT NULL
GROUP BY usuario
ORDER BY SUM(pvp)
