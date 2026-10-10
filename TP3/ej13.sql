--creamos la tabla 
CREATE TABLE Departamento(
codigo_departamento INT IDENTITY(1,1) PRIMARY KEY,
nombre_departamento VARCHAR(30) NOT NULL,
codigo_provincia INT NOT NULL,
nombre_provincia VARCHAR(30) NOT NULL
);

--insertamos un par de valores
INSERT INTO Departamento(nombre_departamento, codigo_provincia, nombre_provincia) VALUES
('Capital', 18, 'Corrientes'),
('Goya', 18, 'Corrientes'),
('Oberá', 54, 'Misiones'),
('Eldorado', 54, 'Misiones'),
('Paraná', 30, 'Entre Ríos'),
('Concordia', 30, 'Entre Ríos');


--los vemos
SELECT * FROM Departamento;

--vemos que la provincia se repite. creamos una tabla provoncia como dice la consigna
CREATE TABLE Provincia(
codigo_provincia INT PRIMARY KEY NOT NULL,
nombre_provincia VARCHAR(30) NOT NULL
);

--Poblamos la tabla con informacion de la tabla departamento
INSERT INTO Provincia(codigo_provincia, nombre_provincia) SELECT DISTINCT codigo_provincia, nombre_provincia FROM Departamento;

SELECT * FROM Provincia;
--Creamos la clave foranea!
ALTER TABLE Departamento ADD CONSTRAINT FK_codigo_provincia FOREIGN KEY (codigo_provincia) REFERENCES Provincia(codigo_provincia);

--Borramos la columna nombre provincia que ya no hace falta
ALTER TABLE Departamento drop column nombre_provincia;

--RESUMEN PARA PARA QUE SE CUMPLA EL PRINCIPIO DE INTEGRIDAD REFERENCIAL
--1_Creamos la tabla provincia
--2_Copiamos A MANO o con distinct el codigo de la provincia y el nombre para poblar la nueva tabla Provincia
--3_Esto con el fin de no perder información ya presente en la tabla departamento
--4_Agregamos la clave foranea de departamento estableciento la relacion
--5_Borramos la columna nombre provincia de Departamento

--No es conveniente eliminar nombre_provincia antes de poblar la nueva tabla porque se pierde información
--que no puede ser recuperada. No queda ningun registro que dicho codigo pertenece a dicha provincia para llenar la tabla Provincia

