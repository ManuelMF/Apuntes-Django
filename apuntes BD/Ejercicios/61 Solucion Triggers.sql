
-- ------------------------------------------------------------------------
-- ------------------------------------------------------------------------
-- 1. Crea una base de datos llamada test_triggers_1 que contenga una tabla
-- llamada alumnos con las siguientes columnas:
-- 
-- Tabla alumnos:
-- • alu_codalu (entero sin signo)
-- • alu_nombre (cadena de caracteres)
-- • alu_apellido1 (cadena de caracteres)
-- • alu_apellido2 (cadena de caracteres)
-- • alu_nota (número real)


create database test_triggers_1;
use test_triggers_1;

create table alumnos (
   alu_codalu int unsigned auto_increment,
   alu_nombre varchar(45),
   alu_apellido1 varchar(90),
   alu_apellido2 varchar(90),
   alu_nota float,
   primary key ALU_PK (alu_codalu)
);


-- Una vez creada la tabla escribe dos triggers con las siguientes
-- características:
-- 
-- • Trigger 1: trigger_check_nota_before_insert
-- o Se ejecuta sobre la tabla alumnos.
-- o Se ejecuta antes de una operación de inserción.
-- o Si el nuevo valor de la nota que se quiere insertar es negativo, se
-- guarda como 0 (cero).
-- o Si el nuevo valor de la nota que se quiere insertar es mayor que
-- 10, se guarda como 10.


delimiter //
create trigger trigger_check_nota_before_insert before insert
on alumnos for each row
begin
   -- Controlamos que la nota no sea negativa
   if new.alu_nota < 0 then
      set new.alu_nota = 0;
   end if;
   
   -- Controlamos que la nota no supere el 10
   if new.alu_nota > 10 then
      set new.alu_nota = 10;
   end if;
   
   -- También se podría hacer en una sola sentencia IF
   -- if new.alu_nota < 0 then
   --    set alu_nota = 0;
   -- elseif new.alu_nota > 10 then
   --    set alu_nota = 10;
   -- end if;
   
end //
delimiter ;


-- • Trigger 2: trigger_check_nota_before_update
-- o Se ejecuta sobre la tabla alumnos.
-- o Se ejecuta antes de una operación de actualización.
-- o Si el nuevo valor de la nota que se quiere actualizar es negativo,
-- se guarda como 0.
-- o Si el nuevo valor de la nota que se quiere actualizar es mayor
-- que 10, se guarda como 10.


delimiter //
create trigger trigger_check_nota_before_update before update
on alumnos for each row
begin
   -- Controlamos que la nota no sea negativa
   if new.alu_nota < 0 then
      set new.alu_nota = 0;
   end if;
   
   -- Controlamos que la nota no supere el 10
   if new.alu_nota > 10 then
      set new.alu_nota = 10;
   end if;
end //
delimiter ;


-- Una vez creados los triggers escribe varias sentencias de inserción y
-- actualización sobre la tabla alumnos y verifica que se están ejecutando
-- correctamente.


select * from alumnos;

insert into alumnos (alu_nombre, alu_apellido1, alu_apellido2, alu_nota)
values ('Toni', 'Crespí', 'Mateu', 9);

insert into alumnos (alu_nombre, alu_apellido1, alu_apellido2, alu_nota)
values ('Tomeu', 'Ferriol', 'Llabrés', -5);

insert into alumnos (alu_nombre, alu_apellido1, alu_apellido2, alu_nota)
values ('Tomeu', 'Ferriol', 'Llabrés', 78);

update alumnos
set    alu_nota = 18
where  alu_codalu = 2;

update alumnos
set    alu_nota = 15
where  alu_codalu = 1;


-- ------------------------------------------------------------------------
-- ------------------------------------------------------------------------
-- 2. Crea una base de datos llamada test_triggers_2 que contenga una tabla
-- llamada alumnos con las siguientes columnas.
-- 
-- Tabla alumnos:
-- • alu_codalu (entero sin signo)
-- • alu_nombre (cadena de caracteres)
-- • alu_apellido1 (cadena de caracteres)
-- • alu_apellido2 (cadena de caracteres)
-- • alu_email (cadena de caracteres)


create database test_triggers_2;
use test_triggers_2;

create table alumnos (
   alu_codalu int unsigned auto_increment,
   alu_nombre varchar(45),
   alu_apellido1 varchar(90),
   alu_apellido2 varchar(90),
   alu_email varchar(120),
   primary key ALU_PK (alu_codalu)
);


-- Escribe un procedimiento llamado generar_email que dados los
-- parámetros de entrada: p_nombre, p_apellido1, p_apellido2, y
-- p_dominio cree una dirección de email y la devuelva como salida.
-- 
-- • Procedimiento: generar_email
-- • Entrada:
-- o p_nombre (cadena de caracteres)
-- o p_apellido1 (cadena de caracteres)
-- o p_apellido2 (cadena de caracteres)
-- o p_dominio (cadena de caracteres)
-- • Salida:
-- o p_email (cadena de caracteres)
-- devuelva una dirección de correo electrónico con el siguiente formato:
-- • El primer carácter del parámetro p_nombre.
-- • Los tres primeros caracteres del parámetro p_apellido1.
-- • Los tres primeros caracteres del parámetro p_apellido2.
-- • El carácter @.
-- • El dominio pasado como parámetro.


delimiter //
create procedure generar_email(in  p_nombre varchar(45),
                               in  p_apellido1 varchar(90),
                               in  p_apellido2 varchar(90),
                               in  p_dominio varchar(45),
                               out p_email varchar(120))
begin
   select concat(substr(p_nombre,1,1),
                 substr(p_apellido1,1,3),
                 substr(p_apellido2,1,3),
                 '@',
                 p_dominio)
   into p_email;
end //
delimiter ;


-- Una vez creada la tabla y el procedimiento escribe un trigger con las
-- siguientes características:
-- • Trigger: trigger_crear_email_before_insert
-- o Se ejecuta sobre la tabla alumnos.
-- o Se ejecuta antes de una operación de inserción.
-- o Si el nuevo valor del email que se quiere insertar es NULL,
-- entonces se le creará automáticamente una dirección de email y
-- se insertará en la tabla.
-- o Si el nuevo valor del email no es NULL se guardará en la tabla el
-- valor del email.
-- 
-- Nota: Para crear la nueva dirección de email se deberá hacer uso del
-- procedimiento generar_email.


delimiter //
create trigger trigger_crear_email_before_insert before insert
on alumnos for each row
begin
   declare v_email varchar(120) default null;
   
   if new.alu_email is null then
      call generar_email(new.alu_nombre, new.alu_apellido1, new.alu_apellido2, 'gmail.com', v_email);
      set new.alu_email = v_email;
   end if;
end //
delimiter ;


-- Una vez creado el trigger escribe varias sentencias de inserción sobre la
-- tabla alumnos, con y sin email, y verifica que se está ejecutando correctamente.


select * from alumnos;

insert into alumnos (alu_nombre, alu_apellido1, alu_apellido2, alu_email)
values ('Pep', 'Galmés', 'Más', 'pepgalmes@gmail.com');

insert into alumnos (alu_nombre, alu_apellido1, alu_apellido2, alu_email)
values ('Jordi', 'Font', 'Bergas', null); 

