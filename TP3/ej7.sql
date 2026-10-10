--vemos como esta la tabla producto
select * from Producto;

--cambiamos la longitud de descripcion
alter table Producto alter column descripcion varchar(80) not null; 

--esta modificacion es posible porque no estamos alterando el tipo de dato. sigue siendo varchar
--además, porque ningun producto tiene como descripcion un texto de mas de 80 caracts.
--de ser así, daria error y la sentencia no se ejecuta