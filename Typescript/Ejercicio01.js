var numero1;
var numero2;
numero1 = 150
numero2 = 7
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
function modulo() {
    return numero1 % numero2;

}
console.log("La suma de ambos numeros es: ", suma());
console.log("La resta de ambos numeros es: ", resta());
console.log("La multiplicacion de ambos numeros es: ", multiplication());
console.log("La division de ambos numeros es: ", division())
if (modulo() === 0) {
    console.log("No tiene modulo.");
}
else {
    console.log("El modulo de la division queda: ", modulo());
}
