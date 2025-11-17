-- SELECT 
-- Recuperar algunos campos

Primer problema:
Un videoclub que alquila películas en video almacena la información de sus películas en alquiler en 
una tabla llamada "peliculas".

1- Cree la tabla:

2- Vea la estructura de la tabla.

4- Realice un "select" mostrando solamente el título y actor de todas las películas

5- Muestre el título y duración de todas las peliculas

6- Muestre el título y la cantidad de copias

 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

SELECT titulo, actor FROM peliculas;

SELECT titulo, duracion FROM peliculas;

SELECT titulo, cantidad FROM peliculas;




Segundo problema:
 Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

1- Cree la tabla:

2- Vea la estructura de la tabla

4- Muestre todos los datos de los empleados

5- Muestre el nombre, documento y domicilio de los empleados

6- Realice un "select" mostrando el documento, sexo y sueldo básico de todos los empleados
 create table empleados(
  nombre varchar(20),
  documento varchar(8), 
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );
  insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Juarez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','27888999','f','Colon 134',700);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Carlos Caseres','31222333','m','Urquiza 479',850);


  SELECT * FROM empleados;
  SELECT * nombre, documento, domicilio FROM empleados;
  SELECT documento, sexo, sueldobasico FROM empleados;
