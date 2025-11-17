default

Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

1- Cree la tabla.

CREATE TABLE visitantes (
nombre varchar(30),
edad smallint,
sexo char(1) default 'F', -- guarda por default el F
domicilio varchar(30),
ciudad varchar(20) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'no tiene',
montocompra decimal (6,2)
);
2- Vea la información de las columnas "column_default" y "is_nullable"

SELECT * FROM information_schema.columns WHERE table_name = 'visitantes';


3- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
cláusula "default":
    INSERT INTO visitantes (nombre, domicilio, montocompra)
    VALUES ( 'Susana Molina', 'Colon 123', 59.80);

    INSERT INTO visitantes (nombre, edad, ciudad, mail)
    VALUES ('Marcos Torres', 29, 'Carlos Paz', 'marcostorres@hotmail.com') ;

4- Use la palabra "default" para ingresar valores en un insert.

INSERT INTO visitantes VALUES
('Marcelo Morales',20, default, default, default, '425232t', 'marcelomorales@hotmail.com', default);

5- Ingrese un registro con "default values".

INSERT INTO visitantes default values;



Segundo problema:
Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla llamada 
"prestamos". En ella almacena la siguiente información: título del libro, documento de identidad del 
socio a quien se le presta el libro, fecha de préstamo, fecha en que tiene que devolver el libro y 
si el libro ha sido o no devuelto.

1- Cree la tabla:

CREATE TABLE prestamos(
  titulo varchar(40) NOT NULL,
  documento char(8) NOT NULL,
  fechaprestamo date NOT NULL,
  fechadevolucion date,
  devuelto char(1) DEFAULT 'n'
);

2- Ingrese algunos registros omitiendo el valor para los campos que lo admiten:

INSERT INTO prestamos (titulo, documento, fechaprestamo, fechadevolucion)
VALUES ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');

INSERT INTO prestamos (titulo, documento, fechaprestamo)
VALUES ('Alicia en el pais de las maravillas','23456789','2006-12-16');

INSERT INTO prestamos (titulo, documento, fechaprestamo, fechadevolucion)
VALUES ('El aleph','22543987','2006-12-16','2006-08-19');

INSERT INTO prestamos (titulo, documento, fechaprestamo, devuelto)
VALUES ('Manual de geografia 5 grado','25555666','2006-12-18','s');

3- Seleccione todos los registros

SELECT * FROM prestamos;

4- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

INSERT INTO prestamos VALUES ('Manual de Historia', '32555666', '2006-10-25', default, default);

5- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)


INSERT INTO prestamos default VALUES; Sale error.