"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var promptSync = require("prompt-sync");
var prompt = promptSync();
var dias_laborales = ["lunes", "martes", "miercoles", "jueves", "viernes"];
var finde = ["sabado", "domingo"];
console.log("Calculadora de dias de la semana. ");
var input_usuario = prompt("Ingrese un dia de la semana a determinar: ").toLowerCase();
if (dias_laborales.includes(input_usuario)) { // ese include permite agregar todo dentro del array entonces busca y si coincide, todo good.
    console.log("Es un dia laboral. ");
}
else if (finde.includes(input_usuario)) {
    console.log("No es un dia laboral ");
}
else {
    console.log("Respuesta no valida, ingrese nuevamente. ");
}
