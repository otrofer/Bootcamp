dato texto

na concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla 
llamada "autos".

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria:

        create table autos(
        patente char(6),
        marca varchar(20),
        modelo char(4),
        precio float,
        primary key (patente)
        );

Hemos definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
siempre tendrá la misma longitud (6 caracteres). Lo mismo sucede con el campo "modelo", en el cual 
almacenaremos el año, necesitamos 4 caracteres fijos.

2- Ingrese los siguientes registros:

        insert into autos
        values('ACD123','Fiat 128','1970',15000);
        insert into autos
        values('ACG234','Renault 11','1990',40000);
        insert into autos
        values('BCD333','Peugeot 505','1990',80000);
        insert into autos
        values('GCD123','Renault Clio','1990',70000);
        insert into autos
        values('BCC333','Renault Megane','1998',95000);
        insert into autos
        values('BVF543','Fiat 128','1975',20000);

3- Seleccione todos los autos del año 1990:

SELECT patente, marca, modelo, precio FROM autos WHERE
modelo = '1990';

4- Borre la tabla.

DROP TABLE IF EXISTS autos

5- Crearla nuevamente con la misma estructura pero utilizando las otras palabras claves para los tipos
de datos char y varchar.

CREATE TABLE autos (
patente character(6),
marca character varying(20),
modelo character(4),
precio float,
primary key (patente)
);

6- Ingrese un registro.

INSERT INTO autos VALUES 
('ACD123', 'FIAT 128', '1970', 15000);

7- Mostrar el contenido de la tabla.

SELECT * FROM AUTOS


Segundo problema:
Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".

1- Créela eligiendo el tipo de dato más adecuado para cada campo:
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

2- Analice la definición de los campos. Se utiliza char(8) para el documento porque siempre constará 
de 8 caracteres. Para el número telefónico se usar "varchar" y no un tipo numérico porque si bien es 
un número, con él no se realizarán operaciones matemáticas.

3- Ingrese algunos registros:

 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

4- Seleccione todos los clientes de apellido "Perez" (2 registros)

SELECT documento, apellido, nombre, domicilio, telefono FROM clientes WHERE apellido = 'Perez';


