
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------------------------------
-- Crea una base de datos llamada procedimientos y realiza los ejercicios de los
-- apartados a) y b)
-- -----------------------------------------------------------------------------

create database procedimientos;
use procedimientos;

-- ------------------------------------
-- a) Procedimientos SIN sentencias SQL
-- ------------------------------------

-- a.1) Escribe un procedimiento llamado saludo que no tenga ningún
-- parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!
delimiter //
create procedure saludo ()
begin
   select '¡Hola mundo!';
end //
delimiter ;

call saludo();


-- a.2) Escribe un procedimiento llamado tipo_de_numero que reciba un
-- número real de entrada y muestre un mensaje indicando si el número es
-- positivo, negativo o cero.
delimiter //
create procedure tipo_de_numero(in p_numero int)
begin
   if p_numero > 0 then
      select 'El número el positivo';
   elseif p_numero < 0 then
      select 'El número es negativo';
   else
      select 'El número es cero';
   end if;
end //
delimiter ;

call tipo_de_numero(0);


-- a.3) Modifica el procedimiento del ejercicio anterior para que tenga un
-- parámetro de entrada, con el valor de un número real, y un parámetro de
-- salida, con una cadena de caracteres indicando si el número es positivo,
-- negativo o cero.
delimiter //
create procedure tipo_de_numero2(in p_numero int, out p_tipo_numero varchar(45))
begin
   if p_numero > 0 then
      select 'El número el positivo' into p_tipo_numero;
   elseif p_numero < 0 then
      select 'El número es negativo' into p_tipo_numero;
   else
      select 'El número es cero' into p_tipo_numero;
   end if;
end //
delimiter ;

call tipo_de_numero2(-25, @resultado);
select @resultado;


-- a.4) Escribe un procedimiento llamado notas que reciba un número real
-- de entrada, que representa el valor de la nota de un alumno, y muestre un
-- mensaje indicando qué nota ha obtenido teniendo en cuenta las
-- siguientes condiciones:
-- Utiliza la sentencia IF vista en el temario.
-- • [0,5) = Insuficiente
-- • [5,6) = Aprobado
-- • [6, 7) = Bien
-- • [7, 9) = Notable
-- • [9, 10] = Sobresaliente
-- • En cualquier otro caso ha de indicar que la nota no es válida.

-- Recuerda: el corchete “[“ ó “]” indica que el número al que acompaña SÍ está
-- incluido, mientras que el paréntesis “(“ ó “)” indica que el número al que
-- acompaña NO está incluido.
delimiter //
create procedure notas(in p_nota float)
begin
   if p_nota >= 0 and p_nota < 5 then
      select 'Insuficiente';
   elseif p_nota >= 5 and p_nota < 6 then
      select 'Aprobado';
   elseif p_nota >= 6 and p_nota < 7 then
      select 'Bien';
   elseif p_nota >= 7 and p_nota < 9 then
      select 'Notable';
   elseif p_nota >= 9 and p_nota <= 10 then
      select 'Sobresaliente';
   else
      select 'La nota no es válida';
   end if;
end //
delimiter ;

call notas(-120);


-- a.5) Modifica el procedimiento del ejercicio anterior para que tenga un
-- parámetro de entrada, con el valor de la nota en formato numérico y un
-- parámetro de salida, con una cadena de texto indicando la nota
-- correspondiente.
delimiter //
create procedure notas2(in p_nota float, out p_resultado varchar(45))
begin
   if p_nota >= 0 and p_nota < 5 then
      select 'Insuficiente' into p_resultado;
   elseif p_nota >= 5 and p_nota < 6 then
      select 'Aprobado' into p_resultado;
   elseif p_nota >= 6 and p_nota < 7 then
      select 'Bien' into p_resultado;
   elseif p_nota >= 7 and p_nota < 9 then
      select 'Notable' into p_resultado;
   elseif p_nota >= 9 and p_nota <= 10 then
      select 'Sobresaliente' into p_resultado;
   else
      select 'La nota no es válida' into p_resultado;
   end if;
end //
delimiter ;

call notas2(5, @resultado);
select @resultado;


-- a.6) Resuelve el procedimiento del ejercicio anterior haciendo uso de la
-- estructura de control CASE.
delimiter //
create procedure notas3(in p_nota int, out p_resultado varchar(45))
begin
   case p_nota
      when 0  then select 'Insuficiente'  into p_resultado;
      when 1  then select 'Insuficiente'  into p_resultado;
      when 2  then select 'Insuficiente'  into p_resultado;
      when 3  then select 'Insuficiente'  into p_resultado;
      when 4  then select 'Insuficiente'  into p_resultado;
      when 5  then select 'Aprobado'      into p_resultado;
      when 6  then select 'Bien'          into p_resultado;
      when 7  then select 'Notable'       into p_resultado;
      when 8  then select 'Notable'       into p_resultado;
      when 9  then select 'Sobresaliente' into p_resultado;
      when 10 then select 'Sobresaliente' into p_resultado;
      else         select 'La nota no es válida' into p_resultado;
   end case;
end //
delimiter ;

call notas3(6.3, @resultado);
select @resultado;


-- a.7) Escribe un procedimiento llamado día_de_la_semana que reciba
-- como parámetro de entrada un valor numérico que represente un día de
-- la semana y que devuelva una cadena de caracteres con el nombre del día
-- de la semana correspondiente.
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena Lunes.
-- Si el valor recibido no está entre el 1 y el 7 debe devolver un mensaje
-- indicando que el valor recibido no es correcto.

-- Versión SIN parámetro de salida
delimiter //
create procedure dia_de_la_semana1(in p_dia int)
begin
   case p_dia
      when 1 then select 'Lunes';
      when 2 then select 'Martes';
      when 3 then select 'Miércoles';
      when 4 then select 'Jueves';
      when 5 then select 'Viernes';
      when 6 then select 'Sábado';
      when 7 then select 'Domingo';
      else        select 'Parámetro incorrecto';
   end case;
end //
delimiter ;

call dia_de_la_semana1(63);


-- Versión CON parámetro de salida
delimiter //
create procedure dia_de_la_semana2(in p_dia int, out p_resultado varchar(20))
begin
   case p_dia
      when 1 then select 'Lunes' into p_resultado;
      when 2 then select 'Martes' into p_resultado;
      when 3 then select 'Miércoles' into p_resultado;
      when 4 then select 'Jueves' into p_resultado;
      when 5 then select 'Viernes' into p_resultado;
      when 6 then select 'Sábado' into p_resultado;
      when 7 then select 'Domingo' into p_resultado;
      else        select 'Parámetro incorrecto' into p_resultado;
   end case;
end //
delimiter ;

call dia_de_la_semana2(3, @resultado);
select @resultado;

-- ------------------------------------
-- b) Procedimientos CON sentencias SQL
-- ------------------------------------

-- b.1) Crea una tabla llamada cuadrados. La tabla cuadrados debe
-- tener dos columnas de tipo INT UNSIGNED, una columna
-- llamada cua_numcua y otra columna llamada cua_area.
-- Una vez creada la tabla crea un procedimiento llamado
-- calcular_area_cuadrados con las siguientes características: el
-- procedimiento recibe un parámetro de entrada llamado p_tope de
-- tipo INT UNSIGNED y calculará el área de los cuadrados de los primeros
-- números naturales hasta el valor introducido como parámetro.
-- El valor de los números de los cuadrados y de sus áreas deberán ser
-- almacenados en la tabla cuadrados que hemos creado previamente.
-- Ten en cuenta que el procedimiento deberá eliminar el contenido actual
-- de la tabla antes de insertar los nuevos valores de los cuadrados que va a
-- calcular.
-- Utiliza un bucle WHILE para resolver el procedimiento.
create table cuadrados (
   cua_numcua int unsigned,
   cua_area   int unsigned
);

delimiter //
create procedure area_cuadrados(in p_tope int unsigned)
begin
   declare v_num int;
   set v_num = p_tope;
   
   delete from cuadrados;
   
   while v_num >= 1 do
      insert into cuadrados (cua_numcua, cua_area) values (v_num, pow(v_num,2));
      set v_num = v_num -1;
   end while;
end //
delimiter ;

call area_cuadrados(7);
select * from cuadrados;


-- b.2) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure area_cuadrados2(in p_tope int unsigned)
begin
   declare v_num int;
   set v_num = p_tope;
   
   delete from cuadrados;
   
   repeat
      insert into cuadrados (cua_numcua, cua_area) values (v_num, pow(v_num,2));
      set v_num = v_num -1;
   until v_num < 1
   end repeat;
end //
delimiter ;

call area_cuadrados2(2);
select * from cuadrados;


-- b.3) Crea una tabla llamada secuencias. La tabla debe tener una única
-- columna llamada sec_numero y el tipo de dato de esta columna debe ser INT
-- UNSIGNED.
-- Una vez creada la tabla crea un procedimiento llamado
-- calcular_numeros con las siguientes características: el procedimiento
-- recibe un parámetro de entrada llamado p_valor_inicial de tipo INT
-- UNSIGNED y deberá almacenar en la tabla secuencias toda la secuencia
-- de números naturales desde el valor inicial pasado como entrada hasta el
-- 1.
-- Ten en cuenta que el procedimiento deberá eliminar el contenido actual
-- de la tabla antes de insertar los nuevos valores.
-- Utiliza un bucle WHILE para resolver el procedimiento.
create table secuencias (
   sec_numero int unsigned
);

delimiter //
create procedure calcular_numeros(in p_valor_inicial int unsigned)
begin
   declare v_sec int unsigned;
   set v_sec = p_valor_inicial;
   
   delete from secuencias;
   
   while v_sec >= 1 do
      insert into secuencias (sec_numero) values (v_sec);
      set v_sec = v_sec -1;
   end while;
end //
delimiter ;

call calcular_numeros(2);
select * from secuencias;


-- b.4) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure calcular_numeros2(in p_valor_inicial int unsigned)
begin
   declare v_sec int unsigned;
   set v_sec = p_valor_inicial;
   
   delete from secuencias;
   
   repeat
      insert into secuencias (sec_numero) values (v_sec);
      set v_sec = v_sec -1;
   until v_sec < 1
   end repeat;
end //
delimiter ;

call calcular_numeros2(15);
select * from secuencias;


-- b.5) Crea una tabla llamada pares y otra tabla llamada impares. Las
-- dos tablas deben tener única columna llamada numero y el tipo de dato
-- de esta columna debe ser INT UNSIGNED.
-- Una vez creadas las tablas crea un procedimiento llamado
-- calcular_pares_impares con las siguientes características: el
-- procedimiento recibe un parámetro de entrada llamado p_tope de
-- tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos
-- números pares que existan entre el número 1 el valor introducido como
-- parámetro; habrá que realizar la misma operación para almacenar los
-- números impares en la tabla impares.
-- Ten en cuenta que el procedimiento deberá eliminar el contenido actual
-- de las tablas antes de insertar los nuevos valores.
-- Utiliza un bucle WHILE para resolver el procedimiento.
create table pares (
   numero int unsigned
);

create table impares (
   numero int unsigned
);

delimiter //
create procedure calcular_pares_impares(in p_tope int unsigned)
begin
   declare v_numero int unsigned;
   set v_numero = p_tope;
   
   delete from pares;
   delete from impares;
   
   while v_numero >= 1 do
      if mod(v_numero,2) = 0 then
        insert into pares (numero) values (v_numero);
	  else
        insert into impares (numero) values (v_numero);
      end if;
      
      set v_numero = v_numero -1;
   end while;
end //
delimiter ;

call calcular_pares_impares(15);
select * from pares;
select * from impares;


-- b.6) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure calcular_pares_impares2(in p_tope int unsigned)
begin
   declare v_numero int unsigned;
   set v_numero = p_tope;
   
   delete from pares;
   delete from impares;
   
   repeat
      if mod(v_numero,2) = 0 then
        insert into pares (numero) values (v_numero);
	  else
        insert into impares (numero) values (v_numero);
      end if;
      
      set v_numero = v_numero -1;
   until v_numero < 1
   end repeat;
end //
delimiter ;

call calcular_pares_impares2(25);
select * from pares;
select * from impares;


-- ------------------------------------------------------------------------------
-- Crea una base de datos llamada funciones y realiza los ejercicios del apartado
-- c)
-- ------------------------------------------------------------------------------
create database funciones;
use funciones;

-- -------------------------------
-- c) Funciones SIN sentencias SQL
-- -------------------------------

-- c.1) Escribe una función llamada es_par que reciba un número entero
-- de entrada y devuelva TRUE si el número es par o FALSE en caso
-- contrario.
delimiter //
create function es_par(p_num int) returns boolean
begin
   if mod(p_num,2) = 0 then
      return TRUE;
   else
      return FALSE;
   end if;
end //
delimiter ;

select es_par(46);


-- c.2) Escribe una función llamada dame_hipotenusa que devuelva el
-- valor de la hipotenusa de un triángulo a partir de los valores de sus lados.
-- Recuerda que la hipotenusa de un triángulo es igual a la raíz cuadrada de
-- la suma de los cuadrados de sus lados (Hipotenusa = √lado12+lado22)
delimiter //
create function dame_hipotenusa(p_lado1 int, p_lado2 int) returns float
begin
   return sqrt(power(p_lado1,2)+power(p_lado2,2));
end //
delimiter ;

select round(dame_hipotenusa(23, 40),2);


-- c.3) Escribe una función llamada dame_dia_de_la_semana que reciba
-- como parámetro de entrada un valor numérico que represente un día de
-- la semana y que devuelva una cadena de caracteres con el nombre del día
-- de la semana correspondiente.
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena Lunes.
-- Si el valor recibido no está entre el 1 y el 7 debe devolver un mensaje
-- indicando que el valor recibido no es correcto.

-- Versión 1: utilizando una variable para almacenar el valor a devolver
delimiter //
create function dame_dia_de_la_semana1(p_num int) returns varchar(30)
begin
   declare v_dia varchar(30);
   
   if     p_num = 1 then set v_dia = 'Lunes';
   elseif p_num = 2 then set v_dia = 'Martes';
   elseif p_num = 3 then set v_dia = 'Miércoles';
   elseif p_num = 4 then set v_dia = 'Jueves';
   elseif p_num = 5 then set v_dia = 'Viernes';
   elseif p_num = 6 then set v_dia = 'Sábado';
   elseif p_num = 7 then set v_dia = 'Domingo';
   else                  set v_dia = 'El valor no es correcto';
   end if;
   
   return v_dia;

end //
delimiter ;

select dame_dia_de_la_semana1(46);


-- Versión 2: devolviendo directamente el valor (return)
delimiter //
create function dame_dia_de_la_semana2(p_num int) returns varchar(30)
begin
   if     p_num = 1 then return 'Lunes';
   elseif p_num = 2 then return 'Martes';
   elseif p_num = 3 then return 'Miércoles';
   elseif p_num = 4 then return 'Jueves';
   elseif p_num = 5 then return 'Viernes';
   elseif p_num = 6 then return 'Sábado';
   elseif p_num = 7 then return 'Domingo';
   else                  return 'El valor no es correcto';
   end if;
end //
delimiter ;

select dame_dia_de_la_semana2(0);


-- c.4) Escribe una función llamada dame_numero_mayor que reciba tres
-- números reales como parámetros de entrada y devuelva el mayor de los
-- tres.
delimiter //
create function dame_numero_mayor(p_num1 float, p_num2 float, p_num3 float) returns float
begin
  declare v_mayor float default 0;

  if p_num1 >= p_num2 and p_num1 >= p_num3 then
     set v_mayor = p_num1;
  elseif p_num2 >= p_num1 and p_num2 >= p_num3 then
     set v_mayor = p_num2;
  -- elseif p_num3 > p_num1 and p_num3 > p_num2 then
  else
     set v_mayor = p_num3;
  end if;
  
  return v_mayor;
end //
delimiter ;

select dame_numero_mayor(2,3,1);


-- c.5) Escribe una función llamada dame_area_circulo que devuelva el
-- valor del área de un círculo a partir del valor del radio que se recibirá
-- como parámetro de entrada.
-- Recuerda que la fórmula para el cálculo del área de un círculo es pi
-- multiplicado por el radio al cuadrado (Area = π · r2)
delimiter //
create function dame_area_circulo(p_radio float) returns float
begin
   return pi() * pow(p_radio,2);
end //
delimiter //

select dame_area_circulo(3);


-- c.6) Escribe una función llamada dame_numero_anyos que devuelva
-- como salida el número de años que han transcurrido entre dos fechas que
-- se reciben como parámetros de entrada.
-- Por ejemplo, si pasamos como parámetros de entrada las fechas 2021-
-- 01-01 y 2011-01-01 la función tiene que devolver que han pasado 10
-- años.
-- Para realizar esta función puedes hacer uso de las siguientes funciones
-- que nos proporciona MySQL:
-- • DATEDIFF
-- • TRUNCATE

-- Versión 1: utilizando una variable para almacenar el valor a devolver
delimiter //
create function dame_numero_anyos1(p_fecha1 date, p_fecha2 date) returns int
begin
   declare v_anyos int default 0;
 
   set v_anyos = truncate(datediff(p_fecha1, p_fecha2)/365.25, 0);
   
   return v_anyos;
end //
delimiter ;

select dame_numero_anyos1(now(), '2012-06-01');


-- Versión 2: devolviendo directamente el valor (return)
delimiter //
create function dame_numero_anyos2(p_fecha1 date, p_fecha2 date) returns int
begin
   return truncate(datediff(p_fecha1, p_fecha2)/365.25, 0);
end //
delimiter ;

select dame_numero_anyos2(now(), '2012-06-01');


-- ------------------------------------------------------------------------------
-- Para los ejercicios del apartado d) utilizaremos la base de datos ya existente
-- tienda_informatica
-- ------------------------------------------------------------------------------
use tienda_informatica;


-- -------------------------------
-- d) Funciones CON sentencias SQL
-- -------------------------------

-- d.1) Escribe una función llamada dame_total_productos que
-- devuelva el número total de productos que hay en la tabla productos.
delimiter //
create function dame_total_productos() returns int
begin
   declare num_productos int;
   
   select count(pro_codpro) into num_productos
   from   productos;
   
   return num_productos;
end //
delimiter ;

select dame_total_productos();


-- d.2) Escribe una función llamada
-- dame_precio_medio_x_fabricante que devuelva el valor medio del
-- precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_medio_x_fabricante(p_fabricante varchar(60)) returns float
begin
   declare medio float;
   
   select avg(pro_precio) into medio
   from   productos
   ,      fabricantes
   where  pro_codfab = fab_codfab
   and    fab_nombre = p_fabricante;
   
   return medio;
end //
delimiter ;

select round(dame_precio_medio_x_fabricante('Asus'), 2);


-- d.3) Escribe una función llamada
-- dame_precio_mayor_x_fabricante que devuelva el valor máximo
-- del precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_mayor_x_fabricante(p_fabricante varchar(60)) returns float
begin
   declare mayor float;
   
   select max(pro_precio) into mayor
   from   productos
   ,      fabricantes
   where  pro_codfab = fab_codfab
   and    fab_nombre = p_fabricante;
   
   return mayor;
end //
delimiter ;

select round(dame_precio_mayor_x_fabricante('Asus'), 2);


-- d.4) Escribe una función llamada
-- dame_precio_menor_x_fabricante que devuelva el valor mínimo
-- del precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_menor_x_fabricante(p_fabricante varchar(60)) returns float
begin
   declare menor float;
   
   select min(pro_precio) into menor
   from   productos
   ,      fabricantes
   where  pro_codfab = fab_codfab
   and    fab_nombre = p_fabricante;
   
   return menor;
end //
delimiter ;

select round(dame_precio_menor_x_fabricante('Asus'), 2);


-- d.5) Escribe una función llamada
-- dame_info_precios_x_fabricante que unificará las funciones de
-- los tres apartados anteriores (d.2, d.3 y d.4) de la siguiente manera:
-- recibirá por parámetro el nombre del fabricante (igual que las funciones
-- de los tres apartados anteriores) y otro parámetro p_tipo que podrá
-- contener los valores ‘medio’, ‘máximo’ o ‘mínimo’, y en función de este
-- valor devolverá el tipo de precio solicitado
-- - el valor medio del precio de los productos, o
-- - el valor máximo del precio de los productos, o
-- - el valor mínimo del precio de los productos
-- del fabricante pasado por parámetro. Si en el parámetro p_tipo se le
-- pasa un valor diferente a los esperados, la función ha de devolver -1.
delimiter //
create function dame_info_precios_x_fabricante(nom_fabricante varchar(60), p_tipo varchar(10)) returns float
begin
   declare resultado float;

   if p_tipo = 'medio' then
      select avg(pro_precio) into resultado
      from   productos
      ,      fabricantes
      where  pro_codfab = fab_codfab
      and    fab_nombre = nom_fabricante;
   elseif p_tipo = 'máximo' then
      select max(pro_precio) into resultado
      from   productos
      ,      fabricantes
      where  pro_codfab = fab_codfab
      and    fab_nombre = nom_fabricante;
   elseif p_tipo = 'mínimo' then
      select min(pro_precio) into resultado
      from   productos
      ,      fabricantes
      where  pro_codfab = fab_codfab
      and    fab_nombre = nom_fabricante;
   else
      set resultado = -1;
   end if;

   return resultado;
end //
delimiter ;

select round(dame_info_precios_x_fabricante('Asus', 'añlsdf'), 2);
