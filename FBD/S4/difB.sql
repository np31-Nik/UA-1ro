SELECT usuario.email,numPedido
FROM usuario JOIN pedido ON(email=usuario);

SELECT numPedido,usuario,apellidos,nombre,localidad.pueblo
FROM pedido JOIN usuario ON(usuario=email) 
JOIN localidad ON(usuario.pueblo=localidad.codm AND usuario.provincia=localidad.provincia);

SELECT numPedido,email,apellidos,usuario.nombre,localidad.pueblo,provincia.nombre
FROM pedido JOIN usuario ON(usuario=email)
JOIN localidad ON(usuario.pueblo=localidad.codm AND usuario.provincia=localidad.provincia)
JOIN provincia ON(usuario.provincia=provincia.codp);

SELECT provincia.nombre,localidad.pueblo
FROM provincia JOIN localidad ON(provincia.codp=localidad.provincia)
WHERE provincia.nombre LIKE "A%"
AND
localidad.pueblo LIKE "B%";

SELECT articulo.*,cesta.*
FROM articulo LEFT join cesta ON(articulo=cod AND YEAR(fecha)=2010);

SELECT cod, nombre,articulo.marca,empresa
FROM articulo LEFT JOIN marca ON(marca.marca=articulo.marca)
ORDER BY marca;

SELECT usuario.*,direnvio.*
FROM usuario left JOIN direnvio ON (direnvio.email=usuario.email AND usuario.nombre LIKE "P%");

SELECT direnvio.*, usuario.*
fROM usuario right JOIN direnvio ON (direnvio.email=usuario.email AND usuario.nombre LIKE "P%");

