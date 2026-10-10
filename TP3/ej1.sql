--creacion de la tabla cliente
CREATE TABLE cliente(
	codigo_cliente INT IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	correo VARCHAR(100) NOT NULL,
	fecha_alta DATE DEFAULT '2026-01-01',
	
	CONSTRAINT PK_cliente PRIMARY KEY (codigo_cliente)
	
);
 --hacemos unique a correo
ALTER TABLE cliente ADD CONSTRAINT UQ_correo UNIQUE (correo);

--le sacamos el not null a correo
ALTER TABLE cliente ALTER COLUMN correo varchar(100) null;

--insertamos 4 clientes
INSERT INTO cliente (nombre, apellido, correo)
VALUES ('Eduardo', 'Lopez', 'edulopez4815@gmail.com');

INSERT INTO cliente (nombre, apellido, correo)
VALUES ('Joan', 'Mauri', 'joanmauricc@gmail.com');

INSERT INTO cliente (nombre, apellido, correo)
VALUES ('Luciano', 'Pedotti', 'luchopedo@gmail.com');

INSERT INTO cliente (nombre, apellido)
VALUES('Luciano', 'Garcia')

--1 cliente con correo repetido
INSERT INTO cliente (nombre, apellido, correo)
VALUES ('Eduardo', 'Gomez', 'edulopez4815@gmail.com');