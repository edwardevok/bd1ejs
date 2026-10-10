--vemos como esta la tabla empleado
select * from Empleado;

--queremos agregar una nueva columna estado que sea not null
alter table Empleado add estado varchar(10) not null;
--esto da error. porque alter table solo permite agregar columnas que sean nulas o que tengan DEFAULT
--no se puede agregar una columna NOT NULL a una tabla ya cargada con datos, porque esa columna quedaria vacía, no satisfaciendo a NOT NULL justamente

--mejor así
alter table Empleado add estado varchar(10) null;

--luego de esto, todos los empleados tienen NULL. pero la consigna dice que los existentes deben tener ACTIVO
update Empleado set estado = 'ACTIVO' where estado is null;

--ahora si, podemos hacer la columna obligatoria. no hay ningun problema, pues todos los empleados tienen la columna llena
alter table Empleado alter column estado varchar(10) not null; 

--finalmente la hacemos default activo para los nuevos. recordar que default es una RESTRICCION
alter table Empleado add constraint df_estado default 'ACTIVO' for estado;

