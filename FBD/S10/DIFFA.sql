SELECT nombre
FROM articulo,camara
WHERE tipo LIKE "%compacta%visor%electrónico%" AND articulo.cod=camara.cod
UNION
SELECT nombre
FROM articulo,tv
WHERE panel LIKE "%CRT%" AND articulo.cod=tv.cod;

SELECT usuario.nombre,email
FROM usuario,provincia
WHERE provincia.nombre="Asturias" AND codp=provincia
AND email NOT IN(SELECT email FROM direnvio);

SELECT nombre
FROM articulo, ptienea
WHERE cod=articulo;

SELECT distinct stock.articulo
FROM stock,cesta,linped
WHERE stock.articulo=cesta.articulo AND linped.articulo=stock.articulo;

SELECT articulo
FROM cesta
UNION
SELECT articulo
FROM linped;

SELECT distinct u1.apellidos
FROM usuario u1, usuario u2
WHERE u1.apellidos=u2.apellidos AND u1.email<>u2.email;

SELECT 














