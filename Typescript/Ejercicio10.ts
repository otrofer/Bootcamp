
import promptSync = require('prompt-sync');

const prompt = promptSync();

const dias_laborales: string[] = ["lunes", "martes", "miercoles", "jueves", "viernes"];
const finde: string[] = ["sabado", "domingo"];

console.log("Calculadora de dias de la semana. ");
let input_usuario = prompt("Ingrese un dia de la semana a determinar: ").toLowerCase();

if (dias_laborales.includes(input_usuario)) { // ese include permite agregar todo dentro del array entonces busca y si coincide, todo good.

    console.log("Es un dia laboral. ")

} else if (finde.includes(input_usuario)) {

    console.log("No es un dia laboral ")

} else {

    console.log("Respuesta no valida, ingrese nuevamente. ") 
}