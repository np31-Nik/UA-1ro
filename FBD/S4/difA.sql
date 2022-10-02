SELECT cod,nombre
FROM articulo
WHERE marca IS NULL;

SELECT cod,nombre,marca
FROM articulo;

SELECT numPedido,email,apellidos,nombre
FROM pedido join usuario ON(usuario=email);

SELECT apellidos,nombre,numPedido
FROM usuario left JOIN pedido ON(usuario=email);

SELECT articulo.cod,nombre,resolucion,sensor
FROM articulo LEFT JOIN camara ON(articulo.cod=camara.cod);

SELECT articulo.cod,nombre,pvp,objetivo.*
FROM articulo LEFT JOIN objetivo ON(articulo.cod=objetivo.cod);

SELECT cesta.*,nombre,pvp
FROM  cesta LEFT JOIN articulo ON(articulo.cod=cesta.articulo)
WHERE fecha LIKE "2010-%";

SELECT stock.*,resolucion
FROM stock right JOIN camara ON(articulo=cod)
ORDER BY resolucion;

SELECT articulo.cod,nombre,pack
FROM articulo LEFT JOIN ptienea ON (articulo=articulo.cod);

