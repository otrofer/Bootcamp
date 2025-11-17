-- UPDATE

Se usa para actualizar registros.

Primer problema:
Trabaje con la tabla "agenda" que almacena los datos de sus amigos.

1- Cree la tabla:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

2- Ingrese los siguientes registros:
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

3- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)

UPDATE agenda SET nombre='Juan Jose' WHERE nombre='Juan';


4- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" 
(2 registros afectados)

UPDATE agenda SET telefono='4445566' WHERE telefono='4545454';

5- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún 
registro afectado porque ninguno cumple con la condición del "where")

UPDATE agenda SET nombre='Juan Jose' WHERE nombre='Juan'


Segundo problema:
Trabaje con la tabla "libros" de una librería.
1- Créela con los siguientes campos: titulo (cadena de 30 caracteres de longitud), autor (cadena de 
20), editorial (cadena de 15) y precio (float):
 create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

2- Ingrese los siguientes registros:
 insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);

3- Muestre todos los registros (5 registros):

SELECT * FROM libros; 

4- Modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" (1 registro 
afectado)

UPDATE libros SET autor='Adrian Paenza' WHERE autor='Paenza';

5- Nuevamente, modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" 
(ningún registro afectado porque ninguno cumple la condición)

UPDATE libros SET autor='Adrian Paenza' WHERE autor='Paenza';


6- Actualice el precio del libro de "Mario Molina" a 27 pesos (1 registro afectado):

 update libros set precio=27
 where autor='Mario Molina';


7- Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya 
editorial sea igual a "Emece" (3 registros afectados)

UPDATE libros SET editorial='Emece S.A' WHERE editorial='Emece';

8 - Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.
SELECT * FROM libros