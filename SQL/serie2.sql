--Ejercicio 1
SELECT * FROM persona WHERE telefono = NULL
--Vacio. porque null es dato desconocido null = null no es verdadero. dos datos deconocidos no se pueden 
--afirmar como iguales. No es lo mismo que decir IS NULL

--Ejercicio 2
SELECT persona_id, apellido_nombre, telefono
FROM persona
WHERE telefono IS NULL;

--Ejercicio 3
SELECT persona_id, apellido_nombre, telefono
FROM persona
WHERE telefono IS NOT NULL;

--Ejercicio 4
SELECT persona_id,
ISNULL(apellido_nombre, '(Sin Dato)') AS apellido_nombre,
ISNULL(telefono, '(Sin Dato)') AS telefono
FROM persona;