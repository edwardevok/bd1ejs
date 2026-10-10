--queremos eliminar el sector deposito
select * from Sector;
select * from Empleado where id_sector = 3;

--eliminamos el sector 3
delete from sector where id_sector = 3;
--no se puede. hay 2 usuarios que tienen el sector 3 asociado. Integridad referencial: se evita dejar registros huerfanos

--cambiamos el sector a los 2 usuarios a otro
update Empleado set id_sector = 1 where id_sector = 3;

--eliminamos
delete from sector where id_sector = 3;

--ahora se pudo. ese sector ya no tenia ningun empleado asociado. no iban a quedar registros huerfanos.