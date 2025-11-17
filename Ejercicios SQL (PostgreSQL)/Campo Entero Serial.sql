Campo Entero Serial


Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla 
llamada "medicamentos".

1- Cree la tabla 

CREATE TABLE medicamentos (
codigo serial,
nombre varchar(20),
laboratorio varchar(20),
precio float,
cantidad integer,
primary key (codigo)
)
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES (
'Sertal', 'Roche', 5.2, 100);
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES (
'Buscapina', 'Roche', 4.10, 200
);
INSERT INTO medicamentos(
nombre, laboratorio, precio, cantidad
) VALUES (
'Amoxidal 500', 'Bayer', 15.60, 100
);
2- Visualice la estructura de la tabla "medicamentos"



4- Verifique que el campo "código" generó los valores de modo automático.


----------------

Segundo problema:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".


1- Créela con la siguiente estructura:
 -codigo (serial),
 -titulo (cadena de 40),
 -actor (cadena de 20),
 -duracion (entero),
 -clave primaria: codigo.
 ---------
 tabla creada. 
 CREATE TABLE peliculas (
codigo serial,
titulo varchar(40),
actor varchar(20),
duracion integer,
primary key (codigo)
)
INSERT INTO peliculas (
titulo, actor, duracion
) VALUES (
'Mision Imposible', 'Tom Cruise', 120
);
INSERT INTO peliculas (
titulo, actor, duracion
) VALUES (
'Harry Potter y la Piedra Filosofal', 'xxx', 180
)
INSERT INTO peliculas (
titulo, actor, duracion
) VALUES (
'Harry Potter y la Cámara Secreta', 'xxx', 180
)
INSERT INTO peliculas (
titulo, actor, duracion
) VALUES (
'Mision Imposible 2', 'Tom Cruise', 120
)
INSERT INTO peliculas (
titulo, actor, duracion
) VALUES (
'La Vida es Bella', 'zzz', 220
)
2- Visualice la estructura de la tabla "peliculas".


4- Seleccione todos los registros y verifique la carga automática de los códigos.


5- Actualice las películas cuyo código es 3 colocando en "actor" 'Daniel R.'

UPDATE peliculas SET actor = 'Daniel R.' WHERE codigo = 3

6- Elimine la película 'La vida es bella'.

DELETE FROM peliculas WHERE titulo = 'La vida es bella'

7- Elimine todas las películas cuya duración sea igual a 120 minutos.

DELETE FROM peliculas WHERE duracion = 120;

8- Visualice los registros.

SELECT * FROM peliculas;

9- Ingrese el siguiente registro, sin valor para la clave primaria:
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
Note que sigue la secuencia tomando el último valor generado, aunque ya no esté.
