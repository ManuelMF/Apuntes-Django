drop database test_triggers_1;
create database test_triggers_1;
use test_triggers_1;
create table alumnos (
alu_codalu int unsigned primary key,
alu_nombre varchar(90) not null ,
alu_apellido1 varchar(90) not null ,
alu_apellido2 varchar(90) not null ,
alu_nota double not null 
);

-- Trigger 1
delimiter //
create trigger trigger_check_nota_before_insert before insert
on alumnos for each row
begin
	if new.alu_nota<0 then
		set new.alu_nota=0;
    
    elseif new.alu_nota>10 then
		set new.alu_nota=10;
    end if;
end //
delimiter ;

insert into alumnos (alu_codalu,alu_nombre,alu_apellido1,alu_apellido2,alu_nota) values (0,"Pep","Lluis","Ruidala",-5);
insert into alumnos (alu_codalu,alu_nombre,alu_apellido1,alu_apellido2,alu_nota) values (1,"Loko","Lluis","Ruidala",15);
select * from alumnos;

-- Trigger 2
delimiter //
create trigger trigger_check_nota_before_update before update
on alumnos for each row
begin
	if new.alu_nota<0 then
		set new.alu_nota=0;
    
    elseif new.alu_nota>10 then
		set new.alu_nota=10;
    end if;
end //
delimiter ;

-- test trigger 2
drop database test_trigger_2;
create database test_trigger_2;
use test_trigger_2;

create table alumnos (
alu_codalu int unsigned primary key,
alu_nombre varchar(90) not null ,
alu_apellido1 varchar(90) not null ,
alu_apellido2 varchar(90) not null ,
alu_nota double not null,
alu_email varchar(160) 
);

drop procedure if exists generar_email;
-- generar email
delimiter //
create procedure generar_email(in nombre varchar(90), in ape varchar(90), in ape2 varchar(150), in dominio varchar(15),out email varchar(160))
begin 
	set email = concat( nombre,substring(ape,1,3),substring(ape2,1,3),"@",dominio);
    
end //
delimiter ;
call generar_email("Manuel","Muñoz","Felix","SantJosepObrer.com",@email);


-- trigger_crear_email_before_insert
delimiter //
create trigger trigger_crear_email_before_insert before insert
on alumnos for each row
begin
	if new.alu_email is null then
		call generar_email(new.alu_nombre, new.alu_apellido1, new.alu_apellido2,"@gmail.com",@email);
		set new.alu_email=@email;
    end if;
   
end //
delimiter ;

insert into alumnos(alu_codalu,alu_nombre,alu_apellido1,alu_apellido2,alu_nota,alu_email) values (57,"Manuel","Muñoz","Sardina",10,"asfasf");
select * from alumnos;

-- 3
-- trigger_guardar_email_after_update
create table log_cambios_email(
lce_codlce int unsigned primary key auto_increment,
lce_codalu int unsigned not null,
lce_fecha_hora datetime not null,
lce_old_email varchar(150),
lce_new_email varchar(150)
);

delimiter //
create trigger trigger_guardar_email_after_update after update
on alumnos for each row
begin 
	insert into log_cambios_email(lce_codalu,lce_fecha_hora,lce_old_email,lce_new_email)
    values (new.alu_codalu,now(),old.alu_email,new.alu_email);
end //
delimiter ;

select * from alumnos;
update alumnos set alu_apellido1 = "agsag" where alu_codalu=3;
select * from log_cambios_email;

-- guardar alumnos eliminados
create table log_alumnos_eliminados(
lae_codlae int unsigned primary key auto_increment,
lae_codalu int unsigned not null,
lae_fecha_hora datetime not null,
lae_nombre varchar(90) not null,
lae_apellido1 varchar(90) not null,
lae_apellido2 varchar(90) not null,
lae_email varchar(90) not null
);

delimiter //
create trigger trigger_guardar_alumnos_eliminados after delete
on alumnos for each row
begin
	insert into log_alumnos_eliminados(lae_codalu,lae_fecha_hora,lae_nombre,lae_apellido1,lae_apellido2,lae_email)
    values (old.alu_codalu,now(),old.alu_nombre,old.alu_apellido1,old.alu_apellido2,old.alu_email);
end //
delimiter ;

select * from log_alumnos_eliminados;
delete from alumnos where alu_codalu=3;