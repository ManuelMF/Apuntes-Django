drop database if exists bibliotecaa;
create database if not exists bibliotecaa;
use bibliotecaa;

-- 1 
CREATE TABLE IF NOT EXISTS libros (
  lib_codlib INT NOT NULL auto_increment,
  lib_titulo VARCHAR(50) NOT NULL,
  lib_autor VARCHAR(95) NOT NULL,
  lib_paginas INT NOT NULL,
  PRIMARY KEY (lib_codlib));


CREATE TABLE IF NOT EXISTS socios (
  soc_codsoc INT NOT NULL auto_increment,
  soc_nombre VARCHAR(120) NOT NULL,
  soc_telefono VARCHAR(20) NOT NULL,
  PRIMARY KEY (soc_codsoc));


CREATE TABLE IF NOT EXISTS prestamos (
  pre_codpre INT NOT NULL auto_increment,
  pre_codlib INT NOT NULL,
  pre_codsoc INT NOT NULL,
  pre_fecha_prestamo DATE NOT NULL,
  pre_fecha_devolucion DATE NULL,
  PRIMARY KEY (pre_codpre)
  );

alter table prestamos add foreign key PRE_LIB_FK (pre_codlib) references libros (lib_codlib);
alter table prestamos add foreign key PRE_SOC_FK (pre_codsoc) references socios (soc_codsoc);

-- 2  insert
-- 2.a libros
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

-- 2.b socios
insert into socios (soc_nombre,soc_telefono) values("Juan Perez Lozano","617315863");
insert into socios (soc_nombre,soc_telefono) values("Luis Romero Sanchez","959253987");
insert into socios (soc_nombre,soc_telefono) values("Pedro Lopez Rojas","954553153");
insert into socios (soc_nombre,soc_telefono) values("Santiago Gonzalez Lleida","954435993");
insert into socios (soc_nombre,soc_telefono) values("Fernando Domingo Gomez","955634281");
insert into socios (soc_nombre,soc_telefono) values("Luis Daza Zamora","954435113");
insert into socios (soc_nombre,soc_telefono) values("Luis Daza Zamora","609257167");
insert into socios (soc_nombre,soc_telefono) values("Javier Romero Gonzalez","617583100");

-- 2.c prestamos
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

-- 3
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo) values(1,1,"2020-05-01");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo) values(2,6,"2021-04-15");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo) values(6,4,"2022-03-26");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo) values(2,2,"2022-04-23");
insert into prestamos (pre_codlib,pre_codsoc,pre_fecha_prestamo) values(4,2,"2022-04-21");

-- 4
-- vista
create view  libros_sin_devolver (lib_titulo,lib_autor,soc_nombre,soc_telefono,pre_fecha_prestamo)
as select lib_titulo,lib_autor,soc_nombre,soc_telefono,pre_fecha_prestamo from libros inner join prestamos on pre_codlib=lib_codlib
inner join socios on soc_codsoc = pre_codsoc
where pre_fecha_devolucion is null;

-- 5
select * from libros_sin_devolver;
-- aparecen 5 registros 

-- 6 
update prestamos
  set pre_fecha_devolucion='2022-05-02'
  where pre_codpre=14;
update prestamos
  set pre_fecha_devolucion='2022-05-02'
  where pre_codpre=15;
update prestamos
  set pre_fecha_devolucion='2022-05-02'
  where pre_codpre=16;
  
  -- 7
select * from libros_sin_devolver;
-- aparecen 2 registros 

-- 8
create view  libros_devueltos (lib_titulo,lib_autor,soc_nombre,soc_telefono,pre_fecha_prestamo,pre_fecha_devolucion)
as select lib_titulo,lib_autor,soc_nombre,soc_telefono,pre_fecha_prestamo,pre_fecha_devolucion from libros inner join prestamos on pre_codlib=lib_codlib
inner join socios on soc_codsoc = pre_codsoc
where pre_fecha_devolucion is not null;

select * from libros_devueltos;
-- 9
-- 9.1) Devuelve el título de cada libro y cuántas veces ha sido prestado. Ordena el
-- resultado de mayor a menor.
select lib_titulo, count(lib_titulo)
from libros_devueltos 
group by lib_titulo
order by lib_titulo;

-- 9.2) Devuelve el nombre de cada socio y cuántos préstamos ha realizado en
-- total. Ordena el resultado de mayor a menor.
select soc_nombre, count(soc_nombre)
from libros_devueltos 
group by soc_nombre
order by soc_nombre desc;

-- 9.3) Devuelve el título del libro que ha sido prestado más recientemente y el
-- nombre del socio.
select lib_titulo, soc_nombre
from libros_devueltos 
order by pre_fecha_prestamo desc limit 1;

-- 9.4) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos realizados en mayo de 2020.
-- Ordena el resultado de forma cronológica por la fecha del préstamo.
select soc_nombre, lib_titulo, pre_fecha_prestamo,pre_fecha_devolucion
from libros inner join prestamos on pre_codlib=lib_codlib
inner join socios on soc_codsoc = pre_codsoc
where year(pre_fecha_prestamo ) = '2020'
and month(pre_fecha_prestamo) = '5';


-- 9.5) Devuelve el nombre del socio, el título del libro, la fecha en que lo prestó y
-- la fecha en que lo devolvió de aquellos préstamos que han tenido una duración
-- superior a 10 días.
select soc_nombre, lib_titulo, pre_fecha_prestamo,pre_fecha_devolucion
from libros_devueltos
where pre_fecha_prestamo between pre_fecha_prestamo and DATE_ADD(pre_fecha_prestamo,INTERVAL 10 DAY)
and pre_fecha_devolucion between pre_fecha_devolucion and DATE_SUB(pre_fecha_prestamo,INTERVAL 10 DAY) ;