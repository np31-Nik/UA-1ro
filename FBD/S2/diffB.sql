SELECT a.cod,nombre,marca,pvp
FROM linped l,tv, articulo a
WHERE l.articulo=tv.cod && l.numPedido=1 && tv.cod=a.cod;

SELECT fecha,usuario,articulo,nombre,marca,pvp,importe
FROM pedido p,linped l,tv,articulo a
WHERE l.articulo=tv.cod && tv.cod=a.cod && l.numPedido=1 && l.numPedido=p.numPedido;

SELECT p.cod, p.nombre, p.pvp, a.cod, a.nombre,a.pvp
FROM pack p, articulo a
