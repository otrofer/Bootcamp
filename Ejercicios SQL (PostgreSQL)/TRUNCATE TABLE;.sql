TRUNCATE TABLE;
/* para borrar todos los registro de una tabla se usa "delete" sin condición "where".

También podemos eliminar todos los registros de una tabla con "truncate table". Por ejemplo, queremos vaciar la tabla "libros", usamos:

 truncate table libros; */

Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

1- Cree la tabla medicamentos
CREATE TABLE medicamentos (
codigo serial,
nombre varchar(20),
laboratorio varchar(20),
precio float,
cantidad integer,
primary key (codigo)
)
3- Ingrese los siguientes registros:
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES (
'Sertal', 'Roche', 5.2, 100
);
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES ('Buscapina', 'Roche', 4.10, 200);
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES ('Amoxidal 500', 'Bayer', 15.60,100);

3- Elimine todos los registros con "delete"

DELETE FROM medicamentos;

4- Ingrese 2 registros:

INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Sertal', 'Roche', 5.2, 100);
INSERT INTO medicamentos (
nombre, laboratorio, precio, cantidad
) VALUES (
'Amoxidal 500', 'Bayer', 15.60, 100
)

5- Vea los registros para verificar que continuó la secuencia al generar el valor para "codigo"


6- Vacíe la tabla con truncate table

TRUNCATE TABLE medicamentos

7- Ingrese el siguiente registro:

 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);

8- Vea los registros para verificar que al cargar el código reinició la secuencia en 1.