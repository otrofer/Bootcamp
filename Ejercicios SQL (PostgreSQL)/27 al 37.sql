27. OPERADORES RELACIONALES (BETWEEN)


Primer problema:
En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, 
pais, fechayhora de la visita.

1- Créela con la siguiente estructura:
drop table if exists visitas
 create table visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora timestamp,
  primary key(numero)
);

3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');

3- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 
registros)
Note que incluye los de fecha mayor o igual al valor mínimo y menores al valor máximo, y que los 
valores null no se incluyen.

SELECT * FROM visitas WHERE fechayhora >= '2006-09-12' AND 
fechayhora < '2006-10-12'

4- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
Note que incluye los valores límites. 

SELECT * FROM visitas WHERE numero BETWEEN 2 AND 5;

            SEGUNDO PROBLEMA DEL EJERCICIO BETWEEN 

Una concesionaria de autos vende autos usados y almacena la información en una tabla llamada 
"autos".

1- Cree la tabla con la siguiente estructura:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

2- Ingrese algunos registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1980',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1995',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

3- Seleccione todos los autos cuyo modelo se encuentre entre '1970' y '1990' usando el operador 
"between" y ordénelos por dicho campo(4 registros)

SELECT * FROM autos WHERE modelo BETWEEN '1970' AND '1990' ORDER BY modelo ASC;

4- Seleccione todos los autos cuyo precio esté entre 50000 y 100000.

SELECT * FROM autos WHERE precio BETWEEN 50000 AND 100000

---------------------------------------------------------

28. OPERADORES RELACIONALES (IN).

Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.

1- Cree la tabla con la siguiente estructura:
DROP TABLE if exists medicamentos
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  primary key(codigo)
 );

2- Ingrese algunos registros:
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Sertal','Roche',5.2,1,'2005-02-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Buscapina','Roche',4.10,3,'2006-03-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal 500','Bayer',15.60,100,'2007-05-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Paracetamol 500','Bago',1.90,20,'2008-02-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Bayaspirina','Bayer',2.10,150,'2009-12-01'); 
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01'); 

3- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
empleando el operador "in" (4 registros)

SELECT nombre, precio FROM medicamentos WHERE laboratorio IN ('Bayer', 'Bago')

4- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
luego el operador "in" (2 registros)
Note que es más conveniente emplear, en este caso, el operador "between".

SELECT * FROM medicamentos WHERE cantidad BETWEEN 1 AND 5 

SELECT * FROM medicamentos WHERE cantidad IN (1, 5)

-----------------------------------------------------------

29. BUSQUEDA DE PATRONES (LIKE - NOT LIKE)

Primer problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".

1- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

3- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)

SELECT * FROM empleados WHERE nombre LIKE '%Perez%'

4- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)

SELECT * FROM empleados WHERE domicilio LIKE 'Co%' and domicilio LIKE '%8%'

5- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 
registros)

SELECT nombre, sueldo FROM empleados WHERE cast(sueldo as varchar) NOT LIKE '%.00'

6- Muestre los empleados que hayan ingresado en "1990" (3 registros)

SELECT * FROM empleados WHERE CAST(EXTRACT(YEAR FROM fechaingreso) AS varchar) LIKE '%1990%'

-----------------------------------------------------------

30. COUNT (CONTAR REGISTROS)

Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.

1- Cree la tabla con la siguiente estructura:
DROP TABLE IF EXISTS medicamentos
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  numerolote int default null,
  primary key(codigo)
 );

3- Ingrese algunos registros:
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

3- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)

SELECT COUNT(*) FROM medicamentos

4- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)

SELECT COUNT(laboratorio) FROM medicamentos WHERE laboratorio IS NOT NULL

5- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
distinto a "null", disponer alias para las columnas.

SELECT COUNT(precio) as precio_final, COUNT(cantidad) as cantidad_conocida FROM medicamentos WHERE cantidad IS NOT NULL AND precio IS NOT NULL

6- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 
registros)

SELECT COUNT(*) AS cantidad_conocidad FROM medicamentos WHERE precio IS NOT NULL AND laboratorio LIKE 'B%'

7- Cuente la cantidad de medicamentos con número de lote distinto de "null" (0 registros)

SELECT COUNT(cantidad) FROM medicamentos WHERE numerolote IS NOT NULL



-----------------------------------------------------------


31 - Funciones de agrupamiento (count - sum - min - max - avg)

Primer problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".

1- Cree la tabla:
drop table if exists empleados
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

3- Muestre la cantidad de empleados usando "count" (9 empleados)

SELECT COUNT(empleados) FROM empleados

4- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)

SELECT COUNT(sueldo) FROM empleados WHERE sueldo IS NOT NULL and seccion = 'Secretaria'

5- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)

SELECT MAX(sueldo) as sueldo_mas_alto, MIN(sueldo) AS sueldo_mas_bajo FROM empleados WHERE sueldo BETWEEN 2000 AND 5000 

6- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	

SELECT MAX(cantidadhijos) as HIJOS FROM empleados WHERE nombre LIKE '%Perez%';

7- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
tenido en cuenta)

SELECT AVG(sueldo) as promedio_sueldo FROM empleados

8- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)

SELECT AVG(sueldo) as promedio_secretaria FROM empleados WHERE seccion = 'Secretaria';

9- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)

SELECT AVG(cantidadhijos) as promedio_hijos FROM empleados WHERE seccion = 'Sistemas';


----------------------------------------------------------

32 - Agrupar registros (group by)

Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

1- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

2- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

3- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)

SELECT ciudad, COUNT(*) as visitantes FROM visitantes GROUP BY ciudad

4- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)

SELECT ciudad, COUNT(*) as telefono_visitante WHERE telefono IS NOT NULL FROM visitantes GROUP BY ciudad 

5- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)

SELECT sexo, SUM(montocompra) as total_monto FROM visitantes GROUP BY sexo

6- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)

SELECT sexo, ciudad, MAX(montocompra) as maximo_compra, MIN(montocompra) AS minimo_compra FROM visitantes GROUP BY sexo, ciudad;


7- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)

SELECT ciudad, AVG(montocompra) AS promedio_compra FROM visitantes GROUP BY ciudad;

8- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas)

SELECT ciudad, COUNT(*) FROM visitantes WHERE mail != 'no tiene' GROUP BY ciudad

Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".
1- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  fechaingreso date,
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);

3- Cuente la cantidad de empleados agrupados por sección (5 filas)

SELECT seccion, COUNT(*) FROM empleados GROUP BY seccion;

4- Calcule el promedio de hijos por sección (5 filas)

SELECT seccion, AVG(cantidadhijos) AS promedio_hijos FROM empleados GROUP BY seccion

5- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)

SELECT EXTRACT(YEAR FROM fechaingreso) as ingreso,
COUNT(*) AS cantidad_empleados,  
STRING_AGG(nombre, ' - ') AS empleados
FROM empleados
GROUP BY EXTRACT(YEAR FROM fechaingreso) 
ORDER BY ingreso ASC;

6- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)

SELECT AVG(sueldo) as sueldo_promedio, seccion FROM empleados WHERE cantidadhijos > 0
GROUP BY seccion
ORDER BY seccion;


----------------------------------------------


33 - Seleccionar grupos (having)

Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes".

1- Créela con la siguiente estructura:
 create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);

3- Ingrese algunos registros:
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes(nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

3- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)

SELECT ciudad, provincia, COUNT(*) FROM clientes GROUP BY ciudad, provincia

4- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
menos de 2 clientes (3 filas)

SELECT ciudad, provincia, COUNT(*) AS total_clientes FROM clientes GROUP BY ciudad, provincia 
HAVING COUNT(*) >= 2;


Segundo problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

1- Créela con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

2- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

3- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un 
valor superior a 50 (3 filas)

SELECT ciudad, sexo, SUM(montocompra) as total_compras FROM visitantes GROUP BY ciudad, sexo HAVING SUM(montocompra) > 50

4- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior 
a 30 (3 filas)

SELECT ciudad, sexo, COUNT(*) AS total_visitantes, SUM(montocompra) AS suma_compras, AVG(montocompra) AS promedio_compra FROM visitantes GROUP BY ciudad, sexo HAVING AVG(montocompra) > 30 ORDER BY suma_compras ASC;



--------------------------------------------------------


34 - Registros duplicados (distinct)
SIRVE PARA ELIMINAR DUPLICADOS

Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes".

1- Créela con la siguiente estructura:
 create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

2- Ingrese algunos registros:
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

3- Obtenga las provincias sin repetir (3 registros)

SELECT DISTINCT provincia FROM clientes

4- Cuente las distintas provincias.

SELECT COUNT(DISTINCT provincia) as total_provincias FROM clientes

5- Se necesitan los nombres de las ciudades sin repetir (6 registros)

SELECT DISTINCT ciudad FROM clientes

6- Obtenga la cantidad de ciudades distintas.

SELECT COUNT(DISTINCT ciudad) AS total_ciudades FROM clientes;

7- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)

SELECT DISTINCT ciudad FROM clientes WHERE provincia = 'Cordoba';


8- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)

SELECT provincia, COUNT(DISTINCT ciudad) AS total_ciudades FROM clientes GROUP BY provincia;


                    Segundo problema:

La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus 
propietarios para cobrar impuestos.

1- Créela con la siguiente estructura:
 create table inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
 );

3- Ingrese algunos registros:
 insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

3- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)

SELECT DISTINCT apellido FROM inmuebles

4- Muestre los distintos documentos de los propietarios, sin repetir (6 registros)

SELECT DISTINCT documento FROM inmuebles

5- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)

SELECT COUNT(DISTINCT nombre) as cantidad_propietarios FROM inmuebles

6- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2)

SELECT COUNT(ciudad) as cantidad_ciudad FROM inmuebles WHERE domicilio LIKE 'San Martin%'

7- Muestre los apellidos y nombres, sin repetir (5 registros)
Note que hay 2 personas con igual nombre y apellido que aparece una sola vez.

SELECT DISTINCT apellido, nombre FROM inmuebles

8- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir 
barrio (6 registros)

SELECT documento, COUNT(DISTINCT barrio) AS cantidad FROM inmuebles GROUP BY DOCUMENTO 



------------------------------------------------------------


35 - Clave primaria compuesta

Primer problema:
Un consultorio médico en el cual trabajan 3 médicos registra las consultas de los pacientes en una 
tabla llamada "consultas".

1- La tabla contiene los siguientes datos:
  - fechayhora: timestamp not null, fecha y hora de la consulta,
  - medico: varchar(30), not null, nombre del médico (Perez,Lopez,Duarte),
  - documento: char(8) not null, documento del paciente,
  - paciente: varchar(30), nombre del paciente,
  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).

2- Un médico sólo puede atender a un paciente en una fecha y hora determinada. En una fecha y hora 
determinada, varios médicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
primaria compuesta:
 create table consultas(
  fechayhora timestamp not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

3- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.

INSERT INTO consultas 
(fechayhora, medico, documento, paciente, obrasocial)
VALUES
('2025-03-23 09:00', 'Raquel Salinas', '58990577', 'Felicia Rojas', 'Metropolitano');

INSERT INTO consultas 
VALUES
('2025-03-23 10:00', 'Raquel Salinas', '58990577', 'Carlos Ruiz', 'PAMI');

INSERT INTO consultas 
VALUES
('2025-03-23 11:00', 'Raquel Salinas', '58990577', 'Ana Torres', 'Swiss Medical');

4- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.

INSERT INTO consultas
VALUES ('2025-03-24 15:00', 'Marcos Paz', '55000111', 'Luis Soto', 'OSDE');

INSERT INTO consultas
VALUES ('2025-03-24 15:00', 'Paula Diaz', '55000222', 'Marta Veloz', 'PAMI');


5- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.

INSERT INTO consultas
VALUES ('2025-03-23 09:00', 'Raquel Salinas', '58990577', 'Juan Perez', 'OSDE');

 

Segundo problema:
Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la 
información necesaria.

1- La tabla contiene los siguientes campos:
 - documento del socio alumno: char(8) not null
 - nombre del socio: varchar(30),
 - nombre del deporte (tenis, futbol, natación, basquet): varchar(15) not null,
 - año de inscripcion: smallint,
 - matrícula: si la matrícula ha sido o no pagada ('s' o 'n').

2- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en 
varios deportes en distintos años. Un socio no puede inscribirse en el mismo deporte el mismo año. 
Varios socios se inscriben en un mismo deporte en distintos años. Cree la tabla con una clave 
compuesta:
 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año date,
  matricula char(1),
  primary key(documento,deporte,año)
 );

3- Inscriba a varios alumnos en el mismo deporte en el mismo año

INSERT INTO inscriptos VALUES ('11111111', 'Juan Perez', 'Futbol', '2024-01-01', 'N');
INSERT INTO inscriptos VALUES ('22222222', 'Ana Gomez', 'Futbol', '2024-01-01', 'S');
INSERT INTO inscriptos VALUES ('33333333', 'Marcos Ruiz', 'Futbol', '2024-01-01', 'S');

4- Inscriba a un mismo alumno en varios deportes en el mismo año

INSERT INTO inscriptos VALUES ('44444444', 'Carla Diaz', 'Tenis', '2024-01-01', 'S');
INSERT INTO inscriptos VALUES ('44444444', 'Carla Diaz', 'Natacion', '2024-01-01', 'S');
INSERT INTO inscriptos VALUES ('44444444', 'Carla Diaz', 'Basquet', '2024-01-01', 'S');


5- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos años

INSERT INTO inscriptos VALUES ('55555555', 'Lucia Lopez', 'Hockey', '2023-01-01', 'S');
INSERT INTO inscriptos VALUES ('55555555', 'Lucia Lopez', 'Hockey', '2024-01-01', 'S');
INSERT INTO inscriptos VALUES ('55555555', 'Lucia Lopez', 'Hockey', '2025-01-01', 'S');

6- Intente inscribir a un socio alumno en un deporte en el cual ya esté inscripto.

INSERT INTO inscriptos VALUES ('55555555', 'Lucia Lopez', 'Hockey', '2024-01-01', 'N');
sale error.

7- Intente actualizar un registro para que la clave primaria se repita.

INSERT INTO inscriptos VALUES 
('77777777', 'Maria Vera', 'Hockey', '2024-01-01', 'S');

UPDATE inscriptos
SET documento = '55555555'
WHERE documento = '77777777' 
  AND deporte = 'Hockey'
  AND año = '2024-01-01';

--------------------------------------------------------


36 - Restricción CHECK

Primer problema:
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento date,
  cantidadhijos smallint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

2- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
sueldo
ALTER TABLE empleados ADD CONSTRAINT sueldo check (sueldo > 0)
 -- el sueldo debe ser siempre mayor a 0.

3- Ingrese algunos registros válidos:

 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

4- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
valor 5000
La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

ALTER TABLE empleados ADD CONSTRAINT empleados_sueldo_maximo CHECK (sueldo <= 5000);


5- Elimine el registro infractor y vuelva a crear la restricción
DELETE FROM empleados WHERE sueldo > 5000;
ALTER TABLE empleados ADD CONSTRAINT CK_empleados_sueldo_maximo CHECK (sueldo <= 5000);

6- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
fecha actual
ALTER TABLE empleados ADD CONSTRAINT empleados_fecha_nacimiento CHECK (fechanacimiento <= CURRENT_DATE);


7- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 
15.

ALTER TABLE empleados ADD CONSTRAINT empleados_cantidad_hijos CHECK (cantidadhijos BETWEEN 0 AND 15);

8- Vea todas las restricciones de la tabla (5 filas)

 select * from information_schema.table_constraints where table_name = 'empleados';

9- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
Mensaje de error porque se infringe la restricción "empleados_sueldo_positivo".

 insert into empleados values ('24444444','Carlos Fuentes','1980/02/05',2,'Administracion',-1500);

10- Intente agregar un registro con fecha de nacimiento futura.
Mensaje de error.

 insert into empleados values ('25555555','Daniel Garcia','2007/05/05',2,'Sistemas',1550);

11- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
Mensaje de error.

 update empleados set cantidadhijos=21 where documento='22222222';

 

                                Segundo problema

Una playa de estacionamiento almacena los datos de los vehículos que ingresan en la tabla llamada 
"vehiculos".

1- Cree la tabla:
DROP TABLE IF exists vehiculos;
 create table vehiculos(
  numero serial,
  patente char(6),
  tipo char(4),
  fechahoraentrada timestamp,
  fechahorasalida timestamp,
  primary key(numero)
 );

2- Ingresamos algunos registros:
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) 
   values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

3- Agregue una restricción "check" para asegurarse que la fecha de entrada a la playa no sea 
posterior a la fecha y hora actual

ALTER TABLE vehiculos ADD CONSTRAINT ck_vehiculos_fechaentrada_actual CHECK (fechahoraentrada <= fechahorasalida)


4- Agregue otra restricción "check" al campo "fechahoraentrada" que establezca que sus valores no 
sean posteriores a "fechahorasalida"

ALTER TABLE vehiculos ADD CONSTRAINT ck_vehiculos_fechahoraentradasalida
CHECK (fechahoraentrada <= fechahorasalida)

5- Intente ingresar un valor que no cumpla con la primera restricción establecida en el campo 
"fechahoraentrada"

 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('ABC123','auto','2007/05/05 10:10',null);

6- Intente modificar un registro para que la salida sea anterior a la entrada
Mensaje de error.

 update vehiculos set fechahorasalida='2007/01/17 7:30'
  where patente='CAA258';

7- Vea todas las restricciones para la tabla "vehiculos":

 select *
  from information_schema.table_constraints 
  where table_name = 'vehiculos';
8- Vea todos los registros

SELECT * FROM vehiculos;


---------------------------------------------------------

37 - Restricción primary key

Primer problema:
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".

1- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

2- Ingrese algunos registros, dos de ellos con el mismo número de documento:
 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

3- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita 
ni admita valores nulos
No lo permite porque la tabla contiene datos que no cumplen con la restricción, debemos eliminar (o 
modificar) el registro que tiene documento duplicado.

ALTER TABLE empleados ADD CONSTRAINT PK_empleados_documento 
PRIMARY KEY(documento);

4- Establezca la restricción "primary key" del punto 3

DELETE FROM empleados WHERE nombre = 'Carlos Fuentes';
UPDATE empleados SET documento = '24444444' WHERE nombre = 'Carlos Fuentes';

5- Intente actualizar un documento para que se repita.
No lo permite porque va contra la restricción.

UPDATE empleados SET documetno = '22222222' WHERE NOMBRE = 'Beatriz Garcia';

6-Intente establecer otra restricción "primary key" con el campo "nombre".
No lo permite, sólo puede haber una restricción "primary key" por tabla.

ALTER TABLE empleados ADD CONSTRAINT pk_empleados_nombre PRIMARY KEY(NOMBRE);

7- Intente ingresar un registro con valor nulo para el documento.
No lo permite porque la restricción no admite valores nulos.

INSERT INTO empleados VALUES (NULL, 'Lucia Perez', 'Sistemas');

8- Vea las restricciones de la tabla empleados (2 filas)

SELECT * FROM information_schema.table_constraints WHERE table_name = 'empleados';


 

                                Segundo problema
                                
Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada 
"remis".

1- Cree la tabla con la siguiente estructura:
 create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

2- Ingrese algunos registros sin repetir patente:
 insert into remis (patente,marca,modelo)values('ABC123','Renault 12','1990');
 insert into remis (patente,marca,modelo)values('DEF456','Fiat Duna','1995');

3- Definir una restricción "primary key" para el campo "patente".

ALTER TABLE remis ADD CONSTRAINT pk_patente_remis PRIMARY KEY (patente);

4- Establezca una restricción "primary key" para el campo "numero".
(No lo permite ya que hay una "primary key")

ALTER TABLE remis ADD CONSTRAINT pk_remis_numero PRIMARY KEY(numero);

5- Vea la información de las restricciones

SELECT * FROM information_schema.table_constraints WHERE table_name = 'remis';

