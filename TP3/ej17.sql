CREATE TABLE Reservas(
codigo_reserva INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
fecha DATE NOT NULL,
nombre_sala VARCHAR(30)
);

CREATE TABLE Sala(
codigo_sala INT IDENTITY(1,1),
nombre_sala VARCHAR(30),

CONSTRAINT PK_codigo_sala PRIMARY KEY (codigo_sala),
CONSTRAINT UQ_nombre_sala UNIQUE (nombre_sala)

);

INSERT INTO Sala(nombre_sala) VALUES
('Auditorio'),
('Laboratorio 1'),
('Laboratorio 2')

INSERT INTO Reservas(fecha, nombre_sala) VALUES
('09-27-2026', 'Auditorio'),
('09-27-2026', 'Laboratorio 1'),
('09-27-2026', 'Laboratorio 2')


--Agregamos la columna codigo_sala a reserva
ALTER TABLE Reservas ADD codigo_sala INT;

UPDATE Reservas SET codigo_sala = 1 WHERE nombre_sala = 'Auditorio';
UPDATE Reservas SET codigo_sala = 2 WHERE nombre_sala = 'Laboratorio 1';
UPDATE Reservas SET codigo_sala = 3 WHERE nombre_sala = 'Laboratorio 2';

SELECT * FROM Reservas;

ALTER TABLE Reservas ADD CONSTRAINT FK_codigo_sala FOREIGN KEY(codigo_sala) REFERENCES Sala(codigo_sala);

ALTER TABLE Reservas DROP COLUMN nombre_sala;

--Podemos eliminar nombre sala primero que todo, pero vamos a perder la unica referencia que tenemos entre esa reserva y dicha sala. No van a quedar pruebas de qué reserva tenía qué sala
--Si definimos codigo sala como NOT NULL, arroja error porque ya hay datos existentes que ni pueden quedar con esa columna vacia
--Si existen codigos no pertenecientes, se rompe el principio de integridad referencial, que nos dice que cada valor de fk, debe conicidir con el valor de la PK a la que a punta
