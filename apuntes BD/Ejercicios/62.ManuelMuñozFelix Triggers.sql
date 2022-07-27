drop database test_triggers_3;
create database test_triggers_3;
use test_triggers_3;
-- crear tablas
create table personas (
per_codper int unsigned primary key auto_increment,
per_nombre varchar(45) not null,
per_apellido1 varchar(45) not null,
per_apellido2 varchar(45),
per_edad int,
per_nacimiento date not null,
per_dni varchar(14) not null,
per_sexo varchar(1),
per_telefono varchar(20) 
);

create table hombres_jovenes(
hoj_codper int unsigned primary key auto_increment,
hoj_nombres varchar(45) not null,
hoj_apellido1 varchar(45) not null,
hoj_apellido2 varchar(45),
hoj_edad int
);

create table hombres_adultos(
hoa_codper int unsigned primary key auto_increment,
hoa_nombres varchar(45) not null,
hoa_apellido1 varchar(45) not null,
hoa_apellido2 varchar(45),
hoa_edad int
);

create table hombres_mayores(
mua_codper int unsigned primary key auto_increment,
mua_nombres varchar(45) not null,
mua_apellido1 varchar(45) not null,
mua_apellido2 varchar(45),
mua_edad int
);

create table mujeres_jovenes(
mua_codper int unsigned primary key auto_increment,
mua_nombres varchar(45) not null,
mua_apellido1 varchar(45) not null,
mua_apellido2 varchar(45),
mua_edad int
);

create table mujeres_adultas( 
mum_codper int unsigned primary key auto_increment,
mum_nombres varchar(45) not null,
mum_apellido1 varchar(45) not null,
mum_apellido2 varchar(45),
mum_edad int
);
create table mujeres_mayores(
mua_codper int unsigned primary key auto_increment,
mua_nombres varchar(45) not null,
mua_apellido1 varchar(45) not null,
mua_apellido2 varchar(45),
mua_edad int
);
-- trigers 

-- • Trigger 1: check_nombre_y_apellidos
delimiter //
create trigger check_nombre_y_apellidos before insert
on personas for each row
begin
	declare priMayus varchar(10);
	declare rest varchar(45);

	-- nom
	set priMayus = UPPER(substring(new.per_nombre,1,1));
    set rest = LOWER(substring(new.per_nombre,2,length(new.per_nombre)));
    set new.per_nombre = concat(priMayus,rest);
    
    -- ape 1
	set priMayus = UPPER(substring(new.per_apellido1,1,1));
    set rest = LOWER(substring(new.per_apellido1,2,length(new.per_apellido1)));
    set new.per_apellido1 = concat(priMayus,rest);
    
    -- ape 2
	set priMayus = UPPER(substring(new.per_apellido2,1,1));
    set rest = LOWER(substring(new.per_apellido2,2,length(new.per_apellido2)));
    set new.per_apellido2 = concat(priMayus,rest);
end //
delimiter ;

insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,now(),"43483691Y","H","601351487");
select * from personas;

-- Trigger 2: check_edad_correcta
delimiter //
create trigger check_edad_correcta before insert
on personas for each row
begin
	if new.per_edad+year(new.per_nacimiento) !=  year(now()) then 
		set new.per_edad = year(now())-year(new.per_nacimiento);
    end if;
end //
delimiter ;
insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"2000-01-01","43483691Y","H","601351487");
select * from personas;

-- Trigger 3: check_dni
delimiter //
create trigger check_dni before insert
on personas for each row
begin
	if substring(new.per_dni,9,10) between "0" and "9" then 
		set new.per_dni = "00000000T";
    end if;
end //
delimiter ;

insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"2000-01-01","434836914","H","601351487");
insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"2000-01-01","43483691F","H","601351487");
select * from personas;

-- Trigger 4: log_sexo_y_edad
delimiter //
create trigger log_sexo_y_edad before insert
on personas for each row
begin 
	if new.per_sexo = "H" then
		if new.per_edad between 0 and 18 then 
			insert into hombres_jovenes values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
        if new.per_edad between 18 and 65 then 
			insert into hombres_adultos values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
        if new.per_edad between 65 and 200 then 
			insert into hombres_mayores values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
    end if;
    if new.per_sexo = "M" then
		if new.per_edad between 0 and 18 then 
			insert into mujeres_jovenes values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
        if new.per_edad between 18 and 65 then 
			insert into mujeres_adultas values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
        if new.per_edad between 65 and 200 then 
			insert into mujeres_mayores values (new.per_codper,new.per_nombre, new.per_apellido1,new.per_apellido2, new.per_edad);
        end if;
    end if;
end //
delimiter ;

insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"1980-01-01","434836914","M","601351487");
select * from mujeres_adultas;
select * from personas;

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
hip_codper int unsigned default 1,
hip_old_nombre varchar(90),
hip_new_nombre varchar(90),
hip_old_apellido1 varchar(90),
hip_new_apellido1 varchar(90),
hip_old_apellido2 varchar(90),
hip_new_apellido2 varchar(90),
hip_old_edad int,
hip_new_edad int,
hip_old_nacimiento date,
hip_new_nacimiento date,
hip_old_dni varchar(90),
hip_new_dni varchar(90),
hip_old_sexo varchar(1) check (hip_old_sexo in ("H","M")),
hip_new_sexo varchar(1) check (hip_new_sexo in ("H","M")),
hip_old_telefono varchar(20),
hip_new_telefono varchar(20),
hip_operacion varchar(1) check (hip_operacion in ("I","U","D")),
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
 declare PK int default 1;
 if (select max(hip_codper) from historico_personas)>0 then set PK = (select max(hip_codper) from historico_personas)+1; end if;
 insert into historico_personas (hip_codper,hip_old_nombre,hip_old_apellido1,hip_old_apellido2,hip_old_edad,hip_old_nacimiento,hip_old_dni,hip_old_sexo,hip_old_telefono,hip_operacion,hip_momento_cambio) 
 values (PK,new.per_nombre,new.per_apellido1,new.per_apellido2,new.per_edad,new.per_nacimiento,new.per_dni,new.per_sexo,new.per_telefono,"I",now());
end //
delimiter ;

insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"1980-01-01","434836914","M","601351487");
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
	declare PK int default 1;
	if (select max(hip_codper) from historico_personas)>0 then set PK = (select max(hip_codper) from historico_personas)+1; end if;
    insert into historico_personas (hip_codper,hip_old_nombre,hip_old_apellido1,hip_old_apellido2,hip_old_edad,hip_old_nacimiento,hip_old_dni,hip_old_sexo,hip_old_telefono,hip_operacion,hip_momento_cambio
     ,hip_new_nombre,hip_new_apellido1,hip_new_apellido2,hip_new_edad,hip_new_nacimiento,hip_new_dni,hip_new_sexo,hip_new_telefono) 
	values (PK,old.per_nombre,old.per_apellido1,old.per_apellido2,old.per_edad,old.per_nacimiento,old.per_dni,old.per_sexo,old.per_telefono,"U",now()
	,new.per_nombre,new.per_apellido1,new.per_apellido2,new.per_edad,new.per_nacimiento,new.per_dni,new.per_sexo,new.per_telefono  );
end //
delimiter ;

update personas set per_nombre = "Manolo" where per_codper=2;
select * from historico_personas;

-- • Trigger 7: log_historico_borrados
-- o Se ejecuta sobre la tabla personas.
-- o Cada vez que se elimine alguna persona debe quedar constancia
-- en la tabla historico_personas, indicando D (de DELETE)
-- en hip_operacion.

delimiter //
create trigger log_historico_borrados after delete
on personas for each row
begin
	declare PK int default 1;
	if (select max(hip_codper) from historico_personas)>0 then set PK = (select max(hip_codper) from historico_personas)+1; end if;
    insert into historico_personas (hip_codper,hip_old_nombre,hip_old_apellido1,hip_old_apellido2,hip_old_edad,hip_old_nacimiento,hip_old_dni,hip_old_sexo,hip_old_telefono,hip_operacion,hip_momento_cambio) 
	values (PK,old.per_nombre,old.per_apellido1,old.per_apellido2,old.per_edad,old.per_nacimiento,old.per_dni,old.per_sexo,old.per_telefono,"D",now());
end //
delimiter ;

delete from personas where per_codper=1;
-- Una vez creados los triggers, realiza varias pruebas de inserción, modificación y
-- borrado y verifica que se están ejecutando correctamente.

insert into personas(per_nombre,per_apellido1,per_apellido2,per_edad,per_nacimiento,per_dni,per_sexo,per_telefono) values
("vIcktor","jImeNez","ruEDA",4,"1980-01-01","434836914","M","601351487");
update personas set per_nombre = "Juan" where per_codper=1;
delete from personas where per_codper=1;