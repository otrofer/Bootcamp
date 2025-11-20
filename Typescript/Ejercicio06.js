var promptSync = require('prompt-sync')();
var IVA = 0.10;
var input = promptSync("Introduce el precio del producto para calcular: ");
var precio = Number(input); // convierte la cadena ingresada a texto
var precioFinal = precio + precio * IVA;
console.log("Precio SIN IVA: ", precio);
console.log("El precio final CON IVA es: ", precioFinal);
