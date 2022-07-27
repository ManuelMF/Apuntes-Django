
-- 1. Crea el script DDL para la creación del esquema de BD.
-- ---------------------------------------------------------

-- Creamos la base de datos
create database biblioteca;

-- Indicamos que vamos a usar la BD
use biblioteca;

-- Creamos las tablas

-- Tabla libros
create table libros (
   lib_codlib int not null auto_increment,
   lib_titulo varchar(45) not null,
   lib_autor varchar(90) not null,
   lib_paginas int not null,
   primary key LIB_PK (lib_codlib)
);

-- Tabla socios
create table socios (
   soc_codsoc int not null auto_increment,
   soc_nombre varchar(90) not null,
   soc_telefono varchar(15) not null,
   primary key SOC_PK (soc_codsoc)
);

-- Tabla prestamos
create table prestamos (
   pre_codlib int not null,
   pre_codsoc int not null,
   pre_fecha_prestamo  date not null,
   pre_fecha_devolucion date,
   primary key PRE_PK (pre_codlib, pre_codsoc, pre_fecha_prestamo)
);

-- FKs
alter table prestamos add foreign key PRE_LIB_FK (pre_codlib) references libros(lib_codlib);
alter table prestamos add foreign key PRE_SOC_FK (pre_codsoc) references socios(soc_codsoc);



-- 2. Crea un script DML para insertar los siguientes datos en nuestra BD.
-- -----------------------------------------------------------------------

set autocommit = false;

-- Tabla libros
insert into libros (lib_titulo,lib_autor,lib_paginas) values("La Lección","Eugène Ionesco",155);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("El libro de la repostería","Ángela Landa",166);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("Hamlet","William Shakespeare",150);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("Discurso del método","René Descartes",182);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("El libro de arena","José Luis Borges",121);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("Una dama en apuros","Tom Sharpe",255);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("La República o el Estado","Platón",303);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("Job","Joseph Roth",189);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("El viejo y el mar","Ernest Hemingwey",154);
insert into libros (lib_titulo,lib_autor,lib_paginas) values("En las profundidades","Arthur Charles Clarke",196);

-- Tabla socios
insert into socios (soc_nombre,soc_telefono) values("Juan Perez Lozano",617315863);
insert into socios (soc_nombre,soc_telefono) values("Luis Romero Sanchez",959253987);
insert into socios (soc_nombre,soc_telefono) values("Pedro Lopez Rojas",954553153);
insert into socios (soc_nombre,soc_telefono) values("Santiago Gonzalez Lleida",954435993);
insert into socios (soc_nombre,soc_telefono) values("Fernando Domingo Gomez",955634281);
insert into socios (soc_nombre,soc_telefono) values("Luis Daza Zamora",954435113);
insert into socios (soc_nombre,soc_telefono) values("Antonio Ossorio Melgar",609257167);
insert into socios (soc_nombre,soc_telefono) values("Javier Romero Gonzalez",617583100);

-- Tabla prestamos 
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(8,8,"2020-05-02","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(4,8,"2020-04-21","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(4,1,"2020-03-15","2020-04-19");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(1,2,"2020-04-30","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(8,3,"2020-05-08","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(5,3,"2020-01-15","2020-01-19");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(5,3,"2020-01-22","2020-01-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(5,3,"2020-02-02","2020-02-15");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(4,7,"2020-03-15","2020-03-18");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(4,7,"2020-04-05","2020-04-20");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(1,7,"2020-05-06","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(3,2,"2020-05-10","2020-12-31");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(5,2,"2020-05-01","2020-12-31");

commit;



-- 3. Inserta 5 préstamos realizados este año 2021, pero sin fecha de devolución.
-- ------------------------------------------------------------------------------

insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(2,4,"2021-05-02",null);
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(3,5,"2021-04-21",null);
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(4,4,"2021-03-15",null);
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(5,5,"2021-04-30",null);
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo,pre_fecha_devolucion) values(6,5,"2021-05-08",null);

commit;



-- 4. Genera el script DDL para crear una vista, a la que llamaremos
-- libros_sin_devolver, que contenga
--    el título del libro
--    su autor
--    el nombre del socio
--    su teléfono
--    la fecha en que dicho socio se llevó el libro
-- de todos aquellos libros que actualmente no se encuentran en la biblioteca.
-- ---------------------------------------------------------------------------

create view libros_sin_devolver (lsd_titulo, lsd_autor, lsd_nombre, lsd_telefono, lsd_fecha_prestamo) as
select lib_titulo
,      lib_autor
,      soc_nombre
,      soc_telefono
,      pre_fecha_prestamo
from   libros
,      socios
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
and    pre_fecha_devolucion is null;



-- 5. Crea la consulta correspondiente para comprobar que la información
-- contenida en la vista es correcta. ¿Cuántos registros aparecen?
-- ---------------------------------------------------------------------

select * from libros_sin_devolver;
-- Aparecen 5 registros.



-- 6. De los 5 préstamos añadidos en el tercer apartado, marca como devueltos
-- un par de libros.
-- --------------------------------------------------------------------------

update prestamos
set    pre_fecha_devolucion = now()
where  pre_codlib = 2
and    pre_codsoc = 4
and    pre_fecha_prestamo = '2021-05-02';

commit;

update prestamos
set    pre_fecha_devolucion = now()
where  pre_codlib = 3
and    pre_codsoc = 5
and    pre_fecha_prestamo = '2021-04-21';

commit;



-- 7. Crea la consulta correspondiente para volver a comprobar que la información
-- contenida en la vista se ha actualizado y es correcta. ¿Cuántos registros
-- aparecen?
-- ------------------------------------------------------------------------------

select * from libros_sin_devolver;
-- Aparecen 3 registros.



-- 8. Genera el script DDL para crear una vista, a la que llamaremos
-- libros_devueltos, que contenga
--    el título del libro
--    su autor
--    el nombre del socio
--    su teléfono
--    la fecha en que dicho socio se llevó el libro
--    la fecha en que lo devolvió
-- de todos aquellos libros que actualmente sí se encuentran en la biblioteca.
-- ---------------------------------------------------------------------------

create view libros_devueltos (lde_titulo, lde_autor, lde_nombre, lde_telefono, lde_fecha_prestamo, lde_fecha_devolucion) as
select lib_titulo
,      lib_autor
,      soc_nombre
,      soc_telefono
,      pre_fecha_prestamo
,      pre_fecha_devolucion
from   libros
,      socios
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
and    pre_fecha_devolucion is not null;



-- 9. Realiza las siguientes consultas sobre la vista libros_devueltos:
-- --------------------------------------------------------------------

-- 9.1) Devuelve el título de cada libro y cuántas veces ha sido prestado. Ordena el
-- resultado de mayor a menor.

select lde_titulo 'Libro'
,      count(*)
from   libros_devueltos
group  by lde_titulo
order  by count(*) desc;


-- 9.2) Devuelve el nombre de cada socio y cuántos préstamos ha realizado en
-- total. Ordena el resultado de mayor a menor.

select lde_nombre 'Socio'
,      count(*)
from   libros_devueltos
group  by lde_nombre
order  by count(*) desc;


-- 9.3) Devuelve el título del libro que ha sido prestado más recientemente y el
-- nombre del socio.

-- Versión con ORDER BY
select lde_titulo 'Libro'
,      lde_nombre 'Socio'
from   libros_devueltos
order  by lde_fecha_prestamo desc limit 1;

-- Versión con SUBCONSULTAS
select lde_titulo 'Libro'
,      lde_nombre 'Socio'
from   libros_devueltos
where  lde_fecha_prestamo = (select max(lde_fecha_prestamo)
							 from   libros_devueltos);


-- 9.4) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos realizados en mayo de 2020.
-- Ordena el resultado de forma cronológica por la fecha del préstamo.
select lde_nombre           'Socio'
,      lde_titulo           'Libro'
,      lde_fecha_prestamo   'Préstamo'
,      lde_fecha_devolucion 'Devolución'
from   libros_devueltos
where  year(lde_fecha_prestamo) = 2020
and    month(lde_fecha_prestamo) = 5;


-- 9.5) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos que han tenido una duración
-- superior a 10 días.

select lde_nombre           'Socio'
,      lde_titulo           'Libro'
,      lde_fecha_prestamo   'Préstamo'
,      lde_fecha_devolucion 'Devolución'
from   libros_devueltos
where  datediff(lde_fecha_devolucion, lde_fecha_prestamo) > 10;



-- 10.Realiza las mismas consultas del apartado anterior, pero sin utilizar la vista
-- libros_devueltos, es decir, usando las tablas originales libros,
-- socios y prestamos.
-- ---------------------------------------------------------------------------------

-- 10.1) Devuelve el título de cada libro y cuántas veces ha sido prestado. Ordena el
-- resultado de mayor a menor.

select lde_titulo 'Libro'
,      count(*)
from   libros_devueltos
group  by lde_titulo
order  by count(*) desc;


-- 10.2) Devuelve el nombre de cada socio y cuántos préstamos ha realizado en
-- total. Ordena el resultado de mayor a menor.

select soc_nombre 'Socio'
,      count(*)
from   socios
,      prestamos
where  soc_codsoc = pre_codsoc
group  by soc_nombre
order  by count(*) desc;


-- 10.3) Devuelve el título del libro que ha sido prestado más recientemente y el
-- nombre del socio.

-- Versión con ORDER BY
select lib_titulo 'Libro'
,      soc_nombre 'Socio'
from   libros
,      socios
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
order  by pre_fecha_prestamo desc limit 1;

-- Versión con SUBCONSULTAS
select lib_titulo 'Libro'
,      soc_nombre 'Socio'
from   libros
,      socios
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
and    pre_fecha_prestamo = (select max(pre_fecha_prestamo)
							 from   prestamos);


-- 10.4) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos realizados en mayo de 2020.
-- Ordena el resultado de forma cronológica por la fecha del préstamo.

select soc_nombre           'Socio'
,      lib_titulo           'Libro'
,      pre_fecha_prestamo   'Préstamo'
,      pre_fecha_devolucion 'Devolución'
from   socios
,      libros
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
and    year(pre_fecha_prestamo) = 2020
and    month(pre_fecha_prestamo) = 5;


-- 10.5) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos que han tenido una duración
-- superior a 10 días.

select soc_nombre           'Socio'
,      lib_titulo           'Libro'
,      pre_fecha_prestamo   'Préstamo'
,      pre_fecha_devolucion 'Devolución'
from   socios
,      libros
,      prestamos
where  pre_codlib = lib_codlib
and    pre_codsoc = soc_codsoc
and    datediff(pre_fecha_devolucion, pre_fecha_prestamo) > 10;
