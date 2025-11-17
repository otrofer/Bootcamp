Funcion Fecha y Hora


Primer problema:
Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".
1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  fechanacimiento date
 );

2- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año"

SET datestyle to 'European';

3- Ingrese un alumno empleando distintos separadores para las fechas

INSERT INTO alumnos VALUES ('Gonzalez', 'Ana', '22222222', 'Colon 123',
'10-08-1900', '15/02/1972');

4- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año


INSERT INTO alumnos VALUES ('Juarez', 'Bernardo', '25555555', 'Sucre 456',
'03-03-1991', '15/02/1972');

5- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento"

INSERT INTO alumnos VALUES ('Perez', 'Laura', '26666666', 'Bulnes 345', '03-03-91', null);


6- Muestre todos los alumnos que ingresaron antes del '1-1-91'.

SELECT * FROM alumnos WHERE fechaingreso < '01-01-1991';

7- Muestre todos los alumnos que tienen "null" en "fechanacimiento":

SELECT * FROM alumnos WHERE fechanacimiento IS NULL;


8- Muestre el año de nacimiento de todos los alumnos.

SELECT apellido, nombre, EXTRACT(YEAR FROM fechanacimiento) FROM alumnos;
