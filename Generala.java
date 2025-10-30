import java.util.Arrays;

import java.util.Scanner;

public class Generala {

    // variable para guardar los datos de dados;
    int[] dados; 

    public Generala() {
        // constructor.
        // con 5 posicionesd
        this.dados = new int[5];
    }

    public String jugadasGenerala() {
        int[] conteo = new int[7];
        //  metodo que analiza que jugadas hay.
        for (int d : dados) {
            conteo[d]++; // va a recoorer cada valor de la matriz dados.
        }

        boolean esGenerala = false; // aca pongo bools paracada patron que hay. y una vez que verifiquen pasan a ture.
        boolean esPoker = false;
        boolean esFull = false;
        boolean esEscalera = false;  


        // aca recorre y si encuentra que los 5 numeros son iguales, es generala
        for (int i = 1; i <= 6; i++) {
            if (conteo[i] == 5) {
                esGenerala = true;
            }
        }
// intente hacer para cada patron, en este caso si ve que 4 son iguales, poker pasa a true.
        for (int i = 1; i <= 6; i++) {
            if (conteo[i] == 4) {
                esPoker = true;
            }
        }
// en el caso de full, (3 iguales y 2 tambien pero de otro numero) declare booleanos.
        boolean iguales3 = false;
        boolean iguales2 = false; 
        for (int i = 1; i <= 6; i++) {
            if (conteo[i] == 3) {
                iguales3 = true;
            } else if (conteo[i] == 2) {
                iguales2 = true;
            }
        }
        if (iguales3 && iguales2) {
            esFull = true;
        }


        // copia de lo que escribe el user y ordena. esto para saber si hay escalera. aprendi hoy.
        int[] copia = Arrays.copyOf(dados, dados.length);
        Arrays.sort(copia);
        if (Arrays.equals(copia, new int[]{1,2,3,4,5}) || 
            Arrays.equals(copia, new int[]{2,3,4,5,6})) {
            esEscalera = true;
        }

        // pongo las respuestas
        if (esGenerala) return "GENERALA";
        if (esPoker) return "POKER";
        if (esFull) return "FULL";
        if (esEscalera) return "ESCALERA";
        return "NADA/NORMAL";
    }
// obs: main no puede faltar.
   public static void main(String[] args) {
    try (Scanner usuario = new Scanner(System.in)) {
        Generala jugar = new Generala();

        for (int i = 0; i < 5; i++) {
            while (true) {
                System.out.print("Ingrese el valor del dado " + (i + 1) + " (De 1 al 6): ");
                int valor = usuario.nextInt();
                if (valor >= 1 && valor <= 6) {
                    jugar.dados[i] = valor;
                    break;
                } else {
                    System.out.println("Número Inválido (Válido de 1 al 6) - Ingrese de nuevo.");
                }
            }
        }

        System.out.println("La jugada es: " + jugar.jugadasGenerala());
        }
    }
}
