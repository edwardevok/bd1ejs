--queremos agregar el campo fecha_entrega a pedido
--va a ser null porque a veces un pedido no esta entregado aun
--pero mas alla de eso, no podria poner not null. la tabla ya esta creada y ya hay registros,
--cada registro quedaria con esa columna vaçía y vacía justamente no puede quedar. tira error
alter table Pedido add fecha_entrega date null;

--actualizamos la fecha de entrega de algunos pedidos
select * from Pedido;

update Pedido set fecha_entrega = '09-24-2026' where id_pedido = 1;

--queremos ver los pedidos sin fecha de entrega
select * from Pedido where fecha_entrega is null;

--y de esta forma que pasa??
select * from Pedido where fecha_entrega = null;
--esta consulta no de vuelve nada!

--null es deconocido. queremos comparar fecha de entrega con desconocido, por eso no devuelve nada
--por eso se usa is null o is not null