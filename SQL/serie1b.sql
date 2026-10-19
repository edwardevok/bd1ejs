USE base_consorcio_2025;
GO

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

--Ejercicio 11
SELECT persona_id,
	   LOWER(TRIM(apellido_nombre)) AS nombre_minuscula,
	   apellido_nombre
FROM persona;

--Ejercicio 12
SELECT nombre,
	   LEFT(nombre,4) AS prefijo,
	   LEFT(direccion,10) AS direccion_corta
FROM edificio;

--Ejercicio 13
SELECT persona_id, apellido_nombre, telefono
FROM persona
WHERE LEFT(telefono,2) != 37;

--Ejercicio 14
SELECT zona_id, nombre,
       UPPER(SUBSTRING(nombre,1,1)) + LOWER(SUBSTRING(nombre,2,LEN(nombre))) AS nombre_formateado
FROM zona;

--Ejercicio 15
SELECT gasto_id, importe,
	   ROUND(importe * 1.125,2) AS importe_ajustado
FROM gasto;

--Ejercicio 16
SELECT gasto_id, importe,
	   ROUND(ABS(importe),1) AS importe_absoluto
FROM gasto;

--Ejercicio 17
SELECT gasto_id, fecha_pago,
	   YEAR(fecha_pago) AS anio,
	   MONTH(fecha_pago) AS mes,
	   importe
FROM gasto;

--Ejercicio 18
SELECT persona_id, apellido_nombre,
       DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS edad
FROM persona;

--Ejercicio 19
SELECT gasto_id, fecha_pago,
       FORMAT(fecha_pago, 'dd/MM/yyyy') AS fecha_pago_formateada,
	   importe
FROM gasto;

--Ejercicio 20
SELECT gasto_id,
	   'Periodo ' + CONVERT(VARCHAR(20), periodo) + ' - Importe $' + CONVERT(VARCHAR(20), importe) AS descripcion_formateada
FROM gasto;

--Ejercicio 21
SELECT tipo_gasto_id,
       COUNT(*) AS cantidad,
	   SUM(importe) AS total_importe
FROM gasto
GROUP BY tipo_gasto_id;

--Ejercicio 22
SELECT tipo_gasto_id,
	   COUNT(*) AS cantidad,
	   MIN(importe) AS minimo,
	   MAX(importe) AS maximo,
	   AVG(importe) AS promedio, 
	   SUM(importe) AS total
FROM gasto
GROUP BY tipo_gasto_id;

--Ejercicio 23
SELECT periodo,
       SUM(importe) AS total_periodo,
	   AVG(importe) AS promedio_periodo
FROM gasto
GROUP BY periodo;

--Ejercicio 24	
SELECT periodo, tipo_gasto_id,
       COUNT(*) AS cantidad,
	   SUM(importe) AS total
FROM gasto
GROUP BY periodo, tipo_gasto_id;

--Ejercicio 25
SELECT periodo
FROM gasto
GROUP BY periodo
HAVING SUM(importe) > 5000000;

--Ejercicio 26
SELECT periodo
FROM gasto
WHERE importe > 4000
GROUP BY periodo 
HAVING AVG(importe) > 25000;

--Ejercicio 27 
SELECT
YEAR(fecha_pago) AS anio_pago,
SUM(importe) AS total_anual
FROM gasto
GROUP BY YEAR(fecha_pago);

--Ejercicio 28
SELECT 
YEAR(fecha_pago) AS anio_pago,
MONTH(fecha_pago) AS mes_pago,
AVG(importe) AS promedio,
SUM(importe) AS suma
FROM gasto
GROUP BY YEAR(fecha_pago), MONTH(fecha_pago);

--Ejercicio 29
SELECT 
YEAR(fecha_pago) AS anio_pago,
SUM(importe) AS total_anual
FROM gasto
GROUP BY YEAR(fecha_pago)
HAVING SUM(importe) !> 15000000;

--Ejercico 30
SELECT tipo_gasto_id,
ROUND(AVG(importe),1) AS promedio_redondeado
FROM gasto
GROUP BY tipo_gasto_id;

--Ejercicio 31
SELECT 
YEAR(fecha_pago) AS anio_pago,
MONTH(fecha_pago) AS mes_pago,
ROUND(AVG(importe),1) AS promedio_mensual
FROM gasto
WHERE importe > 5000
GROUP BY YEAR(fecha_pago), MONTH(fecha_pago)

--Ejercicio 32
SELECT periodo,
COUNT(*) AS cantidad,
SUM(importe) AS total,
AVG(importe) AS promedio,
MAX(importe) AS maximo,
MIN(importe) AS minimo
FROM gasto
GROUP BY periodo;

--Ejercicio 33
SELECT tipo_gasto_id,
COUNT(*) AS cantidad,
AVG(importe) AS promedio
FROM gasto
GROUP BY tipo_gasto_id 
HAVING COUNT(*) < 1600 AND AVG(importe) > 5000;

--Ejercicio 34
 SELECT
	CASE
		WHEN importe <= 5000 THEN 'Bajo'
		WHEN importe <= 20000 THEN 'Medio'
		ELSE 'ALTO'
	END AS rango_importe,
	COUNT(*) AS cantidad,
	AVG(importe) AS promedio
	FROM gasto
	GROUP BY
		CASE
		WHEN importe <= 5000 THEN 'Bajo'
		WHEN importe <= 20000 THEN 'Medio'
		ELSE 'ALTO'
	END
	ORDER BY rango_importe ASC



--Ejercicio 35
SELECT
YEAR(fecha_pago) AS anio_pago,
AVG(importe) AS promedio_anual
FROM gasto
WHERE importe > 4000
GROUP BY YEAR(fecha_pago)
HAVING AVG(importe) < 22000
ORDER BY promedio_anual DESC;
		





	

