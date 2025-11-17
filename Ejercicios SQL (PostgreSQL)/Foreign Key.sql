Foreign Key

Campo que identifica UN SOLO REGISTRO(fila) en una tabla.

Primer problema:
Trabaje con la tabla "libros" de una librería.

1- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":

        create table libros(
        codigo int not null,
        titulo varchar(40) not null,
        autor varchar(20),
        editorial varchar(15),
        primary key(codigo)
        );

2- Ingrese los siguientes registros:

        insert into libros (codigo,titulo,autor,editorial)
        values (1,'El aleph','Borges','Emece');
        insert into libros (codigo,titulo,autor,editorial)
        values (2,'Martin Fierro','Jose Hernandez','Planeta');
        insert into libros (codigo,titulo,autor,editorial)
        values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

3- Ingrese un registro con código repetido (aparece un mensaje de error)

    insert into libros (codigo,titulo,autor,editorial)
    values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')

4- Intente ingresar el valor "null" en el campo "codigo"

    insert into libros (codigo,titulo,autor,editorial)
    values (null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');

5- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)
    update libros set codigo=1
    where titulo='Martin Fierro';



Segundo problema:
Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1- Cree la tabla con la siguiente estructura intentando establecer 2 campos como clave primaria, el 
campo "documento" y "legajo" (no lo permite):
 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento),
  primary key(legajo)
 );

2- Cree la tabla estableciendo como clave primaria el campo "documento":
 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

3- Verifique que el campo "documento" no admite valores nulos

    select table_name,column_name,udt_name,character_maximum_length,is_nullable 
    from information_schema.columns 
    where table_name = 'alumnos';

4- Ingrese los siguientes registros:
 
    insert into alumnos (legajo,documento,nombre,domicilio)
    values('A233','22345345','Perez Mariana','Colon 234');
    insert into alumnos (legajo,documento,nombre,domicilio)
    values('A567','23545345','Morales Marcos','Avellaneda 348');

5- Intente ingresar un alumno con número de documento existente (no lo permite)
    insert into alumnos (legajo,documento,nombre,domicilio)
    values('A567','23545345','Morales Marcos','Avellaneda 348');

    insert into alumnos (legajo,documento,nombre,domicilio)
    values('A642','23545345','Gonzalez Analia','Caseros 444');
    
6- Intente ingresar un alumno con documento nulo (no lo permite)

    insert into alumnos (legajo,documento,nombre,domicilio)
    values('A685',null,'Miranda Carmen','Uspallata 999');