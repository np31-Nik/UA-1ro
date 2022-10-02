SELECT tv.cod, nombre,resolucion
FROM tv, articulo
WHERE tv.cod=articulo.cod && pantalla NOT BETWEEN 22 AND 42;

SELECT tv.cod,nombre
FROM tv,articulo
WHERE panel LIKE "%LED%" && pvp BETWEEN 0 AND 1000 && tv.cod=articulo.cod;

SELECT distinct articulo.cod, nombre
FROM ptienea,articulo
WHERE pack=cod;

SELECT cesta.articulo
FROM cesta,stock
WHERE stock.entrega="descatalogado" && cesta.articulo=stock.articulo;

SELECT camara.cod, nombre,pvp
FROM camara,articulo
WHERE articulo.cod=camara.cod && tipo LIKE "%compacta%";

SELECT cod,nombre,pvp-importe
FROM articulo,linped
WHERE cod=articulo AND pvp<>importe;

SELECT numPedido,fecha,nombre,apellidos
FROM pedido,usuario
WHERE email=usuario AND apellidos LIKE "%MARTINEZ%";

SELECT marca
FROM marca
WHERE marca NOT IN(SELECT marca 
FROM articulo, tv
WHERE articulo.cod=tv.cod);

SELECT email
FROM usuario
WHERE dni LIKE "%B" OR dni LIKE "%L" OR dni LIKE "%P";

SELECT distinct provincia.nombre
FROM provincia,usuario,pedido
WHERE usuario=email AND codp=provincia;

