SELECT marca, COUNT(*) articulos
FROM articulo
WHERE marca IS nOT null
GROUP BY marca
HAVING COUNT(*)<150;

SELECT dni, nombre, apellidos, email, COUNT(numPedido) pedidos
FROM usuario,pedido
WHERE usuario=email
GROUP BY dni,nombre,apellidos,email
HAVING COUNT(numPedido)>1;

SELECT pedido.numPedido,usuario,SUM(importe*cantidad)
FROM pedido,linped
WHERE pedido.numPedido=linped.numPedido
GROUP BY pedido.numpedido,usuario
HAVING SUM(importe*cantidad)>4000;

SELECT pedido.numPedido,usuario,SUM(cantidad)
FROM pedido,linped
WHERE pedido.numPedido=linped.numPedido
GROUP BY pedido.numpedido,usuario
HAVING SUM(cantidad)>10;

SELECT pedido.numPedido,usuario,COUNT(DISTINCT articulo)
FROM pedido,linped
WHERE pedido.numPedido=linped.numPedido
GROUP BY pedido.numpedido,usuario
HAVING COUNT(DISTINCT articulo)>4;

SELECT nombre,COUNT(*)
FROM provincia
GROUP BY nombre
HAVING COUNT(*)>1;

SELECT pueblo,COUNT(*)
FROM localidad
GROUP BY pueblo
HAVING COUNT(*)>1;

SELECT codp,nombre,COUNT(*)
FROM provincia,localidad
WHERE localidad.provincia=provincia.codp
GROUP BY codp,nombre
HAVING COUNT(*)>100;

SELECT usuario,SUM(cantidad)
FROM tv,linped,pedido
WHERE cod=articulo && linped.numPedido=pedido.numPedido
GROUP BY usuario
HAVING SUM(cantidad)>2;

SELECT codp,provincia.nombre,COUNT(*)
FROM provincia,usuario
WHERE codp=provincia
GROUP BY codp,provincia.nombre
HAVING COUNT(*)>50;

SELECT codp,provincia.nombre,ifnull(SUM(cantidad),0)
FROM provincia
	LEFT JOIN usuario ON (usuario.provincia=codp)
	LEFT JOIN pedido ON (email=usuario)
	LEFT JOIN linped ON (pedido.numPedido=linped.numPedido)
GROUP BY codp,provincia.nombre;

SELECT articulo.cod,articulo.nombre
FROM articulo,pedido,linped
WHERE  pedido.numPedido=linped.numPedido &&
 linped.articulo=articulo.cod && usuario='acm@colegas.com'
 GROUP BY articulo.cod,articulo.nombre
 HAVING COUNT(DISTINCT pedido.numPedido)=
 				(SELECT COUNT(*) FROM pedido WHERE usuario='acm@colegas.com');

SELECT marca.marca,COUNT(marca.marca)
FROM marca
LEFT JOIN articulo ON (articulo.marca=marca.marca)
GROUP BY marca
HAVING COUNT(articulo.marca)<150;



