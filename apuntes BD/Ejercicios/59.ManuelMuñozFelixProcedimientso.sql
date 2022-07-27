SET SQL_SAFE_UPDATES = 0;
-- a) Procedimientos SIN sentencias SQL

-- a.1) Escribe un procedimiento llamado saludo que no tenga ningún
-- parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!
delimiter //
create procedure saludo()
begin
select "¡Hola mundo!";
end //
delimiter ;
call saludo();

-- a.2) Escribe un procedimiento llamado tipo_de_numero que reciba un
-- número real de entrada y muestre un mensaje indicando si el número es
-- positivo, negativo o cero.
delimiter //
create procedure tipo_de_numero(in n int) 
begin 
	if n>0 then 
		select "Positivo"; 
    elseif n<0 then
		select "Negativo";
	else 
		select "Cero";
    end if;
end //
delimiter ;
call tipo_de_numero(-8);
-- a.3) Modifica el procedimiento del ejercicio anterior para que tenga un
-- parámetro de entrada, con el valor de un número real, y un parámetro de
-- salida, con una cadena de caracteres indicando si el número es positivo,
-- negativo o cero.
delimiter //
create procedure tipo_de_numero(in n int,out resultado varchar(49)) 
begin 
	if n>0 then 
		select "Positivo" into resultado; 
    elseif n<0 then
		select "Negativo" into resultado;
	else 
		select "Cero" into resultado;
    end if;
end //
delimiter ;
call tipo_de_numero(-8);
select resultado;
-- a.4) Escribe un procedimiento llamado notas que reciba un número real
-- de entrada, que representa el valor de la nota de un alumno, y muestre un
-- mensaje indicando qué nota ha obtenido teniendo en cuenta las
-- siguientes condiciones:
-- Utiliza la sentencia IF vista en el temario.
-- -- • [0,5) = Insuficiente
-- • [5,6) = Aprobado
-- • [6, 7) = Bien
-- • [7, 9) = Notable
-- • [9, 10] = Sobresaliente
-- • En cualquier otro caso ha de indicar que la nota no es válida.
delimiter //
create procedure notas(in n int)
begin
	if n>10 || n<0 then 
		select "la nota no es válida";
    elseif n<4.99 then 
		select "Insuficiente";
    elseif n<5.99 then 
		select "Aprobado";
    elseif n<6.99 then 
		select "bien";
    elseif n<8.99 then 
		select "Notable";
    else select "Sobresaliente";
    end if;
end //
delimiter ;

-- Recuerda: el corchete “[“ ó “]” indica que el número al que acompaña SÍ está
-- incluido, mientras que el paréntesis “(“ ó “)” indica que el número al que
-- acompaña NO está incluido.

-- a.5) Modifica el procedimiento del ejercicio anterior para que tenga un
-- parámetro de entrada, con el valor de la nota en formato numérico y un
-- parámetro de salida, con una cadena de texto indicando la nota
-- correspondiente.
delimiter //
create function notas(n int) returns varchar(30)
begin
	if n>10 || n<0 then 
		return "la nota no es válida";
    elseif n<4.99 then 
		return "Insuficiente";
    elseif n<5.99 then 
		return "Aprobado";
    elseif n<6.99 then 
		return "bien";
    elseif n<8.99 then 
		return "Notable";
    else return "Sobresaliente";
    end if;
end //
delimiter ;

-- a.6) Resuelve el procedimiento del ejercicio anterior haciendo uso de la
-- estructura de control CASE.
delimiter //
create procedure notass(in n int, out res varchar(30)) 
begin
	case 
    when n>10 || n<0 then 
		select "la nota no es válida" into res;
    when n<4.99 then 
		select "Insuficiente" into res;
    when n<5.99 then 
		select "Aprobado" into res;
    when n<6.99 then 
		select "bien" into res;
    when n<8.99 then 
		select  "Notable" into res;
    when n>8.99 then
		select "Sobresaliente" into res;
		else select "No es valido" into res;
       end case;
end //
delimiter ;

drop procedure notass;

call notass(8,@resul);

select @resul;
-- a.7) Escribe un procedimiento llamado día_de_la_semana que reciba
-- como parámetro de entrada un valor numérico que represente un día de
-- la semana y que devuelva una cadena de caracteres con el nombre del día
-- de la semana correspondiente.
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena Lunes.
-- Si el valor recibido no está entre el 1 y el 7 debe devolver un mensaje
-- indicando que el valor recibido no es correcto.
delimiter //
create procedure día_de_la_semana(in dia int, out carac varchar(30)) 
begin
case dia
	when 1 then
		select "Lunes" into carac;
	when 2 then
		select "Martes" into carac;
	when 3 then
		select "Miercoles" into carac;
	when 4 then
		select "Jueves" into carac;
	when 5 then
		select "Vienes" into carac;
	when 6 then
		select "Sabado" into carac;
	when 7 then
		select "Domingo" into carac;
	end case;
end //
delimiter ;
call día_de_la_semana(5,@resul);
select @resul;
-- b) Procedimientos CON sentencias SQL

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
cua_numcua int unsigned primary key ,
cua_area int unsigned
);

delimiter //
create procedure calcular_area_cuadrados(in p_tope int unsigned)
begin
	declare n int default 1;
    delete from cuadrados;
	while p_tope>=n do 
		
		insert into cuadrados (cua_numcua,cua_area) values (n,n*n);
        set n= n+1;
    end while;
end //
delimiter ;

drop procedure calcular_area_cuadrados;
call calcular_area_cuadrados(100);
select * from cuadrados;

-- b.2) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure calcular_area_cuadrados(in p_tope int unsigned)
begin
	declare n int default 1;
    delete from cuadrados;
	repeat 
		insert into cuadrados (cua_numcua,cua_area) values (n,n*n);
        set n= n+1;
     until p_tope<=n
     end repeat;
end //
delimiter ;
-- b.3) Crea una tabla llamada secuencias. La tabla debe tener una única
-- columna llamada sec_numero y el tipo de dato de esta columna debe ser INT
-- UNSIGNED.
-- Una vez creada la tabla crea un procedimiento llamado
-- calcular_números con las siguientes características: el procedimiento
-- recibe un parámetro de entrada llamado p_valor_inicial de tipo INT
-- UNSIGNED y deberá almacenar en la tabla secuencias toda la secuencia
-- de números naturales desde el valor inicial pasado como entrada hasta el
-- 1.
-- Ten en cuenta que el procedimiento deberá eliminar el contenido actual
-- de la tabla antes de insertar los nuevos valores.
-- Utiliza un bucle WHILE para resolver el procedimiento.
create table secuencias(
sec_numero INT UNSIGNED primary key
);

delimiter //
create procedure calcular_números(in p_valor_inicial int unsigned)
begin
	declare n int default 0;
    declare num int default p_valor_inicial;
    delete from cuadrados;
	while p_valor_inicial>n do 
		
		insert into secuencias (sec_numero) values (p_valor_inicial);
        
        set p_valor_inicial = p_valor_inicial-1;
    end while;
end //
delimiter ;

call calcular_números(30);
select * from secuencias;
-- b.4) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure calcular_números(in p_valor_inicial int unsigned)
begin
	declare n int default 1;
    declare num int default p_valor_inicial;
    delete from calcular_números;
	repeat  
		
		insert into secuencias (sec_numero) values (p_valor_inicial);
        
        set p_valor_inicial = p_valor_inicial-1;
    until p_valor_inicial<=n     
    end repeat;
end //
delimiter ;

drop procedure calcular_números;
call calcular_números(30);
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
create table impares(
numero int unsigned
);

delimiter //
create procedure calcular_pares_impares(in p_tope int unsigned)
begin
	declare n int default 1;
    delete from impares;
    delete from pares;
	while p_tope>n do 
		if (p_tope % 2 ) = 0 then 
			insert into pares (numero) values (p_tope);
		else
			insert into impares (numero) values (p_tope);
        end if;
        
        set p_tope = p_tope-1;
	end while;
end //
delimiter ;

drop procedure calcular_pares_impares;
call calcular_pares_impares(30);
select * from impares;
-- b.6) Utiliza un bucle REPEAT para resolver el procedimiento del ejercicio
-- anterior.
delimiter //
create procedure calcular_pares_impares(in p_tope int unsigned)
begin
	declare n int default 1;
    delete from impares;
    delete from pares;
	repeat
		if (p_tope % 2 ) = 0 then 
			insert into pares (numero) values (p_tope);
		else
			insert into impares (numero) values (p_tope);
        end if;
        
        set p_tope = p_tope-1;
	 until p_tope>n 
     end repeat;
end //
delimiter ;


-- Crea una base de datos llamada funciones y realiza los ejercicios del apartado
-- c)

-- c) Funciones SIN sentencias SQL
create database funciones;
use funciones;
-- c.1) Escribe una función llamada es_par que reciba un número entero
-- de entrada y devuelva TRUE si el número es par o FALSE en caso
-- contrario.
delimiter //
create function es_par(num int) returns boolean
begin
	if (num % 2 ) = 0 then 
		return true;
	else
		return false;
	end if;
end //
delimiter ;

select es_par(3);
-- c.2) Escribe una función llamada dame_hipotenusa que devuelva el
-- valor de la hipotenusa de un triángulo a partir de los valores de sus lados.
-- Recuerda que la hipotenusa de un triángulo es igual a la raíz cuadrada de
-- la suma de los cuadrados de sus lados (Hipotenusa = √lado1
-- 2+lado2
-- 2)
delimiter //
create function dame_hipotenusa(lado1 int, lado2 int) returns int
begin
	return lado1*lado1+lado2*lado2;
end //
delimiter ;
select dame_hipotenusa(3,4);

-- c.3) Escribe una función llamada dame_dia_de_la_semana que reciba
-- como parámetro de entrada un valor numérico que represente un día de
-- la semana y que devuelva una cadena de caracteres con el nombre del día
-- de la semana correspondiente.
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena Lunes.
-- Si el valor recibido no está entre el 1 y el 7 debe devolver un mensaje
-- indicando que el valor recibido no es correcto.
delimiter //
create function dame_dia_de_la_semana(dia int) returns int
begin
	case dia
	when 1 then
		return "Lunes";
	when 2 then
		return "Martes" ;
	when 3 then
		return "Miercoles" ;
	when 4 then
		return "Jueves" ;
	when 5 then
		return "Vienes" ;
	when 6 then
		return "Sabado" ;
	when 7 then
		return "Domingo" ;
	end case;
end //
delimiter ;
-- c.4) Escribe una función llamada dame_numero_mayor que reciba tres
-- números reales como parámetros de entrada y devuelva el mayor de los
-- tres.
delimiter //
create function dame_numero_mayor(n1 int, n2 int, n3 int) returns int
begin
	if n1>n2 || n1>n3 then return n1;
    elseif n2>n1 || n2>n3 then return n2;
	else return n3;
    end if;
end //
delimiter ;
-- c.5) Escribe una función llamada dame_area_circulo que devuelva el
-- valor del área de un círculo a partir del valor del radio que se recibirá
-- como parámetro de entrada.
-- Recuerda que la fórmula para el cálculo del área de un círculo es pi
-- multiplicado por el radio al cuadrado (Area = π · r
-- 2
-- )
delimiter //
create function dame_area_circulo(radio int) returns int
begin
	return radio*radio;
end //
delimiter ;
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
delimiter //
create function dame_numero_anyos(fecha1 date,fecha2 date) returns varchar(30)
begin
declare d Date;
set d =datediff(fecha1,fecha2);
return year(d);
end //
delimiter ;

-- Para los ejercicios del apartado d) utilizaremos la base de datos ya existente
-- tienda_informatica
use tienda_informatica;

-- d) Funciones CON sentencias SQL

-- d.1) Escribe una función llamada dame_total_productos que
-- devuelva el número total de productos que hay en la tabla productos.
delimiter //
create function dame_total_productos() returns int
begin
declare num int;
set num := (select count(pro_codpro) from productos);
return num; 
end
// delimiter ;

select dame_total_productos();
-- d.2) Escribe una función llamada
-- dame_precio_medio_x_fabricante que devuelva el valor medio del
-- precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_medio_x_fabricante(n varchar(90)) returns int 
begin
declare num int;
set num := (select avg(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
return num; 
end
// delimiter ;

select * from fabricantes;
-- d.3) Escribe una función llamada
-- dame_precio_mayor_x_fabricante que devuelva el valor máximo
-- del precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_mayor_x_fabricante(n varchar(90)) returns int 
begin
declare num int;
set num := (select max(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
return num; 
end
// delimiter ;

select dame_precio_mayor_x_fabricante("Asus");
-- d.4) Escribe una función llamada
-- dame_precio_menor_x_fabricante que devuelva el valor mínimo
-- del precio de los productos de un determinado fabricante que se recibirá
-- como parámetro de entrada. El parámetro de entrada será el nombre del
-- fabricante.
delimiter //
create function dame_precio_mayor_x_fabricante(n varchar(90)) returns int 
begin
declare num int;
set num := (select min(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
return num; 
end
// delimiter ;
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
create function dame_info_precios_x_fabricante(n varchar(90), ele varchar(10)) returns int 
begin
declare num int;
	if ele="medio" then
		set num := (select avg(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
		return num; 
	elseif ele="máximo" then
		set num := (select max(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
		return num; 
	elseif ele="mínimo" then
		set num := (select min(pro_precio) from productos inner join fabricantes on (pro_codfab=fab_codfab) where fab_nombre=n);
		return num; 
	else return -1;
	end if;
end
// delimiter ;

select dame_info_precios_x_fabricante ("Lenovo","medio");