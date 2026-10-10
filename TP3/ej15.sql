--creamos una tabla producto (otra)
CREATE TABLE Producto_dos(
	codigo_producto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion VARCHAR(30) NOT NULL,
	precio FLOAT NOT NULL,
	codigo_categoria INT NOT NULL,
	nombre_categoria VARCHAR(30) NOT NULL
);

INSERT INTO Producto_dos(descripcion, precio, codigo_categoria, nombre_categoria) VALUES
('Teclado', 25000, 10, 'Periféricos'),
('Mouse', 18000, 10, 'Periféricos'),
('Monitor', 210000, 20, 'Monitores'),
('Webcam', 45000, 10, 'Periféricos'),
('Notebook', 850000, 30, 'Computadoras');

--se quiere hacer una tabla categoria para eliminar dependencias transitivas
CREATE TABLE Categoria(
	codigo_categoria INT PRIMARY KEY NOT NULL,
	nombre_categoria VARCHAR(30) NOT NULL
);

--COLOCAR DATOS EN CATEGORIA DESDE PRODUCTO (se puede hacer a mano, pero existe una forma mas corta que esta buena aprenderla)
INSERT INTO Categoria(codigo_categoria, nombre_categoria) SELECT DISTINCT codigo_categoria, nombre_categoria FROM Producto_dos;

--establecemos la foreign key
ALTER TABLE Producto_dos ADD CONSTRAINT FK_Cod_cat FOREIGN KEY(codigo_categoria) REFERENCES Categoria(codigo_categoria);


--Si se crea la FK primero sin LLENAR CATEGORIA, sql da error. Porque la tabla categoria no tiene nungun dato. Producto tiene 3 codigos de categorias distintos
--cuando se hace la fk, sql chequea que esos datos esten en la tabla a ser referenciada. sino estan, detiene la ejecucion y da error