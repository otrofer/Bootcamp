Columnas Calculadas


Primer problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Cree la tabla:
 
    CREATE TABLE articulos (
    codigo serial,
    nombre varchar(20),
    descripcion varchar(30),
    precio decimal (9,2),
    cantidad smallint default 0,
    primary key (codigo)
    );

2- Ingrese algunos registros:

    INSERT INTO articulos (
    nombre, descripcion, precio, cantidad
    ) VALUES ('Impresora', 'Epson Stylus C45',
    400.80, 20);
    INSERT INTO articulos (
    nombre, descripcion, precio) VALUES ('Impresora', 'Epson Stylus C85',
    500);
    INSERT INTO articulos (
    nombre, descripcion, precio) VALUES ('Monitor', 'Samsung 14',
    800);
    INSERT INTO articulos (
    nombre, descripcion, precio, cantidad) VALUES ('Teclado', 'Ingles Biswal',
    100, 50);

3- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
precios empleando operadores aritméticos.

    UPDATE articulos SET precio = precio * 0.15;

5- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
separados por coma.

    SELECT nombre || ', ' || descripcion AS articulo FROM articulos

6- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")

    UPDATE articulos SET cantidad = cantidad - 5 WHERE nombre = 'Teclado';