
--A. Escriba la consulta en SQL que devuelva el nombre del proyecto y sus productos correspondientes 
--del proyecto premia cuyo código es 1
SELECT P.NOMBRE AS NombreProyecto, PROD.DESCRIPCION AS NombreProducto
FROM PROYECTO P
INNER JOIN PRODUCTO_PROYECTO PP ON P.PROYECTO = PP.PROYECTO
INNER JOIN PRODUCTO PROD ON PP.PRODUCTO = PROD.PRODUCTO
WHERE P.PROYECTO = 1

--B. Escriba una consulta SQL que devuelva los distintos mensajes que hay, 
--indicando a qué proyecto y producto pertenecen.
SELECT M.COD_MENSAJE, P.NOMBRE AS NombreProyecto, PROD.DESCRIPCION AS NombreProducto
FROM MENSAJE M
INNER JOIN PROYECTO P ON M.PROYECTO = P.PROYECTO
INNER JOIN PRODUCTO PROD ON M.PRODUCTO = PROD.PRODUCTO;

--C. Escriba una consulta SQL que devuelva los distintos mensajes que hay, 
--indicando a qué proyecto y producto pertenecen. 
--Pero si el mensaje está en todos los productos de un proyecto, 
--en lugar de mostrar cada producto, debe mostrar el nombre del proyecto 
--y un solo producto que diga “TODOS”.
SELECT
M.COD_MENSAJE,
P.NOMBRE AS NombreProyecto,
CASE
WHEN PP.CantidadProductos = PM.CantidadMensajes THEN 'TODOS'
ELSE PROD.DESCRIPCION
END AS NombreProducto
FROM MENSAJE M
INNER JOIN PROYECTO P ON M.PROYECTO = P.PROYECTO
INNER JOIN PRODUCTO PROD ON M.PRODUCTO = PROD.PRODUCTO
INNER JOIN (SELECT PROYECTO, COUNT(*) AS CantidadProductos FROM PRODUCTO_PROYECTO GROUP BY PROYECTO) PP ON P.PROYECTO = PP.PROYECTO
INNER JOIN (SELECT PROYECTO, PRODUCTO, COUNT(*) AS CantidadMensajes FROM MENSAJE GROUP BY PROYECTO, PRODUCTO) PM ON P.PROYECTO = PM.PROYECTO AND PROD.PRODUCTO = PM.PRODUCTO;