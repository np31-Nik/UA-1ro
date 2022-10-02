SELECT articulo.nombre,pvp
FROM articulo,stock
WHERE cod=articulo and disponible=(select MIN(disponible) FROM stock);

SELECT linped.numPedido,fecha,nombre,apellidos
FROM linped,pedido,usuario
WHERE linped.numPedido=pedido.numPedido and usuario= usuario.email AND importe*cantidad= (SELECT MAX(importe*cantidad) FROM linped);