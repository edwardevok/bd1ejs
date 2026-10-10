--tabla comercio
CREATE TABLE Comercio(
codigo_comercio INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
tipo_actividad INT NOT NULL
);

--HUPS me equivoque bueno ni modo
ALTER TABLE Comercio ALTER COLUMN tipo_actividad VARCHAR(30) NOT NULL;

--METEMOS DATOS
INSERT INTO Comercio(nombre, tipo_actividad) VALUES
('El Buen Pan', 'Panadería'),
('La Espiga', 'Panadería'),
('Centro Tech', 'Informática'),
('Norte Sistemas', 'Informática'),
('San Martín', 'Farmacia');

--vemos los datos
select * from Comercio;

--Queremos normalizar porque no respeta la 3FN
CREATE TABLE TipoActividad(
codigo_tipo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
descripcion VARCHAR(30) NOT NULL
);

--insertamos los tipos de actividad (a mano uno por 1 o con distinct)
INSERT INTO TipoActividad(descripcion) SELECT DISTINCT tipo_actividad FROM Comercio;

--insertamos la columna de codigo de activiadad en comercio (NULL sino da error)
ALTER TABLE Comercio ADD codigo_actividad INT NULL;
SELECT * FROM TipoActividad;

--completamos los comercios
UPDATE Comercio SET codigo_actividad = 1 WHERE tipo_actividad = 'Farmacia';
UPDATE Comercio SET codigo_actividad = 2 WHERE tipo_actividad = 'Informática';
UPDATE Comercio SET codigo_actividad = 3 WHERE tipo_actividad = 'Panadería'
