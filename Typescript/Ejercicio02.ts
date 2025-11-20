/* Declarar dos variables y ver si una es mayor que otra */

let x: number;
let y: number;

x=100;
y=5;

console.log("Calculadora de numeros: ")

if (x===y) {

    console.log("Numero 1: ", x)
    console.log("Numero 2: ", y)

    console.log("Los numeros presentados son iguales.");

} 
else if (x < y) {

    console.log("Numero 1: ", x)
    console.log("Numero 2: ", y)

console.log("El numero", x ,"es menor a ", y)
}  else if (x > y) 
    {

    console.log("Numero 1: ", x)
    console.log("Numero 2: ", y)

    console.log("El numero", x , "es mayor a", y);

}