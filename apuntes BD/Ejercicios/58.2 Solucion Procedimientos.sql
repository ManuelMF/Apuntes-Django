
use publicaciones;

-- 1) Crea un procedimiento llamado add_libro que reciba como parámetros los datos de un libro
-- y realice la inserción de un libro nuevo.
delimiter //
create procedure add_libro(in p_titulo varchar(60), in p_autor varchar(30), in p_editorial varchar(30), in p_precio float)
begin
   insert into libros (lib_titulo, lib_autor, lib_editorial, lib_precio) values (p_titulo, p_autor, p_editorial, p_precio);
end //
delimiter ;


-- 2) Añade un libro nuevo llamando al procedimiento creado previamente.
call add_libro('Libro de BD', 'Escritor', 'Planeta', 55);


-- 3) Crea un procedimiento llamado del_libro que elimine un libro. Como parámetro recibirá el código del libro a eliminar.
delimiter //
create procedure del_libro(in p_codlib int)
begin
   delete from libros where lib_codlib = p_codlib;
end //


-- 4) Elimina un libro llamando al procedimiento creado previamente.
call del_libro(11);


-- 5) Crea un procedimiento llamado get_libros_x_editorial que devuelva en un parámetro de salida
-- el número de libros existente de una editorial pasada como parámetro.
delimiter //
create procedure get_libros_x_editorial(in p_editorial varchar(15), out p_num_libros int)
begin
   select count(*) into p_num_libros from libros where lib_editorial = p_editorial;
end //
delimiter ;


-- 6) Llama al procedimiento creado previamente para obtener el número de libros existentes de una editorial.
call get_libros_x_editorial('Alfaguara',@res);
select @res;


-- 7) Crear una función llamada param_caracteres que devuelva el número de caracteres del parámetro pasado.
delimiter //
create function param_caracteres(p_param varchar(100)) returns int
begin 
  return length(p_param);
end //
delimiter ;


-- 8) Llama a la función creada previamente para obtener el número de caracteres del parámetro.
select param_caracteres('Hola caracola');


-- 9) Crea una función llamada get_fecha que reciba tres parámetros, uno para el día,
-- otro para el mes y otro para el año, y devuelva una cadena de texto con el formato:
-- "La fecha elegida es 20/05/2021".
-- (No es necesario realizar comprobaciones de si es una fecha real o no)
delimiter //
create function get_fecha(p_dia int, p_mes int, p_anyo int) returns varchar(50)
begin
   return concat('La fecha elegida es ', p_dia, '/', p_mes, '/', p_anyo);
end //
delimiter ;


-- 10) Llama a la función creada previamente.
select get_fecha(1, 3, 2021);


-- 11) Crea una función llamada get_fecha_actual que devuelva la fecha actual
-- en una cadena de texto con el siguiente formato: "Hoy es 20/05/2021"
delimiter //
create function get_fecha_actual() returns varchar(50)
begin
   return concat('Hoy es ', day(now()), '/', month(now()), '/', year(now()));
end //
delimiter ;


-- 12) Llama a la función creada previamente y comprueba que la información es correcta.
select get_fecha_actual();
