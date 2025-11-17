-- DELETE

Primer problema:
Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11):
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

2- Ingrese los siguientes registros (insert into):
 Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456.

3- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)

DELETE FROM agenda WHERE nombre = 'Juan'

4- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados)
DELETE FROM agenda WHERE telefono = '4545454'

5- Muestre la tabla.

6- Elimine todos los registros (2 registros afectados)

DELETE FROM agenda

7- Muestre la tabla.

SELECT *FROM agenda (vacio).



Segundo problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

2- Ingrese algunos registros:
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

3- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)

DELETE FROM articulos
WHERE precio >= 500

4- Elimine todas las impresoras (1 registro)

DELETE FROM articulos
WHERE nombre = 'impresora'

5- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro)

DELETE FROM articulos WHERE codigo != 4;

6- Mostrar la tabla después que borra cada registro.

SELECT * FROM articulos

4	"teclado"	"ingles Biswal"	100	50