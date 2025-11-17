-- WHERE

-- Recuperar ALGUNOS REGISTROS

Primer problema:
Trabaje con la tabla "agenda" en la que registra los datos de sus amigos.

1- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11).

2- Visualice la estructura de la tabla "agenda".

3- Ingrese los siguientes registros:
 Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Hector, Salta 545, 4887788; 
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454.

4- Seleccione todos los registros de la tabla

5- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)

6- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)

7- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)

CREATE TABLE amigos (
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30), 
telefono varchar(11) 
);

INSERT INTO amigos (
apellido, nombre, domicilio, telefono 
) VALUES (
'Acosta', 'Ana', 'Colon 123', 4234567
);
INSERT INTO amigos (
apellido, nombre, domicilio, telefono
) VALUES (
'Bustamante', 'Betina', 'Avellaneda 135', 4458787
);
INSERT INTO amigos (
apellido, nombre, domicilio, telefono
) VALUES (
'Lopez', 'Hector', 'Salta 545', 4887788
);
INSERT INTO amigos (
apellido, nombre, domicilio, telefono
) VALUES (
'Lopez', 'Luis', 'Urquiza 333', 4545454
);
INSERT INTO amigos (
apellido, nombre, domicilio, telefono
) VALUES (
'Lopez', 'Marisa', 'Urquiza 333', 4545454
);

SELECT *FROM amigos;

SELECT nombre FROM amigos WHERE nombre = 'Marisa';

SELECT nombre, apellido, domicilio FROM amigos WHERE
apellido = 'Lopez';

SELECT nombre, apellido, telefono FROM amigos
WHERE telefono = '4545454';



Segundo problema:
Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros 
disponibles para la venta.

1- Cree la tabla "libros". Debe tener la siguiente estructura:


2- Visualice la estructura de la tabla "libros".

3- Ingrese los siguientes registros:
 El aleph,Borges,Emece;
 Martin Fierro,Jose Hernandez,Emece;
 Martin Fierro,Jose Hernandez,Planeta;
 Aprenda PHP,Mario Molina,Siglo XXI;

4- Seleccione los registros cuyo autor sea "Borges" (1 registro)

5- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

6- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 
registros)

 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

  INSERT INTO libros (
titulo, autor, editorial
  ) VALUES (
'El Aleph', 'Borges', 'Emece'
  );
   INSERT INTO libros (
titulo, autor, editorial
  ) VALUES (
'Martin Fierro', 'Jose Hernandez', 'Emece'
  );
   INSERT INTO libros (
titulo, autor, editorial
  ) VALUES (
'Martin Fierro', 'Jose Hernandez', 'Planeta'
  );
   INSERT INTO libros (
titulo, autor, editorial
  ) VALUES (
'Aprenda PHP', 'Mario Molina', 'Siglo XXI'
  );
  SELECT * FROM libros;

  SELECT titulo, autor FROM libros WHERE autor 
  = 'Borges';

  SELECT titulo, autor, editorial FROM libros 
  WHERE editorial = 'Emece';
  SELECT titulo, autor, editorial FROM libros 
  WHERE titulo = 'Martin Fierro';
