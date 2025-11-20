var promptSync = require('prompt-sync')();
var numero;
do {
    numero = Number(promptSync("Ingresa un numero mayor que 0: "));
} while (numero <= 0);
console.log("Numero ingresado: ", numero);
