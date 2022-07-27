
create database pruebas;
use pruebas;



-- Procedimiento que recibe dos números y los compara
-- mostrando por pantalla cuál es mayor o si son iguales.
delimiter //
create procedure compara_v1 (in param1 int, in param2 int)
begin
  if param1 > param2 then
     select 'El primer parámetro es mayor';
  elseif param1 < param2 then
     select 'El segundo parámetro es mayor';
  else
     select 'Ambos parámetros son iguales';
  end if;
end //
delimiter ;

call compara_v1(3, 5);



-- Procedimiento que recibe dos números y los compara
-- devolviendo en un parámetro de salida un texto para indicar
-- cuál es mayor o si son iguales.
delimiter //
create procedure compara_v2 (in param1 int, in param2 int, out p_result varchar(50))
begin
  if param1 > param2 then
     select 'El primer parámetro es mayor' into p_result;
  elseif param1 < param2 then
     select 'El segundo parámetro es mayor' into p_result;
  else
     select 'Ambos parámetros son iguales' into p_result;
  end if;
end //
delimiter ;

call compara_v2(3, 5, @resultado);
select @resultado;



-- Procedimiento que recibe un número y muestra
-- por pantalla un texto indicando qué número ha recibido.
-- Ejemplo del CASE.
delimiter //
create procedure compara_v3 (in param1 int)
begin
   case param1
      when 1 then select 'He recibido un uno';
      when 2 then select 'He recibido un dos';
      when 3 then select 'He recibido un tres';
      else        select 'No he recibido ni un uno ni un dos ni un tres';
   end case;
end //
delimiter ;

call compara_v3(3);



-- Procedimiento que recibe un número
-- y lo incrementa n veces dentro de un WHILE
-- Ejemplo del WHILE.
delimiter //
create procedure proc_bucle_v1 (in param1 int)
begin
  declare var1 int;
  set var1 = param1;
  while var1<10 do
    select var1;
    set var1 = var1 + 1;
  end while;
end //
delimiter ;

call proc_bucle_v1(3);



-- Procedimiento que recibe un número
-- y lo incrementa n veces dentro de un REPEAT
-- Ejemplo del REPEAT.
delimiter //
create procedure proc_bucle_v2 (in param1 int)
begin
  declare var1 int;
  set var1 = param1;
  repeat
    select var1;
    set var1 = var1 + 1;
  until var1 >= 10
  end repeat;
end //
delimiter ;

call proc_bucle_v2(3);
