SELECT dni, email, nombre, apellidos
FROM tiendaonline.usuario
WHERE provincia='33';

SELECT distinct pv.*
FROM usuario u, provincia pv
WHERE u.provincia=codp
ORDER BY nombre;

SELECT email, 'no tiene telefono'
FROM usuario u, provincia pv
WHERE u.provincia=codp && u.telefono IS NULL;

SELECT cod
FROM articulo
WHERE articulo.marca IS NULL;

SELECT articulo.cod, articulo.nombre, pvp
FROM pack, articulo
WHERE pack.cod=articulo.cod;

SELECT cod,nombre,marca
FROM articulo,ptienea
WHERE articulo.cod=ptienea.articulo;

SELECT cod,nombre,marca,pvp
FROM articulo,linped
WHERE linped.numPedido=1 && linped.articulo=articulo.cod;

SELECT cod,sensor,pantalla
FROM camara
WHERE pantalla IS NOT NULL
ORDER BY cod DESC;


