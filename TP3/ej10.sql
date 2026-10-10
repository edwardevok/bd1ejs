--partimos de Empleado
select * from Empleado;

--creamos una tabla sector. Impedimos que haya un sector con el mismo nombre ya en la creacion de la tabla
CREATE TABLE sector(
id_sector INT IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL,

CONSTRAINT pk_id_sector PRIMARY KEY (id_sector),
CONSTRAINT UQ_nombre UNIQUE(nombre)
);

--insertamos 3 sectores
INSERT INTO Sector(nombre) values
('Administración'),('Ventas'),('Depósito');

select * from sector;

--agregamos una columna codigo_sector a empleado (si no escribo null, se pone por defecto)
alter table Empleado add id_sector int;
select * from Empleado;

update Empleado set id_sector = 1 where codigo_empleado = 1;
update Empleado set id_sector = 2 where codigo_empleado = 3;
update Empleado set id_sector = 3 where codigo_empleado = 4;
update Empleado set id_sector = 1 where codigo_empleado = 5;
update Empleado set id_sector = 3 where codigo_empleado = 7;

--luego de eso, hacemos la restriccion FK
alter table Empleado add constraint FK_idSector FOREIGN KEY (id_sector) references Sector(id_sector);

--asignamos un sector inexistente a un empleado
update empleado set id_sector = 4 where codigo_empleado= 2;
--0 filas afectadas