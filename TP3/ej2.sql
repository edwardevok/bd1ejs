--crear la tabla

CREATE TABLE Producto(
	codigo_producto INT IDENTITY(1,1),
	descripcion VARCHAR(100) NOT NULL,
	precio FLOAT NOT NULL,
	estado VARCHAR(10) DEFAULT 'ACTIVO'

	--pk codigo
	CONSTRAINT PK_codigo_prod PRIMARY KEY (codigo_producto)
);

--insertamos los productos
INSERT INTO Producto(descripcion, precio, estado)
VALUES('Pava electrica', '48000', 'Inactivo');

INSERT INTO Producto(descripcion, precio)
VALUES('Horno', '350000');

INSERT INTO Producto(descripcion, precio, estado)
VALUES('iPhone 18 pro MAX', '4000000', 'Inactivo');

INSERT INTO Producto(descripcion, precio)
VALUES('Playstation 5', '1300000');

INSERT INTO Producto(descripcion, precio, estado)
VALUES('Agua Mineral de China', '50000', 'Roto');

--añadimos la restriccion de precios negativos
ALTER TABLE Producto ADD CONSTRAINT Ch_precios CHECK (precio > 0);

--intentamos registrar un producto con precio negativo
INSERT INTO Producto (descripcion, precio)
VALUES('Zapatilla Nike', '-100000');

--actualizar un precio
UPDATE Producto SET precio = 2000000 WHERE codigo_producto = 4;

--si insertamos un precio = a 0, rompe la restriccion asi que no se inserta