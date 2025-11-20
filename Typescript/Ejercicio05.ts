
const promptSync = require('prompt-sync')();


let numero: number;

numero = promptSync("Introduce un número para analizar: ")

if (numero % 2 === 0) console.log("Es divisible entre 2")
else console.log("No es divisible entre 2")
