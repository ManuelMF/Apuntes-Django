use test_indices;

-- 1) Mirando en la pestaña de información de la tabla en el Workbench,
-- ¿cuántos megas ocupa la tabla?
-- 260 MB

-- 2) Mediante una SELECT, devuelve cuántos registros hay en total en la tabla.
select count(*) from ejercicio_indices;

-- 3.a) ¿Cuánto tarda en obtener los datos del empleado 11000?
select * from ejercicio_indices where eji_codemp=11000 ; -- 0.04 sec

-- 3.b) Crea un índice en la columna eji_codemp.
ALTER TABLE ejercicio_indices ADD INDEX indices(eji_codemp);
-- 3.c) Ahora, ¿cuánto tarda en obtener los datos del empleado 11000?
select * from ejercicio_indices where eji_codemp=11000 ; -- 0.015 sec

-- 4.a) ¿Cuánto tarda en obtener los datos ordenados alfabéticamente por
-- puesto?
select * from ejercicio_indices order by eji_puesto; -- 2.531 sec
-- 4.b) ¿Cuánto tarda en obtener el número de empleados por cada puesto?
select eji_puesto, count(eji_codemp) 
from ejercicio_indices group by eji_puesto; -- 4.204 sec

-- 4.c) Crea un índice en la columna eji_puesto.
ALTER TABLE ejercicio_indices ADD INDEX indicesPuesto(eji_puesto,eji_codemp);

-- 4.d) Ahora, ¿cuánto tarda en obtener los datos ordenados alfabéticamente por
-- puesto?
select * from ejercicio_indices order by eji_puesto; -- 0.031 sec
-- 4.e) Ahora, ¿cuánto tarda en obtener el número de empleados por cada
-- puesto?
select eji_puesto, count(eji_codemp) 
from ejercicio_indices group by eji_puesto; -- 2.156 sec
-- 5.a) ¿Cuánto tarda en obtener los datos ordenados por nombre y apellido?
select * from ejercicio_indices order by eji_nombre,eji_apellido; -- 2.562 sec
-- 5.b) Crea un índice para obtener la lista por nombre y apellido más
-- rápidamente.
ALTER TABLE ejercicio_indices ADD INDEX indicesnom(eji_nombre,eji_apellido);

-- 5.c) Ahora, ¿cuánto tarda en obtener los datos ordenados por nombre y
-- apellido?
select * from ejercicio_indices order by eji_nombre,eji_apellido; -- 0.078 sec
-- 6) Mirando en la pestaña de información de la tabla en el Workbench,
-- ¿cuántos megas ocupan los índices?
-- 151 MG