----------------------CREAR TABLAS-----------------------

Cree una tabla llamada "agenda", debe tener los siguientes campos: apellido, varchar(30); nombre,
varchar(20); domicilio, varchar (30) y telefono, varchar(11).
Intente crearla nuevamente. Aparece mensaje de error.
Visualice la estructura de la tabla "agenda".
Elimine la tabla.
Intente eliminar nuevamente la tabla. Debe aparecer un mensaje de error

Primero cree una base de datos para realizar los ejercicios propuestos. 

CREATE DATABASE ejercicios;
CREATE TABLE agenda (

	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

SELECT apellido, nombre, domicilio, telefono FROM agenda;

DROP TABLE agenda.

Segundo problema.

Necesita almacenar información referente a los libros de su biblioteca personal. Los datos que 
guardará serán: título del libro, nombre del autor y nombre de la editorial.

1- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); 
autor, varchar(30) y editorial, varchar(15).

2- Intente crearla nuevamente. Aparece mensaje de error.

3- Visualice la estructura de la tabla "libros".

4- Elimine la tabla.

5- Intente eliminar la tabla nuevamente.

CREATE TABLA libros (
    titulo,
    varchar(20),
    autor varchar(30),
    editorial varchar(15)
)

SELECT * FROM libros;

DROP TABLE libros.