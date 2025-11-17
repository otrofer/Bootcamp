ORDERBY

    Primer problema:

En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, 
pais, fecha.

1- Créela con la siguiente estructura:
    
    create table visitas (
    numero serial,
    nombre varchar(30) default 'Anonimo',
    mail varchar(50),
    pais varchar (20),
    fecha timestamp,
    primary key(numero)
    );

2- Ingrese algunos registros:

    insert into visitas (nombre,mail,pais,fecha)
    values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
    insert into visitas (nombre,mail,pais,fecha)
    values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

3- Ordene los registros por fecha, en orden descendente.

SELECT nombre, mail, pais, fecha FROM visitas ORDER BY fecha DESC;

4- Muestre el nombre del usuario, pais y el número de mes, ordenado por pais (ascendente)
 y número de mes (descendente)
    
    SELECT nombre, pais, EXTRACT(MONTH FROM fecha) as mes FROM visitas ORDER BY pais ASC, mes DESC;

5- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
hora.

SELECT pais, EXTRACT(MONTH FROM fecha) as mes, EXTRACT(DAY FROM fecha) as dia, EXTRACT(HOUR FROM fecha) as hora FROM visitas ORDER BY mes, dia, hora

6- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)

SELECT mail, pais, fecha FROM visitas WHERE EXTRACT(MONTH FROM fecha) = 10 ORDER BY pais;