--queremos eliminar un cliente que tiene un pedido asociado. Es decir, eliminarlo de la base de datos

--identificamos al que queremos eliminar
select * from cliente where codigo_cliente = 1;

--lo borramos
delete from cliente where codigo_cliente = 1;

--The DELETE statement conflicted with the REFERENCE constraint "fk_codigo_pedido". The conflict occurred in database "registro_clientes", table "dbo.Pedido", column 'codigo_cliente'.
--hay un conflicto. ese cliente ya tiene un pedido asociado. es decir, esta relacionado con la tabla pedido. si el 
--cliente se borra, el pedido no puede quedar huerfano de cliente. Esto es por el principio de integridad referencial.
--La tabla dependiente es pedido

--eliminamos otro cliente
delete from cliente where codigo_cliente = 4;



