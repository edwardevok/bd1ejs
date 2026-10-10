--Ejercicio 1
SELECT persona_id, apellido_nombre, fecha_nacimiento 
FROM persona
WHERE MONTH(fecha_nacimiento) % 2 = 0;

--Ejercicio 2
SELECT edificio_id, nombre, direccion
FROM edificio
WHERE direccion LIKE '[0-9]%';

--Ejercicio 3
SELECT *
FROM persona
WHERE MONTH(fecha_nacimiento) = MONTH(GETDATE());

--Ejercicio 4
SELECT persona_id, apellido_nombre, telefono, 
LEN(apellido_nombre) AS long_ayn
FROM persona 
WHERE LEN(apellido_nombre) BETWEEN 20 AND 25
ORDER BY long_ayn DESC;

--Ejercicio 5
IF OBJECT_ID('gastos_mayores') IS NOT NULL DROP TABLE gastos_mayores;

SELECT * 
INTO gastos_mayores
FROM gasto
WHERE gasto.importe > 50000;

SELECT * FROM gastos_mayores

--Ejercicio 6
SELECT administrador_id, 
	CASE vive_ahi 
		WHEN 'S' THEN 'Residente'
		WHEN 'N' THEN 'No residente'
		ELSE 'Sin dato'
	END
AS condicion_residencia
FROM administrador;

--Ejercicio 7
SELECT persona_id, apellido_nombre
FROM persona
WHERE apellido_nombre LIKE '%LL%' OR apellido_nombre LIKE '%RR%';

--Ejercicio 8
SELECT *
FROM GASTO
WHERE DATEPART(WEEKDAY, fecha_pago) IN (1,7);

--Ejercicio 9 
SELECT gasto_id, fecha_pago, importe,
DATENAME(WEEKDAY, fecha_pago) AS dia_pago
FROM GASTO
WHERE MONTH(fecha_pago) BETWEEN 1 AND 3 AND importe > 20000 AND DATEPART(WEEKDAY, fecha_pago) NOT IN (1,7);

--Ejercicio 10
SELECT *
FROM persona
WHERE DATEDIFF(year,fecha_nacimiento, GETDATE()) = 30;

--O TAMBIEN VALE
--Ejercicio 10
SELECT *
FROM persona
WHERE YEAR(GETDATE()) - YEAR(fecha_nacimiento) = 30;



