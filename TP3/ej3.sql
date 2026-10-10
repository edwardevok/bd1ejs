--create table
create table Empleado(
	codigo_empleado int identity(1,1),
	dni int not null,
	ape_y_nom varchar(100) not null,
	fecha_ingreso date not null
);

--clave primaria para la tabla Empleado
alter table Empleado add constraint pk_codigo_empleado primary key (codigo_empleado);

--restriccion unique para dni
alter table Empleado add constraint uq_dni unique (dni);

--4 empleados insertados de forma rapida
insert into Empleado(dni, ape_y_nom, fecha_ingreso)
values('41412903', 'Lopez Eduardo', '11-12-2025'),
('37890753', 'Mauri Joan', '10-01-2024'),
('44466777', 'Diaz Gonzalo', '05-08-2023'),
('66666666', 'Luciano Garcia', '09-11-2022');

--insertamos con un dni repetido
insert into Empleado(dni, ape_y_nom, fecha_ingreso) values
('41412903', 'Clon mio', '12-10-2026');

--modificamos con update el dni de un empleado con uno ya existente
update Empleado set dni = '44466777' where codigo_empleado = 1;

--en ambas interviene la restriccion uq_dni que hace a cada dni unico