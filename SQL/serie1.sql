--Ejercicio 1
SELECT * FROM persona

--Ejercicio 2
SELECT apellido_nombre, fecha_nacimiento FROM persona GO;

--Ejercicio 3
SELECT 4+5*3/2-1 AS resultado_sin_parentesis;
SELECT (4+5)*3/2-1 AS resultado_con_parentesis;

--Ejercicio 4
SELECT importe,
importe * 1.20 AS 'Sin Formato',
ROUND(importe * 1.20, 1) AS 'Redondeado a 1 digito decimal',
ROUND(importe * 1.20,1,1) AS 'Truncado a 1 digito' 
FROM gasto;

--Ejercicio 5
SELECT nombre, poblacion FROM provincia;


--Ejercicio 6
--se repiten los codigo
SELECT provincia_id from edificio;
--No se repiten
SELECT DISTINCT provincia_id FROM edificio;

--Ejercicio 7
SELECT TOP 4 * FROM persona ORDER BY LEFT(apellido_nombre,7) ASC;

--Ejercicio 8
SELECT TOP 4 WITH TIES * FROM persona ORDER BY LEFT(apellido_nombre,7) ASC;

--Ejercicio 9
SELECT TOP 4 WITH TIES * FROM persona ORDER BY (apellido_nombre) ASC;

--Ejercicio 10
SELECT nombre, direccion FROM edificio WHERE provincia_id = 2;

--Ejercicio 11
SELECT nombre, direccion FROM edificio WHERE nombre LIKE 'EDIFICIO-3%';

--Ejercicio 12
SELECT CONCAT (apellido_nombre, ' - ', telefono, ' - ', fecha_nacimiento) AS 'Datos Personales' FROM persona WHERE sexo = 'F';

--Ejercicio 13
SELECT * FROM gasto WHERE importe BETWEEN 10.00 AND 100.0;

--Ejercicio 14
SELECT * FROM PERSONA WHERE YEAR(fecha_nacimiento) BETWEEN 1960 AND 1969 ORDER BY(fecha_nacimiento) ASC;

--Ejercicio 15
SELECT * FROM localidad WHERE provincia_id=1 OR provincia_id=2 ORDER BY (nombre) ASC;

--Ejercicio 16
SELECT * FROM edificio WHERE direccion LIKE '_____N%';

--Ejercicio 17
SELECT TOP 237 * FROM gasto ORDER BY (importe) ASC;

--Ejercicio 18
SELECT TOP 237 WITH TIES * FROM gasto ORDER BY(importe) ASC;

--Ejercicio 19
SELECT importe, CASE WHEN importe <= 10000 THEN importe * 1.15
WHEN importe BETWEEN 10000 AND 20000 THEN importe * 1.05 
ELSE importe * 0.05 END AS 'Importe Calculado' FROM gasto ORDER BY (importe) ASC;

--Ejercicio 20
SELECT COUNT (CASE WHEN estado_civil = 'S' THEN 1 END) AS 'SOLTEROS',
	   COUNT (CASE WHEN estado_civil = 'C' THEN 1 END) AS 'CASADO'
FROM persona; 

--Ejercicio 21
SELECT SUM(importe) AS 'SUMATORIA',
	   COUNT (*) AS 'CANTIDAD',
	   AVG(importe) AS 'PROMEDIO'
FROM gasto;



			