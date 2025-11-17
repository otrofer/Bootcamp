Relacional NULL

Primer problema:
Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.

1- Créela con la siguiente estructura:

DROP TABLE if exists peliculas
 create table peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
 );

2- Ingrese algunos registros:

 insert into peliculas(titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas(titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas(titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas(titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas(titulo,actor,duracion)
  values('Mujer bonita',null,120);
 insert into peliculas(titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

3- Recupere las películas cuyo actor sea nulo (2 registros)

SELECT * FROM peliculas WHERE actor IS NULL

4- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)

UPDATE peliculas SET duracion = 0 WHERE duracion IS NULL

5- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)

DELETE FROM peliculas WHERE actor IS NULL AND duracion = 0