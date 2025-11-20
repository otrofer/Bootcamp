let numero1: number;
let numero2: number;

numero1 = 10;
numero2 = 5;

function multiplication() {

    return numero1 * numero2;
}

function suma() {

    return numero1 + numero2;

}
function resta() {

    return numero1 - numero2;

}
function division() {

    return numero1 / numero2;
}

console.log("La suma de ambos numeros es: ", suma());
console.log("La resta de ambos numeros es: ", resta());
console.log("La multiplicacion de ambos numeros es: ", multiplication());
if (division() === 0) {
    console.log("No tiene modulo.");
} else {
    console.log("El modulo de la division queda: ", division());
}