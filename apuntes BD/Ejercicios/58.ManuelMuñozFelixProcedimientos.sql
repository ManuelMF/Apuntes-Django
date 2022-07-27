


-- Creamos una BD llamada publicaciones
create database if not exists publicaciones;

-- Indicamos que vamos a trabajar con la BD libros
use publicaciones;

-- Tabla libros
create table libros(
  lib_codlib int unsigned auto_increment,
  lib_titulo varchar(60) not null,
  lib_autor varchar(30),
  lib_editorial varchar(30),
  lib_precio float,
  primary key LIB_PK (lib_codlib)
 );

-- Deshabilitamos el autocommit
set autocommit = false;

-- Insertamos en la tabla libros
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('El principito','Antonine de Saint','Planeta',15);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('La Cocinera de Castamar','Fernando J. Múñez','Planeta',40);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Cómo hacer que te pasen cosas buenas','Marián Rojas','Espasa',18.20);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Magia y enigma','Henry Kamen','Espasa',22.20);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Matilda','Roald Dahl','Alfaguara',36.40);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Momo', 'Michael Ende', 'Alfaguara',30.80);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Mujeritas','Louisa May Alcott','Alfaguara',45.00);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('La historia interminable','Michael Ende','Alfaguara',46.00);
insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values ('Peter Pan','J.M. Barrie','Alfaguara',null);

-- Commitamos
commit; 
select * from libros;
-- 1) Crea un procedimiento llamado add_libro que reciba como parámetros
-- los datos de un libro y realice la inserción de un libro nuevo.
delimiter //
create procedure add_libro(in titulo varchar(60),in autor varchar(30),in editorial varchar(30),in precio float)
begin
insert into libros (lib_titulo ,lib_autor,lib_editorial ,lib_precio)
values (titulo,autor,editorial,precio);
end //
delimiter ;

-- 2) Añade un libro nuevo llamando al procedimiento creado previamente.
call add_libro("El Rebaño","Jano Garzia","Panda",18.50);

-- 3) Crea un procedimiento llamado del_libro que elimine un libro. Como
-- parámetro recibirá el código del libro a eliminar.
delimiter //
create procedure del_libro(in id int)
begin
delete from libros where lib_codlib = id;
end //
delimiter ;

-- 4) Elimina un libro llamando al procedimiento creado previamente.
call del_libro(10);

-- 5) Crea un procedimiento llamado get_libros_x_editorial que devuelva
-- en un parámetro de salida el número de libros existente de una editorial
-- pasada como parámetro.
delimiter //
create procedure get_libros_x_editorial(in editorial varchar(60))
begin
	select count(lib_codlib) from libros where lib_editorial=editorial;
end //
delimiter ;

-- 6) Llama al procedimiento creado previamente para obtener el número de
-- libros existentes de una editorial.
call get_libros_x_editorial("Planeta");

-- 7) Crear una función llamada param_caracteres que devuelva el número
-- de caracteres del parámetro pasado.
delimiter //
create function param_caracteres(texto varchar(200)) returns int
begin
return length(texto); 
end //
delimiter ;
-- 8) Llama a la función creada previamente para obtener el número de
-- caracteres del parámetro.
select param_caracteres("asgfsagjg as asg asg aw ge.");

-- 9) Crea una función llamada get_fecha que reciba tres parámetros, uno para
-- el día, otro para el mes y otro para el año, y devuelva una cadena de texto con
-- el formato:
-- "La fecha elegida es 20/05/2022".
-- (No es necesario realizar comprobaciones de si es una fecha real o no)
delimiter //
create function get_fecha (dia varchar(2), mes varchar(2), anyo varchar(4)) returns varchar(80)
begin
	return concat("La fecha elegida es ",dia,"/",mes,"/",anyo);
end //
delimiter ;

-- 10) Llama a la función creada previamente.
select get_fecha(07,07,2002);

-- 11) Crea una función llamada get_fecha_actual que devuelva la fecha
-- actual en una cadena de texto con el siguiente formato:
-- "Hoy es 20/05/2022"
delimiter //
create function get_fecha_actual() returns varchar(80)
begin
	return substring(concat('Hoy es ',now()),1,17)  ;
end //
delimiter ;
drop function get_fecha_actual;
-- 12) Llama a la función creada previamente y comprueba que la información es
-- correcta.
select get_fecha_actual();

