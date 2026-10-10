--vemos como esta pedido
select * from Pedido;

--queremos agregar una columna a pedido. Estado. Queremos agregarla, asignar pendiente a todos los existentes,
--definir el valor pendiente para nuevos, y una restriccion check. vamos por parte

--1_creamos la columna con null para que no afecte a los pedidos existentes y no tire error
ALTER TABLE Pedido ADD estado VARCHAR(20) NULL;

--2_Asignar PENDIENTE A LOS QUE YA EXISTEN con un update
update Pedido set estado = 'PENDIENTE' WHERE estado IS NULL;

--3_La hacemos obligatoria
alter table Pedido alter column estado varchar(20) not null;

--4_Añadimos la restriccion para que sea por defecto PENDIENTE
alter table Pedido add constraint df_estado default 'PENDIENTE' for estado;

--5_ Hacemos una restriccion check que solo acepte 3 PALABRAS
alter table pedido add constraint ch_estado check (estado in('PENDIENTE', 'ENVIADO', 'ENTREGADO'));

--Actualizamos un pedido
update Pedido set estado = 'ENVIADO' where id_pedido = 1;

--Intentamos asignar el estado CANCELADO a un pedido
update Pedido set estado = 'CANCELADO' where id_pedido = 2;

--no ocurre nada. hay un conflicto. CANCELADO no esta incluido en la restriccion check
