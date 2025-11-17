INSERT INTO - SELECT

Primer problema:
Trabaje con la tabla "agenda" que almacena información de sus amigos.
1- Cree una tabla llamada "agenda". Debe tener los siguientes campos: apellido (cadena de 30), 
nombre (cadena de 20), domicilio (cadena de 30) y telefono (cadena de 11)

2 - Visualice la estructura de la tabla "agenda".

3- Ingrese los siguientes registros:
 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');

4- Seleccione todos los registros de la tabla:

5- Elimine la tabla "agenda":
 
6- Intente eliminar la tabla nuevamente (aparece un mensaje de error)


CREATE TABLE agenda (

    apellido varchar(30),
    nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11)
);

SELECT * FROM agenda

INSERT INTO agenda (

    apellido, nombre, domicilio, telefono
) VALUES (
    'Moreno', 'Alberto', 'Colon 123', '4234567' 
)
INSERT INTO agenda (
    apellido, nombre, domicilio, telefono
) VALUES (
    'Torres', 'Juan', 'Avellaneda 135', '4458787'
)

DROP TABLE agenda;
DROP TABLE agenda;

SEGUNDO PROBLEMA

Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.
1- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: 
titulo (cadena de 20), autor (cadena de 30) y editorial (cadena de 15).

2- Visualice la estructura de la tabla "libros".

3- Ingrese los siguientes registros:
 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

4- Muestre todos los registros (select).

CREATE TABLE libros (

    titulo varchar(20), 
    autor varchar(30),
    editorial varchar(15)
);

INSERT INTO libros (
    titulo, autor, editorial
) VALUES (
    'El Aleph', 'Borges', 'Planeta'
);
INSERT INTO libros (
    titulo, autor, editorial
) VALUES (
     'Martin Fierro', 'Jose Hernandez', 'Emece');
INSERT INTO libros (
    titulo, autor, editorial
) VALUES (
    'Aprenda PHP', 'Mario Molina', 'Emece'
);

SELECT * FROM libros 
-- o tambien

SELECT titulo, autor, editorial FROM libros;