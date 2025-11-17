EJERCICIOS 38 AL 50;

38 - Restricción UNIQUE

Primer problema:
Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada 
"remis".

1- Cree la tabla con la siguiente estructura:

 create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

2- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:

 insert into remis(patente,marca,modelo) values('ABC123','Renault clio','1990');
 insert into remis(patente,marca,modelo) values('DEF456','Peugeot 504','1995');
 insert into remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
 insert into remis(patente,marca,modelo) values('GHI789','Fiat Duna','1995');
 insert into remis(patente,marca,modelo) values(null,'Fiat Duna','1995');

3- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
valores repetidos.
No se puede porque hay valores duplicados.
 alter table remis add constraint UQ_remis_patente unique(patente); 

4- Elimine el registro con patente duplicada y establezca la restricción.

DELETE FROM remis WHERE numero = 3;

5- Intente ingresar un registro con patente repetida (no lo permite)

ALTER TABLE remis
ADD CONSTRAINT UQ_remis_patente
UNIQUE(patente);

6- Ingresar un registro con valor nulo para el campo "patente".
Lo permite.

INSERT INTO remis(patente,marca,modelo) VALUES(NULL,'Renault 11','1995');

7- Muestre la información de las restricciones

SELECT *
FROM information_schema.table_constraints
WHERE table_name = 'remis';

-------------------------------------------------------------

39 - Eliminar restricciones (alter table - drop constraint)

Primer problema:
Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
llamada "vehiculos".

1- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada timestamp not null,
  horasalida timestamp
 );

2- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada"


ALTER TABLE vehiculos ADD CONSTRAINT pk_vehiculos_patentellegada
PRIMARY KEY (patente, horallegada)

3- Ingrese un vehículo:

 insert into vehiculos values('SDR456','a','2015/10/10 10:10',null);

4- Intente ingresar un registro repitiendo la clave primaria:

 insert into vehiculos values('SDR456','m','2015/10/10 10:10',null);
No se permite.

5- Ingrese un registro repitiendo la patente pero no la hora de llegada:

 insert into vehiculos values('SDR456','m','2015/10/10 12:10',null);

6- Ingrese un registro repitiendo la hora de llegada pero no la patente:

 insert into vehiculos values('SDR111','m','2015/10/10 10:10',null);

7- Vea todas las restricciones para la tabla "vehiculos"


  SELECT * FROM information_schema.table_constraints
  WHERE table_name = 'vehiculos'
  
 
8- Elimine la restricción "primary key".


 alter table vehiculos
  drop constraint PK_vehiculos_patentellegada;

9- Vea si se han eliminado


 select *
  from information_schema.table_constraints 
  where table_name = 'vehiculos';

-------------------------------------------------------------------


41 - Típos de índices (create y drop)

Primer problema:
1- Cree la tabla con la siguiente estructura:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
 );

2- Ingrese los siguientes registros:
 insert into agenda values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
 insert into agenda values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
 insert into agenda values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
 insert into agenda values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
 insert into agenda values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
 insert into agenda values('Ferreyra','Patricia','Colon 1534','4585858',null);
 insert into agenda values('Perez','Susana','San Martin 333',null,null);
 insert into agenda values('Perez','Luis','Urquiza 
444','0354545256','perezluisalberto@hotmail.com');
 insert into agenda values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

3- Cree un índice común por el campo apellido.

CREATE INDEX dx_agenda_apellido ON agenda(apellido);

4- Cree un índice único por el mail.

CREATE UNIQUE INDEX dx_agenda_mail ON agenda(mail);

5- Borre los dos índices.

DROP INDEX dx_agenda_apellido;
DROP INDEX dx_agenda_mail;
---------------------------------------------------------------------


42 - Cláusulas limit y offset del comando select

Primer problema:
Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Cree la tabla con la siguiente estructura:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30)
 );

2- Ingrese 5 registros.

INSERT INTO agenda VALUES('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
INSERT INTO agenda VALUES('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
INSERT INTO agenda VALUES('Lopez','Juan','Avellaneda 900',NULL,'juancitoLopez@gmail.com');
INSERT INTO agenda VALUES('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
INSERT INTO agenda VALUES('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');

3- Realice una consulta limitando la salida a sólo 3 registros.

SELECT * FROM agenda
LIMIT 3;
4- Muestre los registros desde el 2 al 4.

SELECT * FROM agenda
OFFSET 1 LIMIT 3;

5- Muestre 4 registros a partir del 2 ordenado por apellido.

SELECT * FROM agenda
ORDER BY apellido
OFFSET 1 LIMIT 4;
-- ignora el primer registro, muestra a partir del 2. 

-------------------------------------------------------

44 - Combinación interna (inner join)


Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.

1- Créelas con las siguientes estructuras:

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Torres Fabiola','Alem 777','Ibera',3);

3- Obtenga los datos de ambas tablas, usando alias

SELECT c.codigo AS cliente_codigo,
       c.nombre AS cliente_nombre,
       c.domicilio,
       c.ciudad,
       p.codigo AS provincia_codigo,
       p.nombre AS provincia_nombre
FROM clientes c
INNER JOIN provincias p
ON c.codigoprovincia = p.codigo;


4- Obtenga la misma información anterior pero ordenada por nombre de provincia.

    SELECT c.codigo AS cliente_codigo,
       c.nombre AS cliente_nombre,
       c.domicilio,
       c.ciudad,
       p.codigo AS provincia_codigo,
       p.nombre AS provincia_nombre
FROM clientes c
INNER JOIN provincias p
ON c.codigoprovincia = p.codigo
ORDER BY p.nombre ASC;

5- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)

        SELECT c.nombre, c.ciudad
        FROM clientes c
        INNER JOIN provincias p
        ON c.codigoprovincia = p.codigo
        WHERE p.nombre = 'Santa Fe';

Segundo problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada 
"inscriptos" que incluye el documento, el nombre, el deporte y si la matricula esta paga o no y una 
tabla llamada "inasistencias" que incluye el documento, el deporte y la fecha de la inasistencia.
1 - Cree las tablas:

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
 );

2- Ingrese algunos registros para ambas tablas:
 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

3- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.
Note que la condición es compuesta porque para identificar los registros de la tabla "inasistencias"
necesitamos ambos campos.

SELECT nombre, i.deporte, s.fecha FROM inscriptos i JOIN inasistencias s ON i.documento = s.documento AND i.deporte = s.deporte ORDER BY nombre, i.deporte;


4- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado inscripto en un 
determinado deporte (3 registros)

SELECT nombre, i.deporte, s.fecha FROM inscriptos i JOIN inasistencias s ON
i.documento = s.documento AND i.deporte = s.deporte WHERE i.documento = '22222222'

5- Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la 
matrícula(4 registros)

SELECT nombre, i.deporte, s.fecha FROM inscriptos i JOIN inasistencias s ON
i.deporte = s.deporte AND i.documento = s.documento WHERE matricula = 's' ORDER BY fecha ASC;

--------------------------------------------------

45 - Combinación externa izquierda (left join)

Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.
1- Cree las tablas:

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Luis','Sucre 475','Santa Rosa',5);

3- Muestre todos los datos de los clientes, incluido el nombre de la provincia

SELECT * from clientes c LEFT JOIN provincias p ON c.codigoprovincia = p.codigo

4- Realice la misma consulta anterior pero alterando el orden de las tablas

select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;

5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null;


6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
nombre del cliente (2 registros)

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;

7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros)

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';


-------------------------------------------------
-- SINTAXIS DE JOIN 
            SELECT columnasX
            FROM tabla1 alias1
            [INNER|LEFT|RIGHT] JOIN tabla2 alias2
            ON alias1.columna_comun = alias2.columna_comun
            WHERE condición_opcional
            ORDER BY columna;



46 - Combinación externa derecha (right join)


Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una 
tabla "provincias" donde registra los nombres de las provincias.
1-Cree las tablas:
 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Luis','Sucre 475','Santa Rosa',5);

3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right 
join".

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias p
  right join clientes c
  on codigoprovincia = p.codigo;

4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes c
  left join provincias p
  on codigoprovincia = p.codigo;

5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en 
"provincias" (5 registros)

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias p
  right join clientes c
  on codigoprovincia = p.codigo
  where p.codigo is not null;

6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
ciudad (2 registros)

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias p
  right join clientes c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad;


  ----------------------------------------------
  
47 - Combinación externa completa (full join)


Primer problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "deportes" 
en la cual incluye el nombre del deporte y el nombre del profesor y en otra tabla llamada 
"inscriptos" que incluye el documento del socio que se inscribe, el deporte y si la matricula está 
paga o no.
1- Cree las tablas:

 create table deportes(
  codigo serial,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte smallint not null,
  matricula char(1) 
 );

2- Ingrese algunos registros para ambas tablas:
 insert into deportes(nombre,profesor) values('tenis','Marcelo Roca');
 insert into deportes(nombre,profesor) values('natacion','Marta Torres');
 insert into deportes(nombre,profesor) values('basquet','Luis Garcia');
 insert into deportes(nombre,profesor) values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
obtener el nombre de cada deporte (6 registros)

 select documento,d.nombre,matricula
  from inscriptos as i
  join deportes as d
  on codigodeporte=codigo;


4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)

 select documento,d.nombre,matricula
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo;

5- Obtenga la misma salida anterior empleando un "rigth join".

 select documento,d.nombre,matricula
  from deportes as d
  right join inscriptos as i
  on codigodeporte=codigo;

6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)

 select nombre
  from deportes as d
  left join inscriptos as i
  on codigodeporte=codigo
  where codigodeporte is null;


7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 
registro)

 select documento
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo
  where codigo is null;

8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)

 select documento,nombre,profesor,matricula
  from inscriptos as i
  full join deportes as d
  on codigodeporte=codigo; 



  --------------------------------------------------


  48 - Combinaciones cruzadas (cross join)

Primer problema:
Una agencia matrimonial almacena la información de sus clientes de sexo femenino en una tabla 
llamada "mujeres" y en otra la de sus clientes de sexo masculino llamada "varones".
1- Cree las tablas:

 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

2- Ingrese los siguientes registros:
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un "cross join" (12 registros)

SELECT m.nombre AS mujer, v.nombre AS varon
FROM mujeres m
CROSS JOIN varones v;


4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 
registros)

SELECT m.nombre AS mujer, v.nombre AS varon
FROM mujeres m
CROSS JOIN varones v
WHERE m.edad > 40 AND v.edad > 40;


5- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 
registros)

SELECT m.nombre AS mujer, v.nombre AS varon, ABS(m.edad - v.edad) AS diferencia
FROM mujeres m
CROSS JOIN varones v
WHERE ABS(m.edad - v.edad) <= 10;


Segundo problema:
Una empresa de seguridad almacena los datos de sus guardias de seguridad en una tabla llamada 
"guardias". también almacena los distintos sitios que solicitaron sus servicios en una tabla llamada "tareas".

1- Cree las tablas:
 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), 
  domicilio varchar(30),
  primary key (documento)
 );

 create table tareas(
  codigo serial,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2),
  primary key (codigo)
 );

2- Ingrese los siguientes registros:
 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas(domicilio,descripcion,horario) 
   values('Colon 1111','vigilancia exterior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas(domicilio,descripcion,horario)
   values('Peru 345','vigilancia interior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Avellaneda 890','vigilancia interior','PM');

3- La empresa quiere que todos sus empleados realicen todas las tareas. Realice una "cross join" (20 registros)

SELECT g.nombre AS guardia, t.descripcion, t.domicilio
FROM guardias g
CROSS JOIN tareas t;

4- En este caso, la empresa quiere que todos los guardias de sexo femenino realicen las tareas de 
"vigilancia interior" y los de sexo masculino de "vigilancia exterior". Realice una "cross join" 
con un "where" que controle tal requisito (10 registros)

SELECT g.nombre AS guardia, t.descripcion, t.domicilio
FROM guardias g
CROSS JOIN tareas t
WHERE (g.sexo = 'f' AND t.descripcion = 'vigilancia interior')
   OR (g.sexo = 'm' AND t.descripcion = 'vigilancia exterior');


----------------------------------------------------------

49 - Autocombinación


Primer problema:
Una agencia matrimonial almacena la información de sus clientes en una tabla llamada "clientes".
1- Cree la tabla:
 create table clientes(
  nombre varchar(30),
  sexo char(1),
  edad int,
  domicilio varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un  "cross join" (12 registros)

SELECT m.nombre AS mujer, h.nombre AS varon
FROM clientes m
CROSS JOIN clientes h
WHERE m.sexo = 'f' AND h.sexo = 'm';

4- Obtenga la misma salida anterior pero realizando un "join".

SELECT m.nombre AS mujer, h.nombre AS varon
FROM clientes m
JOIN clientes h
ON m.sexo = 'f' AND h.sexo = 'm';


5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no 
tengan una diferencia superior a 5 años (5 registros)

SELECT m.nombre AS mujer, h.nombre AS varon, ABS(m.edad - h.edad) AS diferencia
FROM clientes m
CROSS JOIN clientes h
WHERE m.sexo = 'f' 
  AND h.sexo = 'm'
  AND ABS(m.edad - h.edad) <= 5;


Segundo problema:
Varios clubes de barrio se organizaron para realizar campeonatos entre ellos. La tabla llamada 
"equipos" guarda la información de los distintos equipos que jugarán.
1- Cree la tabla:

 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

3- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" 
para combinar los equipos teniendo en cuenta que un equipo no juega consigo mismo (12 registros)

SELECT e1.nombre AS local, e2.nombre AS visitante
FROM equipos e1
CROSS JOIN equipos e2
WHERE e1.nombre <> e2.nombre;

4- Obtenga el mismo resultado empleando un "join".

SELECT e1.nombre AS local, e2.nombre AS visitante
FROM equipos e1
JOIN equipos e2
ON e1.nombre <> e2.nombre;

5- Realice un "cross join" para combinar los equipos para que cada equipo juegue con cada uno de 
los otros una sola vez (6 registros)

SELECT e1.nombre AS local, e2.nombre AS visitante
FROM equipos e1
CROSS JOIN equipos e2
WHERE e1.nombre < e2.nombre;

-------------------------------------------------------------------


50 - Combinaciones y funciones de agrupamiento

Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos 
datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus 
productos y en otra tabla llamada "ciudades" los nombres de las ciudades.
1- Cree las tablas:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad smallint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
 );
 
2- Ingrese algunos registros:
 insert into ciudades(nombre) values('Cordoba');
 insert into ciudades(nombre) values('Carlos Paz');
 insert into ciudades(nombre) values('La Falda');
 insert into ciudades(nombre) values('Cruz del Eje');

 insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);

3- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)

SELECT c.nombre AS ciudad, COUNT(*) AS visitas
FROM visitantes v
JOIN ciudades c
ON v.codigociudad = c.codigo
GROUP BY c.nombre;


4- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)

SELECT c.nombre AS ciudad, v.sexo, AVG(v.montocompra) AS promedio_gasto
FROM visitantes v
JOIN ciudades c
ON v.codigociudad = c.codigo
GROUP BY c.nombre, v.sexo;

5- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)

SELECT c.nombre AS ciudad, COUNT(v.mail) AS visitantes_con_mail
FROM visitantes v
JOIN ciudades c
ON v.codigociudad = c.codigo
WHERE v.mail IS NOT NULL
GROUP BY c.nombre;

6- Obtenga el monto de compra más alto de cada ciudad (3 filas)

SELECT c.nombre AS ciudad, MAX(v.montocompra) AS mayor_compra
FROM visitantes v
JOIN ciudades c
ON v.codigociudad = c.codigo
GROUP BY c.nombre;

---------------------------------------------------------------

51 - Combinación de más de dos tablas

Primer problema:
Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos 
deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.

1- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  anio char(4),
  matricula char(1), 
  primary key(documento,codigodeporte,anio)
 );

2- Ingrese algunos registros en "socios":

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

3- Ingrese algunos registros en "deportes":

 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

4- Inscriba a varios socios en el mismo deporte en el mismo año:

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

5- Inscriba a un mismo socio en el mismo deporte en distintos años:

 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

6- Inscriba a un mismo socio en distintos deportes el mismo año:

 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

7- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
exista en "socios":

 insert into inscriptos values ('26666666',0,'2006','s');

8- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
diferentes tipos de join.
 
 inner JOIN

SELECT s.nombre AS socio, d.nombre AS deporte, i.anio
FROM inscriptos i
JOIN socios s ON i.documento = s.documento
JOIN deportes d ON i.codigodeporte = d.codigo;

left join 

SELECT s.nombre AS socio, d.nombre AS deporte, i.anio
FROM inscriptos i
LEFT JOIN socios s ON i.documento = s.documento
LEFT JOIN deportes d ON i.codigodeporte = d.codigo;

9- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
encuentra en "socios".

SELECT s.nombre AS socio, s.domicilio AS domicilio_socio,
       d.nombre AS deporte, d.profesor AS profesor,
       i.anio, i.matricula
FROM inscriptos i
FULL JOIN socios s ON i.documento = s.documento
FULL JOIN deportes d ON i.codigodeporte = d.codigo;


10- Muestre todas las inscripciones del socio con documento "22222222".

SELECT s.nombre AS socio, d.nombre AS deporte, i.anio, i.matricula
FROM inscriptos i
LEFT JOIN socios s ON i.documento = s.documento
LEFT JOIN deportes d ON i.codigodeporte = d.codigo
WHERE i.documento = '22222222';
