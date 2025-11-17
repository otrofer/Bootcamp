-- DATOS BASICOS
-- Tipos de datos basicos


Primer problema
Un videoclub que alquila películas en video almacena la información de sus películas en una tabla 
llamada "peliculas"; para cada película necesita los siguientes datos:
 -nombre, cadena de caracteres de 20 de longitud,
 -actor, cadena de caracteres de 20 de longitud,
 -duración, valor numérico entero.
 -cantidad de copias: valor entero.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

2- Vea la estructura de la tabla.

3- Ingrese los siguientes registros:
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

4- Muestre todos los registros.

CREATE TABLE peliculas (

nombre varchar(20),
actor varchar(20),
duracion int,
cantidad_copias int
);


INSERT INTO peliculas (
nombre, actor, duracion, cantidad_copias
) VALUES (
'Mision Imposible', 'Tom Cruise', 128,3
)
INSERT INTO peliculas (
nombre, actor, duracion, cantidad_copias
) VALUES (
'Mision Imposible 2', 'Tom Cruise', 130,2
)
INSERT INTO peliculas (
nombre, actor, duracion, cantidad_copias 
) VALUES (
'Mujer Bonita', 'Julia Roberts', 118,3
)
INSERT INTO peliculas (
nombre, actor, duracion, cantidad_copias
) VALUES (
'Elsa y Fred', 'China Zorrilla', 110,2
);

SELECT * FROM peliculas;

Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

2- Vea la estructura de la tabla:

3- Ingrese algunos registros:
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

4- Seleccione todos los registros.

CREATE TABLE empleados (

nombre varchar,
documento int,
sexo varchar(1),
domicilio varchar,
sueldobasico float
);

INSERT INTO empleados (
nombre, documento, sexo, domicilio, sueldobasico
) VALUES (
'Juan Perez', '2233444', 'M', 'Sarmiento 123', 500
);

INSERT INTO empleados (
nombre, documento, sexo, domicilio, sueldobasico
) VALUES (
'Ana Acosta', '2455666', 'F','Colon 134', 650
);

INSERT INTO empleados (
nombre, documento, sexo, domicilio, sueldobasico
) VALUES (
'Bartolome Barrios', '27888999', 'M', 'Urquiza 479', 800
);

SELECT * FROM empleados
