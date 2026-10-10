--la columna id_sector en empleado ya es null. nada que modificar

--le ponemos '' a id_sector de un empleado

select * from Empleado;
update Empleado set id_sector = '' where codigo_empleado = 1;
--tira error: si colocamos '', sql traduce ese vacio a un entero numero 0. Busca el sector con codigo 0 pero no
--lo encunetra, entonces falla

--probemos con null
update Empleado set id_sector = null where codigo_empleado = 1;
--con null si se puede. null, es NULL

select * from Empleado where id_sector is null;