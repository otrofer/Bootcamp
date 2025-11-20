
const promptSync = require('prompt-sync')();

const IVA = 0.10

let input = promptSync("Introduce el precio del producto para calcular: ")

let precio: number = Number(input); // convierte la cadena ingresada a texto

let precioFinal = precio + precio * IVA

console.log("Precio SIN IVA: ", precio)
console.log("El precio final CON IVA es: ", precioFinal)

