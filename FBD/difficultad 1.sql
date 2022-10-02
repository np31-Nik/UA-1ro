SELECT email,nombre, apellidos
FROM tiendaonline.usuario 
ORDER BY apellidos desc, nombre DESC;

SELECT * FROM tiendaonline.pack;

SELECT articulo,importe FROM tiendaonline.linped
WHERE numPedido=1;

SELECT distinct panel FROM tiendaonline.tv
WHERE pantalla<=21;

SELECT cod,nombre,pvp,marca FROM tiendaonline.articulo
WHERE pvp>=350 AND pvp<=450 ORDER BY pvp desc