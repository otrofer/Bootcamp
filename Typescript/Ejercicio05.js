var promptSync = require('prompt-sync')();
var numero;
numero = promptSync("Introduce un número para analizar: ");
if (numero % 2 === 0)
    console.log("Es divisible entre 2");
else
    console.log("No es divisible entre 2");
