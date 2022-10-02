SELECT codp, nombre
FROM provincia
WHERE nombre NOT IN("Huelva","Sevilla","Asturias","Barcelona");

SELECT distinct articulo
FROM pedido,linped
WHERE (fecha LIKE "2010-03-__%") AND linped.numPedido=pedido.numPedido
ORDER BY articulo asc


