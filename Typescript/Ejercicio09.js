"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var PromptSync = require("prompt-sync");
var prompt = PromptSync();
var password = "fercho2004";
var intentos_usuario = 0;
var input_usuario;
console.log("Universidad Ferchos - Portal Alumno -");
while (intentos_usuario < 3) {
    input_usuario = prompt("Ingrese la contraseña: ");
    if (input_usuario === password) {
        console.log("Correcto! Bienvenido/a ");
        break;
    }
    else
        (input_usuario != password);
    {
        console.log("Incorrecto, ingrese de nuevo. ");
        intentos_usuario++;
    }
    if (intentos_usuario === 3) {
        console.log("Vuelva a probar mas tarde, gracias. ");
    }
}
