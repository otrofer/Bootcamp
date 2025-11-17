tipo de dato fecha y hora.

Primer problema:
Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
CREATE TABLE alumnos (
apellido varchar(30),
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso date,
fechanacimiento date
);

2- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año" 

SET datestyle to 'European';

3- Ingrese un alumno empleando distintos separadores para las fechas:

INSERT INTO alumnos (
apellido, nombre, documento, domicilio, fechaingreso,
fechanacimiento
) VALUES (
'Gonzalez', 'Ana', '22222222', 'Colon 123', '20-08-1990',
'15/02/1972'
);
4- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
INSERT INTO alumnos (
apellido, nombre, documento, domicilio, fechaingreso,
fechanacimiento
) VALUES (
'Juarez', 'Bernardo', '25555555', 'Sucre 456', '03-03-1991', '15/02/1972'
)

5- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento":
 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

6- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
orden incorrecto "03-15-90":
INSERT INTO alumnos (
apellido, nombre, documento, domicilio, fechaingreso,
fechanacimiento
) VALUES (
'Lopez', 'Carlos', '27777777', 'Sarmiento 1254', '03-15-1990', null);

aparece un mensaje de error porque lo lee con el formato día, mes y año y no reconoce el mes 15.

7- Muestre todos los alumnos que ingresaron antes del '1-1-91'. 1 registro.

SELECT * FROM alumnos WHERE fechaingreso < '1-1-91';

8- Muestre todos los alumnos que tienen "null" en "fechanacimiento". 1 registro.

SELECT * FROM alumnos WHERE fechanacimiento IS NULL;
