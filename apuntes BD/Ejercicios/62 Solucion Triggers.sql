-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- 1. Crea una base de datos llamada test_triggers_3 que contenga 7 tablas
-- con las siguientes columnas:


create database test_triggers_3;
use test_triggers_3;


-- Tabla personas:
-- • per_codper (entero sin signo autoincrementable y PK)
-- • per_nombre (cadena de caracteres y NN)
-- • per_apellido1 (cadena de caracteres y NN)
-- • per_apellido2 (cadena de caracteres)
-- • per_edad (entero)
-- • per_nacimiento (fecha y NN)
-- • per_dni (cadena de caracteres y NN)
-- • per_sexo (‘H’, ‘M’)
-- • per_telefono (cadena de caracteres de longitud 20 y NN)


create table personas (
   per_codper int unsigned,
   per_nombre varchar(45) not null,
   per_apellido1 varchar(45) not null,
   per_apellido2 varchar(45),
   per_edad int,
   per_nacimiento date not null,
   per_dni varchar(9) not null,
   per_sexo enum('H', 'M'),
   per_telefono varchar(20) not null,
   primary key PER_PK (per_codper)
);


-- Tabla hombres_jovenes:
-- • hoj_codper (entero sin signo y PK)
-- • hoj_nombre (cadena de caracteres y NN)
-- • hoj_apellido1 (cadena de caracteres y NN)
-- • hoj_apellido2 (cadena de caracteres)
-- • hoj_edad (entero)


create table hombres_jovenes (
   hoj_codper int unsigned,
   hoj_nombre varchar(45) not null,
   hoj_apellido1 varchar(45) not null,
   hoj_apellido2 varchar(45),
   hoj_edad int,
   primary key HOJ_PK (hoj_codper)
);


-- Tabla hombres_adultos:
-- • hoa_codper (entero sin signo y PK)
-- • hoa_nombre (cadena de caracteres y NN)
-- • hoa_apellido1 (cadena de caracteres y NN)
-- • hoa_apellido2 (cadena de caracteres)
-- • hoa_edad (entero)


create table hombres_adultos (
   hoa_codper int unsigned,
   hoa_nombre varchar(45) not null,
   hoa_apellido1 varchar(45) not null,
   hoa_apellido2 varchar(45),
   hoa_edad int,
   primary key HOA_PK (hoa_codper)
);


-- Tabla hombres_mayores:
-- • hom_codper (entero sin signo y PK)
-- • hom_nombre (cadena de caracteres y NN)
-- • hom_apellido1 (cadena de caracteres y NN)
-- • hom_apellido2 (cadena de caracteres)
-- • hom_edad (entero)


create table hombres_mayores (
   hom_codper int unsigned,
   hom_nombre varchar(45) not null,
   hom_apellido1 varchar(45) not null,
   hom_apellido2 varchar(45),
   hom_edad int,
   primary key HOM_PK (hom_codper)
);


-- Tabla mujeres_jovenes:
-- • muj_codper (entero sin signo y PK)
-- • muj_nombre (cadena de caracteres y NN)
-- • muj_apellido1 (cadena de caracteres y NN)
-- • muj_apellido2 (cadena de caracteres)
-- • muj_edad (entero)


create table mujeres_jovenes (
   muj_codper int unsigned,
   muj_nombre varchar(45) not null,
   muj_apellido1 varchar(45) not null,
   muj_apellido2 varchar(45),
   muj_edad int,
   primary key MUJ_PK (muj_codper)
);


-- Tabla mujeres_adultas:
-- • mua_codper (entero sin signo y PK)
-- • mua_nombre (cadena de caracteres y NN)
-- • mua_apellido1 (cadena de caracteres y NN)
-- • mua_apellido2 (cadena de caracteres)
-- • mua_edad (entero)


create table mujeres_adultas (
   mua_codper int unsigned,
   mua_nombre varchar(45) not null,
   mua_apellido1 varchar(45) not null,
   mua_apellido2 varchar(45),
   mua_edad int,
   primary key MUA_PK (mua_codper)
);


-- Tabla mujeres_mayores:
-- • mum_codper (entero sin signo y PK)
-- • mum_nombre (cadena de caracteres y NN)
-- • mum_apellido1 (cadena de caracteres y NN)
-- • mum_apellido2 (cadena de caracteres)
-- • mum_edad (entero)


create table mujeres_mayores (
   mum_codper int unsigned,
   mum_nombre varchar(45) not null,
   mum_apellido1 varchar(45) not null,
   mum_apellido2 varchar(45),
   mum_edad int,
   primary key MUM_PK (mum_codper)
);


-- Una vez creadas las tablas, escribe los siguientes triggers con las
-- siguientes características:

-- • Trigger 1: check_nombre_y_apellidos
-- o Se ejecuta sobre la tabla personas.
-- o Los campos de los nombres y de los apellidos, nos vengan como
-- nos vengan, han de almacenarse capitalizados, es decir, con la
-- primera letra en mayúscula y las demás en minúsculas.


delimiter //
create trigger check_nombre_y_apellidos_insert before insert
on personas for each row
begin

   set new.per_nombre    = concat(upper(substr(new.per_nombre,1,1)),   lower(substr(new.per_nombre,2)));
   set new.per_apellido1 = concat(upper(substr(new.per_apellido1,1,1)),lower(substr(new.per_apellido1,2)));
   set new.per_apellido2 = concat(upper(substr(new.per_apellido2,1,1)),lower(substr(new.per_apellido2,2)));

end //
delimiter ;


delimiter //
create trigger check_nombre_y_apellidos_update before update
on personas for each row
begin

   set new.per_nombre = concat(upper(substr(new.per_nombre,1,1)),lower(substr(new.per_nombre,2)));
   set new.per_apellido1 = concat(upper(substr(new.per_apellido1,1,1)),lower(substr(new.per_apellido1,2)));
   set new.per_apellido2 = concat(upper(substr(new.per_apellido2,1,1)),lower(substr(new.per_apellido2,2)));

end //
delimiter ;


-- Realiza un par de pruebas para verificar el correcto funcionamiento de
-- este trigger en concreto.


insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (1, 'CRISTINA', 'lópez', 'santaMaríA', 30, '1991-05-15', '12345678A', 'M', '607000000');

insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (2, 'GABRIELA', 'fernández', null, 30, '1991-05-15', '12345678A', 'M', '607000000');

select * from personas;

update personas
set    per_apellido2 = 'SANJUAN'
where  per_codper = 1;


-- • Trigger 2: check_edad_correcta
-- o Se ejecuta sobre la tabla personas.
-- o Si la edad introducida no coincide con la edad calculada a partir
-- de la fecha de nacimiento, entonces almacenaremos la
-- calculada.


delimiter //
create trigger check_edad_correcta_insert before insert
on personas for each row
begin
   if new.per_edad != truncate(datediff(now(), new.per_nacimiento)/365.25,0) then
      set new.per_edad = truncate(datediff(now(), new.per_nacimiento)/365.25,0);
   end if;
end //
delimiter ;


delimiter //
create trigger check_edad_correcta_update before update
on personas for each row
begin
   if new.per_edad != truncate(datediff(now(), new.per_nacimiento)/365.25,0) then
      set new.per_edad = truncate(datediff(now(), new.per_nacimiento)/365.25,0);
   end if;
end //
delimiter ;


-- Realiza un par de pruebas para verificar el correcto funcionamiento de este
-- trigger en concreto.


select truncate(datediff(now(), '2002-05-25')/365.25,0);

insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (3, 'pau', 'tornero', 'laliga', 30, '2002-05-25', '12345678A', 'M', '607000000');

update personas
set    per_edad = 25
where  per_codper = 3;

select * from personas;


-- • Trigger 3: check_dni
-- o Se ejecuta sobre la tabla personas.
-- o El DNI ha de acabar con una letra, en caso contrario
-- almacenaremos el valor “00000000T” (ocho ceros y una T)


delimiter //
create trigger check_dni_insert before insert
on personas for each row
begin
   
   if upper(right(new.per_dni,1)) not in ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z') then
      set new.per_dni = '00000000T';
   end if;

end //
delimiter ;


delimiter //
create trigger check_dni_updte before update
on personas for each row
begin
   
   if upper(right(new.per_dni,1)) not in ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z') then
      set new.per_dni = '00000000T';
   end if;

end //
delimiter ;


-- Realiza un par de pruebas para verificar el correcto funcionamiento de este
-- trigger en concreto.


insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (4, 'alguie', 'sin', 'nombre', 30, '2000-05-25', '12345678', 'M', '607000000');

update personas
set    per_dni = '25123546'
where  per_codper = 3;

select * from personas;


-- • Trigger 4: log_sexo_y_edad
-- o Se ejecuta sobre la tabla personas.
-- o En función del sexo y la edad, se ha de replicar la información
-- en el resto de las tablas, de la siguiente manera:
-- ▪ H y [0,18) en hombres_jovenes
-- ▪ H y [18,65) en hombres_adultos
-- ▪ H y [65,200] en hombres_mayores
-- ▪ M y [0,18) en mujeres_jovenes
-- ▪ M y [18,65) en mujeres_adultas
-- ▪ M y [65,200] en mujeres_mayores


delimiter //
create trigger log_sexo_y_edad_insert after insert
on personas for each row
begin
   if new.per_sexo = 'H' and new.per_edad >= 0 and new.per_edad < 18 then
      insert into hombres_jovenes (hoj_codper, hoj_nombre, hoj_apellido1, hoj_apellido2, hoj_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif new.per_sexo = 'H' and new.per_edad >= 18 and new.per_edad < 65 then
      insert into hombres_adultos (hoa_codper, hoa_nombre, hoa_apellido1, hoa_apellido2, hoa_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif new.per_sexo = 'H' and new.per_edad > 65 then
      insert into hombres_mayores (hom_codper, hom_nombre, hom_apellido1, hom_apellido2, hom_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif new.per_sexo = 'M' and new.per_edad >= 0 and new.per_edad < 18 then
      insert into mujeres_jovenes (muj_codper, muj_nombre, muj_apellido1, muj_apellido2, muj_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif new.per_sexo = 'M' and new.per_edad >= 18 and new.per_edad < 65 then
      insert into mujeres_adultas (mua_codper, mua_nombre, mua_apellido1, mua_apellido2, mua_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif new.per_sexo = 'M' and new.per_edad > 65 then
      insert into mujeres_mayores (mum_codper, mum_nombre, mum_apellido1, mum_apellido2, mum_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   end if;
end //
delimiter ;


delimiter //cache index
create trigger log_sexo_y_edad_update after update
on personas for each row
begin
   if (new.per_sexo = 'H' or old.per_sexo = 'H') and new.per_edad >= 0 and new.per_edad < 18 then
      insert into hombres_jovenes (hoj_codper, hoj_nombre, hoj_apellido1, hoj_apellido2, hoj_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif (new.per_sexo = 'H' or old.per_sexo = 'H') and new.per_edad >= 18 and new.per_edad < 65 then
      insert into hombres_adultos (hoa_codper, hoa_nombre, hoa_apellido1, hoa_apellido2, hoa_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif (new.per_sexo = 'H' or old.per_sexo = 'H') and new.per_edad > 65 then
      insert into hombres_mayores (hom_codper, hom_nombre, hom_apellido1, hom_apellido2, hom_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif (new.per_sexo = 'M' or old.per_sexo = 'M') and new.per_edad >= 0 and new.per_edad < 18 then
      insert into mujeres_jovenes (muj_codper, muj_nombre, muj_apellido1, muj_apellido2, muj_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif (new.per_sexo = 'M' or old.per_sexo = 'M') and new.per_edad >= 18 and new.per_edad < 65 then
      insert into mujeres_adultas (mua_codper, mua_nombre, mua_apellido1, mua_apellido2, mua_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   elseif (new.per_sexo = 'M' or old.per_sexo = 'M') and new.per_edad > 65 then
      insert into mujeres_mayores (mum_codper, mum_nombre, mum_apellido1, mum_apellido2, mum_edad)
      values (new.per_codper, new.per_nombre, new.per_apellido1, new.per_apellido2, new.per_edad);
   end if;
end //
delimiter ;


-- Realiza un par de pruebas para verificar el correcto funcionamiento de este
-- trigger en concreto.


insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (5, 'cris', 'font', 'gelaBERT', 10, '2000-05-25', '12345678G', 'M', '607000000');

update personas
set    per_nacimiento = '1950-05-25'
where  per_codper = 3;

select * from personas;

select * from mujeres_jovenes;
select * from mujeres_adultas;

select * from hombres_jovenes;
select * from hombres_adultos;
select * from hombres_mayores;


-- Una vez creados todos los triggers, realiza varias pruebas para provocar la
-- ejecución de más de un trigger a la vez, es decir, que se disparen varios triggers
-- simultáneamente y verifica que se están ejecutando correctamente.


insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (6, 'nomBRE', 'CON', 'aPeLLiDo', 10, '2000-01-01', '12345', 'M', '607000000');

update personas
set    per_nacimiento = '1950-05-25'
where  per_codper = 3;

select * from personas;

select * from mujeres_adultas;


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- 2. En la misma BD del ejercicio anterior, crea una tabla con las siguientes
-- características:

-- Tabla historico_personas, no dispondrá de PK:
-- • hip_codper (entero sin signo)
-- • hip_old_nombre (cadena de caracteres)
-- • hip_new_nombre (cadena de caracteres)
-- • hip_old_apellido1 (cadena de caracteres)
-- • hip_new_apellido1 (cadena de caracteres)
-- • hip_old_apellido2 (cadena de caracteres)
-- • hip_new_apellido2 (cadena de caracteres)
-- • hip_old_edad (entero)
-- • hip_new_edad (entero)
-- • hip_old_nacimiento (fecha)
-- • hip_new_nacimiento (fecha)
-- • hip_old_dni (cadena de caracteres)
-- • hip_new_dni (cadena de caracteres)
-- • hip_old_sexo (‘H’, ‘M’)
-- • hip_new_sexo (‘H’, ‘M’)
-- • hip_old_telefono (cadena de caracteres de longitud 20)
-- • hip_new_telefono (cadena de caracteres de longitud 20)
-- • hip_operacion (‘I’, ‘U’, ‘D’)
-- • hip_momento_cambio (fecha y hora)


create table historico_personas (
   hip_codper int unsigned,
   hip_old_nombre varchar(45),
   hip_new_nombre varchar(45),
   hip_old_apellido1 varchar(45),
   hip_new_apellido1 varchar(45),
   hip_old_apellido2 varchar(45),
   hip_new_apellido2 varchar(45),
   hip_old_edad int,
   hip_new_edad int,
   hip_old_nacimiento date,
   hip_new_nacimiento date,
   hip_old_dni varchar(9),
   hip_new_dni varchar(9),
   hip_old_sexo enum('H', 'M'),
   hip_new_sexo enum('H', 'M'),
   hip_old_telefono varchar(20),
   hip_new_telefono varchar(20),
   hip_operacion enum('I', 'U', 'D'),
   hip_momento_cambio datetime
);


-- Una vez creada la tabla, escribe los siguientes triggers con las siguientes
-- características:

-- • Trigger 5: log_historico_inserciones
-- o Se ejecuta sobre la tabla personas.
-- o Cada vez que se inserte alguna persona debe quedar constancia
-- en la tabla historico_personas, indicando I (de INSERT)
-- en hip_operacion.
delimiter //
create trigger log_historico_inserciones after insert
on personas for each row
begin
   
   insert into historico_personas (hip_codper,
                                   hip_old_nombre, hip_new_nombre,
                                   hip_old_apellido1, hip_new_apellido1,
                                   hip_old_apellido2, hip_new_apellido2,
                                   hip_old_edad, hip_new_edad,
                                   hip_old_nacimiento, hip_new_nacimiento,
                                   hip_old_dni, hip_new_dni,
                                   hip_old_sexo, hip_new_sexo,
                                   hip_old_telefono, hip_new_telefono,
								   hip_operacion,
                                   hip_momento_cambio)
   values (new.per_codper,
           null, new.per_nombre,
           null, new.per_apellido1,
           null, new.per_apellido2,
           null, new.per_edad,
           null, new.per_nacimiento,
           null, new.per_dni,
           null, new.per_sexo,
           null, new.per_telefono,
           'I',
           now()
   );

end //
delimiter ;


insert into personas (per_codper, per_nombre, per_apellido1, per_apellido2, per_edad, per_nacimiento, per_dni, per_sexo, per_telefono)
values (8, 'manuel', 'gonzález', 'liras', 10, '2000-01-01', '12345678M', 'H', '607000000');


select * from personas;
select * from historico_personas;


-- • Trigger 6: log_historico_modificaciones
-- o Se ejecuta sobre la tabla personas.
-- o Cada vez que se modifique algún campo debe quedar constancia
-- en la tabla historico_personas, indicando U (de UPDATE)
-- en hip_operacion.


delimiter //
create trigger log_historico_modificaciones after update
on personas for each row
begin
   
   insert into historico_personas (hip_codper,
                                   hip_old_nombre, hip_new_nombre,
                                   hip_old_apellido1, hip_new_apellido1,
                                   hip_old_apellido2, hip_new_apellido2,
                                   hip_old_edad, hip_new_edad,
                                   hip_old_nacimiento, hip_new_nacimiento,
                                   hip_old_dni, hip_new_dni,
                                   hip_old_sexo, hip_new_sexo,
                                   hip_old_telefono, hip_new_telefono,
								   hip_operacion,
                                   hip_momento_cambio)
   values (new.per_codper,
           old.per_nombre, new.per_nombre,
           old.per_apellido1, new.per_apellido1,
           old.per_apellido2, new.per_apellido2,
           old.per_edad, new.per_edad,
           old.per_nacimiento, new.per_nacimiento,
           old.per_dni, new.per_dni,
           old.per_sexo, new.per_sexo,
           old.per_telefono, new.per_telefono,
           'U',
           now()
   );

end //
delimiter ;


update personas
set    per_sexo = 'H'
,      per_dni = '98745632R'
where  per_codper = 2;

select * from personas;
select * from historico_personas;


-- • Trigger 7: log_historico_borrados
-- o Se ejecuta sobre la tabla personas.
-- o Cada vez que se elimine alguna persona debe quedar constancia
-- en la tabla historico_personas, indicando D (de DELETE)
-- en hip_operacion.


delimiter //
create trigger log_historico_borrados before delete
on personas for each row
begin
   
   insert into historico_personas (hip_codper,
                                   hip_old_nombre, hip_new_nombre,
                                   hip_old_apellido1, hip_new_apellido1,
                                   hip_old_apellido2, hip_new_apellido2,
                                   hip_old_edad, hip_new_edad,
                                   hip_old_nacimiento, hip_new_nacimiento,
                                   hip_old_dni, hip_new_dni,
                                   hip_old_sexo, hip_new_sexo,
                                   hip_old_telefono, hip_new_telefono,
								   hip_operacion,
                                   hip_momento_cambio)
   values (old.per_codper,
           old.per_nombre, null,
           old.per_apellido1, null,
           old.per_apellido2, null,
           old.per_edad, null,
           old.per_nacimiento, null,
           old.per_dni, null,
           old.per_sexo, null,
           old.per_telefono, null,
           'D',
           now()
   );

end //
delimiter ;


delete from personas where per_codper = 8;

select * from personas;
select * from historico_personas;


-- Una vez creados los triggers, realiza varias pruebas de inserción, modificación y
-- borrado y verifica que se están ejecutando correctamente.
