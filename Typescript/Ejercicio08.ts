const promptSync = require('prompt-sync')();

let numero: number;

do {
    numero = Number(promptSync("Ingresa un numero mayor que 0: "));

} while (numero <= 0)

console.log("Numero ingresado: ", numero)

