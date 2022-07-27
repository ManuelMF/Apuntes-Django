-- Creamos la base de datos
create database if not exists universidad_b1;

-- Indicamos que usamos la bd universidad_b
use universidad_b1;

-- Creamos las tablas
-- ------------------

-- Tabla departamentos
create table departamentos (
	dep_coddep int unsigned auto_increment,
	dep_nombre varchar(50) not null,
	primary key DEP_PK (dep_coddep)
);

-- Tabla alumnos
create table alumnos (
    alu_codalu int unsigned auto_increment,
	alu_dni varchar(9) unique,
	alu_nombre varchar(25) not null,
	alu_apellido1 varchar(50) not null,
	alu_apellido2 varchar(50),
	alu_ciudad varchar(25) not null,
	alu_direccion varchar(50) not null,
	alu_telefono varchar(9),
	alu_nacimiento date not null,
	alu_sexo enum('H', 'M') not null,
 primary key ALU_PK (alu_codalu)
);

-- Tabla profesores
create table profesores (
	pro_codpro int unsigned auto_increment,
	pro_dni varchar(9) unique,
	pro_nombre varchar(25) not null,
	pro_apellido1 varchar(50) not null,
	pro_apellido2 varchar(50),
	pro_ciudad varchar(25) not null,
	pro_direccion varchar(50) not null,
	pro_telefono varchar(9),
	pro_nacimiento date not null,
	pro_sexo enum('H', 'M') not null,
	pro_coddep int unsigned not null,
	primary key PRO_PK (pro_codpro)
);

-- Tabla grados
create table grados (
	gra_codgra int unsigned auto_increment,
	gra_nombre varchar(100) not null,
	primary key GRA_PK (gra_codgra)
);

-- Tabla asignaturas
create table asignaturas (
	asi_codasi int unsigned auto_increment,
	asi_nombre varchar(100) not null,
	asi_creditos float unsigned not null,
	asi_tipo enum('básica', 'obligatoria', 'optativa') not null,
	asi_curso int unsigned not null,
	asi_cuatrimestre int unsigned not null,
	asi_codpro int unsigned,
	asi_codgra int unsigned not null,
    primary key ASI_PK (asi_codasi)
);

-- Tabla cursos_escolares
create table cursos_escolares (
	ces_codces int unsigned auto_increment,
	ces_anyo_inicio year not null,
	ces_anyo_fin year not null,
    primary key CES_PK (ces_codces)
);

-- Tabla alumnos_se_matriculan
create table alumnos_se_matriculan (
	asm_codalu int unsigned not null,
	asm_codasi int unsigned not null,
	asm_codces int unsigned not null,
	primary key ASM_PK (asm_codalu, asm_codasi, asm_codces)
);

-- Creamos las FKs
-- ---------------
alter table profesores add foreign key PRO_DEP_FK (pro_coddep) references departamentos (dep_coddep);
alter table asignaturas add foreign key ASI_PRO_FK (asi_codpro) references profesores (pro_codpro);
alter table asignaturas add foreign key ASI_GRA_FK (asi_codgra) references grados (gra_codgra);
alter table alumnos_se_matriculan add foreign key ASM_ALU_PK (asm_codalu) references alumnos (alu_codalu);
alter table alumnos_se_matriculan add foreign key ASM_ASI_PK (asm_codasi) references asignaturas (asi_codasi);
alter table alumnos_se_matriculan add foreign key ASM_CES_PK (asm_codces) references cursos_escolares (ces_codces);

-- Deshabilitamos el autocommit
set autocommit = false;


-- Insertamos en la tabla departamentos
insert into departamentos (dep_coddep, dep_nombre) values (1, 'Informática');
insert into departamentos (dep_coddep, dep_nombre) values (2, 'Matemáticas');
insert into departamentos (dep_coddep, dep_nombre) values (3, 'Economía y Empresa');
insert into departamentos (dep_coddep, dep_nombre) values (4, 'Educación');
insert into departamentos (dep_coddep, dep_nombre) values (5, 'Agronomía');
insert into departamentos (dep_coddep, dep_nombre) values (6, 'Química y Física');
insert into departamentos (dep_coddep, dep_nombre) values (7, 'Filología');
insert into departamentos (dep_coddep, dep_nombre) values (8, 'Derecho');
insert into departamentos (dep_coddep, dep_nombre) values (9, 'Biología y Geología');
 
-- Commitamos
commit;

-- Insertamos en la tabla alumnos
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (1, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M');
insert into alumnos (alu_codalu, alu_dni, alu_nombre, alu_apellido1, alu_apellido2, alu_ciudad, alu_direccion, alu_telefono, alu_nacimiento, alu_sexo)
             values (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M');
 
-- Commitamos
commit;
 
-- Insertamos en la tabla profesores
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 1);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 2);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 3);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 4);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 4);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 6);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 1);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 2);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 3);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 4);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 5);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 6);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', 'Almería', 'C/ Quinto pino', NULL, '1980/10/16', 'H', 1);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', 'Almería', 'C/ Quinto pino', NULL, '1980/11/21', 'H', 1);
insert into profesores (pro_codpro, pro_dni, pro_nombre, pro_apellido1, pro_apellido2, pro_ciudad, pro_direccion, pro_telefono, pro_nacimiento, pro_sexo, pro_coddep)
                values (23, '77194445M', 'María', 'Domínguez', 'Hernández', 'Almería', 'C/ Quinto pino', NULL, '1980/12/13', 'M', 2);
 
-- Commitamos
commit;
 
-- Insertamos en la tabla grados
insert into grados (gra_codgra, gra_nombre) values (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
insert into grados (gra_codgra, gra_nombre) values (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
insert into grados (gra_codgra, gra_nombre) values (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
insert into grados (gra_codgra, gra_nombre) values (4, 'Grado en Ingeniería Informática (Plan 2015)');
insert into grados (gra_codgra, gra_nombre) values (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
insert into grados (gra_codgra, gra_nombre) values (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
insert into grados (gra_codgra, gra_nombre) values (7, 'Grado en Biotecnología (Plan 2015)');
insert into grados (gra_codgra, gra_nombre) values (8, 'Grado en Ciencias Ambientales (Plan 2009)');
insert into grados (gra_codgra, gra_nombre) values (9, 'Grado en Matemáticas (Plan 2010)');
insert into grados (gra_codgra, gra_nombre) values (10, 'Grado en Química (Plan 2009)');
 
-- Commitamos
commit;
 
-- Insertamos en la tabla asignaturas
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (2, 'Cálculo', 6, 'básica', 1, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (3, 'Física para informática', 6, 'básica', 1, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (4, 'Introducción a la programación', 6, 'básica', 1, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (6, 'Estadística', 6, 'básica', 1, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (10, 'Metodología de la programación', 6, 'básica', 1, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
insert into asignaturas (asi_codasi, asi_nombre, asi_creditos, asi_tipo, asi_curso, asi_cuatrimestre, asi_codpro, asi_codgra)
                 values (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);
 
-- Commitamos
commit;
 
-- Insertamos en la tabla cursos_escolares
insert into cursos_escolares (ces_codces, ces_anyo_inicio, ces_anyo_fin) values (1, 2015, 2016);
insert into cursos_escolares (ces_codces, ces_anyo_inicio, ces_anyo_fin) values (2, 2016, 2017);
insert into cursos_escolares (ces_codces, ces_anyo_inicio, ces_anyo_fin) values (3, 2017, 2018);
insert into cursos_escolares (ces_codces, ces_anyo_inicio, ces_anyo_fin) values (4, 2018, 2019);

-- Commitamos
commit;
 
-- Insertamos en la tabla alumnos_se_matriculan
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 3, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 4, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 5, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 6, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 7, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 8, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 9, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 10, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 1, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 2, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 3, 2);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 1, 3);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 2, 3);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 3, 3);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 1, 4);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 2, 4);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (1, 3, 4);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (2, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (2, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (2, 3, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 3, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 1, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 2, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 3, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 4, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 5, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 6, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 7, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 8, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 9, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (4, 10, 2);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 3, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 4, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 5, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 6, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 7, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 8, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 9, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 10, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 1, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 2, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 3, 2);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 1, 3);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 2, 3);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 3, 3);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 1, 4);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 2, 4);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (19, 3, 4);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (23, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (23, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (23, 3, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 1, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 2, 1);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 3, 1);

insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 1, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 2, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 3, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 4, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 5, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 6, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 7, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 8, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 9, 2);
insert into alumnos_se_matriculan (asm_codalu, asm_codasi, asm_codces) values (24, 10, 2);
 
-- Commitamos
commit;

-- Responde a la pregunta:
-- ¿Cuál de los dos modelos opinas que es más óptimo?
-- Justifica tu respuesta.
-- yo creo que es mas optimo el de ahora ya que es menos lioso a la hora de hacer select y no tienes que hacer tantas inner join ya que de la 
-- otra forma tenias que estar gastando mucho tiempo en inner joins que se podrían ahorar haciendolo separado

-- 1. Realiza las siguientes consultas:

-- a) Consultas sobre una tabla

-- a.1) Devuelve un listado con el primer apellido, segundo apellido y el
-- nombre de todos los alumnos. El listado deberá estar ordenado
-- alfabéticamente de menor a mayor por el primer apellido, segundo
-- apellido y nombre.
select alu_apellido1, alu_apellido2, alu_nombre from alumnos 
order by alu_apellido1, alu_apellido2,alu_nombre;

-- a.2) Averigua el nombre y los dos apellidos de los alumnos que no han
-- dado de alta su número de teléfono en la base de datos.
select alu_apellido1, alu_apellido2, alu_nombre from alumnos 
where alu_telefono is null;

-- a.3) Devuelve el listado de los alumnos que nacieron en 1999.
select * from alumnos where year(alu_nacimiento) = "1999";

-- a.4) Devuelve el listado de profesores que no han dado de alta su
-- número de teléfono en la base de datos y además su DNI termina en K.
select pro_nombre, pro_apellido1, pro_apellido2, pro_dni from profesores 
where pro_dni like "%K"
and pro_telefono is null;

-- a.5) Devuelve el listado de las asignaturas que se imparten en el primer
-- cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
select * from asignaturas inner join grados on gra_codgra=asi_codgra
where asi_cuatrimestre = 1
and asi_curso = 3
and gra_codgra = 7;

-- b) Consultas multitabla (Composición interna: join tradicional o
-- inner join)
-- b.1) Devuelve un listado con los datos de todas las alumnas que se han
-- matriculado alguna vez en el Grado en Ingeniería Informática
-- (Plan 2015).
select distinct alumnos.* from alumnos 
inner join alumnos_se_matriculan on asm_codalu = alu_codalu 
inner join asignaturas on asi_codasi = asm_codasi
where alu_sexo = "m" 
and asi_codgra=4;

-- b.2) Devuelve un listado con todas las asignaturas ofertadas en el Grado
-- en Ingeniería Informática (Plan 2015).
select * from asignaturas inner join grados on gra_codgra = asi_codgra 
where gra_nombre like "%(Plan 2015)";

-- b.3) De Devuelve un listado de los profesores junto con el nombre del
-- departamento al que están vinculados. El listado debe devolver cuatro
-- columnas, primer apellido, segundo apellido, nombre y nombre del
-- departamento. El resultado estará ordenado alfabéticamente de menor
-- a mayor por los apellidos y el nombre.
select pro_nombre, pro_apellido1, pro_apellido2, dep_nombre from profesores 
inner join departamentos on dep_coddep = pro_coddep
order by pro_apellido1, pro_apellido2, pro_nombre;

-- b.4) De Devuelve un listado con el nombre de las asignaturas, año de
-- inicio y año de fin del curso escolar del alumno con DNI 26902806M.
select asi_nombre, ces_anyo_inicio, ces_anyo_fin from asignaturas 
inner join alumnos_se_matriculan on asm_codasi = asi_codasi 
inner join alumnos on alu_codalu = asm_codalu
inner join cursos_escolares on ces_codces = asm_codces 
where alu_dni = "26902806M";

-- b.5) Devuelve un listado con el nombre de todos los departamentos que
-- tienen profesores que imparten alguna asignatura en el Grado en
-- Ingeniería Informática (Plan 2015).
select distinct dep_nombre from profesores  
inner join asignaturas on asi_codpro = pro_codpro
inner join departamentos on dep_coddep = pro_coddep
where asi_codgra = 4;

-- b.6) Devuelve un listado con todos los alumnos que se han matriculado
-- en alguna asignatura durante el curso escolar 2018/2019.
select alumnos.* from alumnos 
inner join alumnos_se_matriculan on asm_codalu = alu_codalu
inner join cursos_escolares on ces_codces = asm_codces
where ces_anyo_fin = 2019
and ces_anyo_inicio = 2018;

-- c) Consultas multitabla (Composición externa: LEFT JOIN y RIGHT
-- JOIN).
-- Resuelve todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT
-- JOIN.

-- c.1) Devuelve un listado con los nombres de todos los profesores y los
-- departamentos que tienen vinculados. El listado también debe mostrar
-- aquellos profesores que no tienen ningún departamento asociado. El
-- listado debe devolver cuatro columnas, nombre del departamento,
-- primer apellido, segundo apellido y nombre del profesor. El resultado
-- estará ordenado alfabéticamente de menor a mayor por el nombre del
-- departamento, apellidos y el nombre.
select pro_nombre, pro_apellido1, pro_apellido2, dep_nombre from profesores 
left join departamentos on dep_coddep = pro_coddep
order by dep_nombre, pro_apellido1, pro_apellido2, pro_nombre;

-- c.2) Devuelve un listado con los profesores que no están asociados a un
-- departamento.
select pro_nombre, pro_apellido1, pro_apellido2, dep_nombre from profesores 
full join departamentos on dep_coddep = pro_coddep
where dep_coddep is null;

-- c.3) Devuelve un listado con los departamentos que no tienen
-- profesores asociados.
select departamentos.* from departamentos left join profesores on pro_coddep=dep_coddep
where pro_codpro is null;

-- c.4) Devuelve un listado con los profesores que no imparten ninguna
-- asignatura.
select profesores.* from profesores left join asignaturas on  asi_codpro = pro_codpro
where asi_codasi is null;

-- c.5) Devuelve un listado con las asignaturas que no tienen un profesor
-- asignado.
select asignaturas.* from asignaturas 
left join profesores on pro_codpro = asi_codpro 
where pro_codpro is null;

-- c.6) Devuelve un listado con todos los departamentos que tienen alguna
-- asignatura que no se haya impartido en ningún curso escolar. El
-- resultado debe mostrar el nombre del departamento y el nombre de la
-- asignatura que no se haya impartido nunca.
select distinct departamentos.* from departamentos 
left join profesores on pro_coddep = dep_coddep 
left join asignaturas on asi_codpro = pro_codpro
where asi_curso is null;

-- d) Consultas resumen

-- d.1) Devuelve el número total de alumnas que hay.
select count(alu_codalu) from alumnos where alu_sexo = "m";

-- d.2) Calcula cuántos alumnos nacieron en 1999.
select count(alu_codalu) from alumnos where year(alu_nacimiento)= 1999;

-- d.3) Calcula cuántos profesores hay en cada departamento. El resultado
-- sólo debe mostrar dos columnas, una con el nombre del departamento y
-- otra con el número de profesores que hay en ese departamento. El
-- resultado sólo debe incluir los departamentos que tienen profesores
-- asociados y deberá estar ordenado de mayor a menor por el número de
-- profesores.
select dep_nombre, count(pro_codpro) from departamentos
inner join profesores on dep_coddep = pro_coddep 
group by dep_nombre order by dep_nombre;

-- d.4) Devuelve un listado con todos los departamentos y el número de
-- profesores que hay en cada uno de ellos. Ten en cuenta que pueden
-- existir departamentos que no tienen profesores asociados. Estos
-- departamentos también tienen que aparecer en el listado.
select dep_nombre, count(pro_codpro) from departamentos
left join profesores on dep_coddep = pro_coddep 
group by dep_nombre order by dep_nombre;

-- d.5) Devuelve un listado con el nombre de todos los grados existentes en
-- la base de datos y el número de asignaturas que tiene cada uno. Ten en
-- cuenta que pueden existir grados que no tienen asignaturas asociadas.
-- Estos grados también tienen que aparecer en el listado. El resultado
-- deberá estar ordenado de mayor a menor por el número de asignaturas.
select gra_nombre, count(asi_codasi) from grados 
left join asignaturas on asi_codgra = gra_codgra 
group by gra_nombre order by gra_nombre; 

-- d.6) Devuelve un listado con el nombre de todos los grados existentes en
-- la base de datos y el número de asignaturas que tiene cada uno, de los
-- grados que tengan más de 40 asignaturas asociadas.
select gra_nombre, count(asi_codasi) from grados 
inner join asignaturas on asi_codgra = gra_codgra 
group by gra_nombre
having count(asi_codasi)>40; 

-- d.7) Devuelve un listado que muestre el nombre de los grados y la suma
-- del número total de créditos que hay para cada tipo de asignatura. El
-- resultado debe tener tres columnas: nombre del grado, tipo de
-- asignatura y la suma de los créditos de todas las asignaturas que hay de
-- ese tipo. Ordena el resultado de mayor a menor por el número total de
-- créditos.
select gra_nombre, asi_nombre, sum(asi_creditos) from grados 
left join asignaturas on asi_codgra = gra_codgra 
group by asi_nombre order by gra_nombre; 

-- d.8) Devuelve un listado que muestre cuántos alumnos se han
-- matriculado de alguna asignatura en cada uno de los cursos escolares.
-- El resultado deberá mostrar dos columnas, una columna con el año de
-- inicio del curso escolar y otra con el número de alumnos matriculados.
select ces_anyo_inicio, count(asm_codces) from cursos_escolares
inner join alumnos_se_matriculan on asm_codces = ces_codces
group by ces_anyo_inicio;

-- d.9) Devuelve un listado con el número de asignaturas que imparte cada
-- profesor. El listado debe tener en cuenta aquellos profesores que no
-- imparten ninguna asignatura. El resultado mostrará cinco columnas:
-- código, nombre, primer apellido, segundo apellido y número de
-- asignaturas. El resultado estará ordenado de mayor a menor por el
-- número de asignaturas.
select pro_nombre, pro_apellido1, pro_apellido2, count(asi_codasi) from profesores 
left join asignaturas on asi_codpro = pro_codpro
group by pro_nombre order by asi_codasi desc;

-- e) Subconsultas

-- e.1) Devuelve todos los datos del alumno más joven.
select * from alumnos order by alu_nacimiento desc limit 1;

-- e.2) Devuelve un listado con los profesores que no están asociados a un
-- departamento.
select * from profesores where pro_coddep is null;

-- e.3) Devuelve un listado con los departamentos que no tienen
-- profesores asociados.
select * from departamentos 
left join profesores on pro_coddep = dep_coddep
where pro_codpro is null;

-- e.4) Devuelve un listado con los profesores que tienen un departamento
-- asociado y que no imparten ninguna asignatura.
select profesores.* from departamentos 
left join profesores on pro_coddep = dep_coddep
left join asignaturas on asi_codpro = pro_codpro
where pro_codpro is not null 
and   asi_codpro is null;

-- e.5) Devuelve un listado con las asignaturas que no tienen un profesor
-- asignado.
select asignaturas.* from asignaturas 
left join profesores on pro_codpro= asi_codpro
where asi_codpro is null;

-- e.6) Devuelve un listado con todos los departamentos que no han
-- impartido asignaturas en ningún curso escolar.
select distinct departamentos.* from departamentos 
left join profesores on pro_coddep = dep_coddep
left join asignaturas on asi_codpro = pro_codpro
where asi_curso is null;