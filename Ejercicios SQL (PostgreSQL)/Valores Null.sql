Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

1- Cree la tabla con la siguiente estructura:

    CREATE TABLE medicinas (

codigo integer not null,
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer not null
)



2- Visualice la estructura de la tabla "medicamentos" indicando si el campo admite valores null.

3- Ingrese algunos registros con valores "null" para los campos que lo admitan:

    insert into medicinas (codigo,nombre,laboratorio,precio,cantidad)
    values(1,'Sertal gotas',null,null,100); 
    insert into medicinas (codigo,nombre,laboratorio,precio,cantidad)
    values(2,'Sertal compuesto',null,8.90,150);
    insert into medicinas (codigo,nombre,laboratorio,precio,cantidad)
    values(3,'Buscapina','Roche',null,200);

4- Vea todos los registros:

    SELECT * FROM medicinas;

5- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.

    INSERT INTO medicinas (
codigo, nombre, laboratorio, precio, cantidad
) VALUES (
	4, 'Losartan', ' ', 0, 15
)


6- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre.

    INSERT INTO medicinas (
codigo, nombre, laboratorio, precio, cantidad
) VALUES (
	0, ' ', 'Bayer', 25000, 0
)

7- Muestre todos los registros.

    SELECT * FROM medicinas
    UPDATE medicinas SET nombre = '' WHERE nombre = ' ';
    Hice un update para quitarle los espacios.

8- Intente ingresar un registro con valor nulo para un campo que no lo admite 
(aparece un mensaje de error): 

    INSERT INTO medicinas (
codigo, nombre, laboratorio, precio, cantidad
) VALUES (
	null, 'Novalgina', 'Bayer', 58000
) Sale un mensaje de error. 

9- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.



10- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
valor 0 en el mismo campo. Note que el resultado es distinto.

    SELECT * FROM medicinas WHERE laboratorio IS NULL
    select * from medicinas where laboratorio=''

11- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean distintos de "null". Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el campo laboratorio (incluso cadena vacía).

    	SELECT * FROM medicinas WHERE laboratorio <> '';
        SELECT * FROM medicinas WHERE laboratorio IS NOT NULL;


12- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null". Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el campo precio (incluso el valor 0).+

        SELECT * FROM medicinas WHERE precio <> 0;
        SELECT * FROM medicinas WHERE precio IS NOT NULL;


Segundo problema:
Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".

1- Créela con la siguiente estructura:
 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

2- Visualice la estructura de la tabla
note que el campo "codigo" y "titulo", en la columna "ins_nullable" muestra "NO" y los otros campos "YES".

3- Ingrese los siguientes registros:
 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);

4- Recupere todos los registros para ver cómo PostgreSQL los almacenó:

 select * from peliculas;

5- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de 
error)

insert into peliculas (codigo,titulo,actor,duracion) values(null,'Mujer bonita','R. Gere-J. Roberts',190)

6- Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía 
(note que la salida es distinta) (1 registro)
       
        select * from peliculas where actor is null;

7- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)

        UPDATE peliculas SET duracion = null WHERE duracion = 120;

        SELECT * from peliculas;

8- Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho 
campo (1 registro afectado)

    UPDATE peliculas SET actor = 'Desconocido' WHERE actor = '';

    SELECT * FROM PELICULAS;

9- Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor nulo en el campo "actor".

        SELECT * FROM PELICULAS;

10- Elimine los registros cuyo título sea una cadena vacía (1 registro)

DELETE FROM peliculas WHERE titulo = ''
SELECT * FROM PELICULAS
