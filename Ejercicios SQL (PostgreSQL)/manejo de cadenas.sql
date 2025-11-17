Manejo de Cadenas.
Primer problema:
Trabaje con la tabla que almacena los datos de clientes.

1- Créela con la siguiente estructura:

create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

2- Ingresar algunos registros:
 insert into clientes(documento,apellido,nombre,domicilio,telefono)
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio,telefono)
  values('2333344','Perez','Ana','Colon 234','2345123');
 insert into clientes(documento,apellido,nombre,domicilio,telefono)
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes (documento,apellido,nombre,domicilio,telefono)
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

3- Mostrar todos los registros disponiendo en mayúsculas el apellido y el nombre.

SELECT documento, UPPER(apellido), UPPER(nombre), domicilio,
telefono FROM clientes;

4- Mostrar el primer caracter del nombre

SELECT documento, apellido, substr(nombre, 1, 1),
domicilio, telefono FROM clientes;