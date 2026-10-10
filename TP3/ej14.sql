--tenemos el mismo caso, peor sin codigo de provincia
CREATE TABLE Departamento_dos(
codigo_departamento INT IDENTITY(1,1) NOT NULL,
nombre_departamento VARCHAR(30) NOT NULL,
nombre_provincia VARCHAR(30) NOT NULL
);

--agregamos la clave foranea de departamento dos porque me olvidé
ALTER TABLE Departamento_dos ADD CONSTRAINT PK_cod PRIMARY KEY (codigo_departamento);

--creamos provincia 2 
CREATE TABLE ProvinciaDos(
codigo_provincia INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
nombre_provincia VARCHAR(30) NOT NULL
);

--INSERTAMOS departamentos
INSERT INTO Departamento_dos(nombre_departamento,nombre_provincia) VALUES
('Capital', 'Corrientes'),
('Goya', 'Corrientes'),
('Obera', 'Misiones'),
('Eldorado', 'Misiones'),
('Paraná', 'Entre Ríos'),
('Concordia', 'Entre Ríos');

--Insertamos provincias
INSERT INTO ProvinciaDos(nombre_provincia) VALUES
('Corrientes'),
('Misiones'),
('Entre Ríos');

SELECT * FROM ProvinciaDos;
SELECT * FROM Departamento_dos;

--agregamos codigo_provincia a departamento. lo hacemos NULL porque ya hay registros cargados. sino, no se podria con NOT NULL
ALTER TABLE Departamento_dos ADD codigo_provincia INT;

--hacemos el update en cada provincia 
UPDATE Departamento_dos SET codigo_provincia = 1 WHERE nombre_provincia = 'Corrientes';
UPDATE Departamento_dos SET codigo_provincia = 2 WHERE nombre_provincia = 'Misiones';
UPDATE Departamento_dos SET codigo_provincia = 3 WHERE nombre_provincia = 'Entre Ríos';

--foreign key
ALTER TABLE Departamento_dos ADD CONSTRAINT FK_codigo_prov FOREIGN KEY(codigo_provincia) REFERENCES ProvinciaDos(codigo_provincia);

--eliminar la columna nombre_provincia de depto
ALTER TABLE Departamento_dos drop column nombre_provincia;