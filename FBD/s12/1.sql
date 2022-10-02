SELECT DATEDIFF(
(SELECT MAX(fecha) FROM pedido),
(SELECT MIN(fecha) FROM pedido))
dias;

