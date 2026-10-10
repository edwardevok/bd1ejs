--crear tabla pedido
CREATE TABLE Pedido(
id_pedido int identity(1,1),
fecha date not null,
importe float not null,

--clave primaria a id_pedido
constraint pk_pe primary key(id_pedido)
);

--agregar campo
alter table Pedido add codigo_cliente int not null;

--insertamos algunos pedidos
insert into Pedido(fecha, importe, codigo_cliente) values
('09-24-2026', 100000, 1),
('09-24-2026', 200000, 2),
('09-24-2026', 300000, 3);

--agregamos una fk
alter table Pedido add constraint fk_codigo_pedido foreign key (codigo_cliente) references Cliente (codigo_cliente); 

--cargamos productos cuyos clientes no existen para ver el error (codigo de cliente 9 que no existe)
insert into Pedido(fecha, importe, codigo_cliente) values
('09-24-2026', 500000, 9);

--The INSERT statement conflicted with the FOREIGN KEY constraint "fk_codigo_pedido". The conflict occurred in database "registro_clientes", table "dbo.cliente", column 'codigo_cliente'.
--la operacion es rechazada porque se intenta hacer referencia al codigo de cliente de un cliente que no existe
