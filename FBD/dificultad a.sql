SELECT cod, nombre, pvp FROM tiendaonline.articulo
WHERE marca IS NULL;

SELECT cod, nombre, pvp,marca FROM tiendaonline.articulo
WHERE pvp IS NULL AND marca='Sigma';

SELECT email, nombre, apellidos, telefono
FROM tiendaonline.usuario
WHERE nombre='Santiago' OR nombre='Wenceslao' OR nombre='Sergio';

SELECT email, nombre, apellidos, telefono
FROM tiendaonline.usuario
WHERE (nombre='Santiago' OR nombre='Wenceslao' OR nombre='Sergio') AND telefono IS NOT null