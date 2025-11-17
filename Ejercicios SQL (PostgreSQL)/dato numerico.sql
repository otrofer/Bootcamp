dato numerico

Primer problema:
Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
La tabla contiene estos datos:
	Número de Cuenta	Documento	Nombre		Saldo
	______________________________________________________________
	1234			25666777	Pedro Perez     500000.60
	2234			27888999	Juan Lopez      -250000
	3344			27888999	Juan Lopez      4000.50
	3346			32111222	Susana Molina   1000


1- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 - Número de cuenta: entero, no puede haber valores repetidos, clave primaria;
 - Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 - Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 - Saldo de la cuenta: valores altos con decimales.

 CREATE TABLE cuentas (
numero_cuenta integer not null,
documento char(8) not null,
propietario varchar(30),
saldo decimal(15,2),
primary key (numero_cuenta)
)

2- Ingrese registros:

INSERT INTO cuentas (numero_cuenta, documento, propietario,
saldo) VALUES ('1234', '25666777', 'Pedro Perez', 500000.60),
('2234', '27888999', 'Juan Lopez', -250000), ('3344', '27888999', 'Juan Lopez',
400.50), ('3346', '32111222', 'Susana Molina', 1000);
UPDATE cuentas SET saldo = 4000.50 WHERE saldo = 400.50

Note que hay dos cuentas, con distinto número de cuenta, de la misma persona.

3- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

SELECT * FROM cuentas WHERE saldo > 4000;

4- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
registros)

SELECT numero_cuenta, saldo, propietario FROM cuentas WHERE propietario =
'Juan Lopez';

5- Muestre las cuentas con saldo negativo (1 registro)

SELECT * FROM cuentas WHERE saldo < 0;

6- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):


SELECT * FROM cuentas WHERE numero_cuenta >= 3000;



Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 

 create table empleados16 (
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),
  cantidadhijos smallint
);


2- Ingrese algunos registros:
insert into empleados16 (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Juan Perez', '22333444', 'm', 'Sarmiento 123', 500, 2);

insert into empleados16 (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Ana Acosta', '24555666', 'f', 'Colon 134', 1850, 0);

insert into empleados16 (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Bartolome Barrios', '27888999', 'm', 'Urquiza 479', 10000.80, 4);


3- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al 
valor más cercano 800.89):

insert into empleados16 (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Susana Molina', '29000555', 'f', 'Salta 876', 800.888, 3);



4- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)

insert into empleados16 (nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
values ('Pedro Caro', '30111222', 'm', 'Mitre 100', 1234567.89, 1);

5- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (1 registro):
SELECT * FROM empleados16
WHERE sueldobasico <= 900;

6- Seleccione los nombres de los empleados que tengan hijos (3 registros):

SELECT nombre, cantidadhijos FROM empleados16
WHERE cantidadhijos > 0;
