package JAVA;

import java.util.*;

class Carta {

    String valor;
    String palo;

    // constructor.

    Carta (String carta) {

        this.valor = String.valueOf(carta.charAt(0));
        this.palo = String.valueOf(carta.charAt(1));
    }

    String mostrarCarta() {
        return this.valor + this.palo;
    }

    int obtenerValor() {

        switch (valor.toUpperCase()) {

            case "T":
            return 10;
            case "J": 
            return 11;
            case "Q" :
            return 12;
            case "K":
            return 13;
            case "A": 
            return 14;
            default:
            return Integer.parseInt(valor);
        }
    }
}

public class Poker01 {

    Scanner usuario = new Scanner(System.in);

    Carta[] ingreso_usuario(String jugador) {

        Carta[] mano = new Carta[5];
        System.out.println("Ingrese las cartas para el " + jugador + ": ");
        String[] cartas = usuario.nextLine().split(" ");
        for (int i = 0; i < 5; i++) {
            mano[i] = new Carta(cartas[i]);
        }
        return mano;
    }
    int identificarMano(Carta[] mano) {

        int[] numeros = new int[5];
        String[] palos = new String[5];
        
        for (int i = 0; i < 5; i++) {
            // llamo al metodo obtenerValor de la carta mano, esto lo convierte a valor numerico y lo guarda en el array numeros.
            numeros[i] = mano[i].obtenerValor();
            // toma el palo de la carta y lo guarda en el array palos.
            palos[i] = mano[i].palo;    
        }
        Arrays.sort(numeros);

        boolean color = palos[0].equals(palos[1]) && palos[0].equals(palos[2]) && palos[0].equals(palos[3]) && palos[0].equals(palos[4]); // verifica que todos los palos sean iguales

        boolean escalera = true;
        for (int i = 0; i < 4; i++) {
            if (numeros[i + 1] != numeros[i]) { // si el siguiente no es mayor.
                escalera = false;
                break;
            }
        }
        int [] contador = new int[15];
        for (int n : numeros) { // cuenta los valores de los numeros de la carta.
            contador[n]++;
        }

        int pares = 0;
        boolean cartasTrio = false;
        boolean poker = false;

        for (int i = 0; i <= 14; i++) {
            if (contador[i] == 4) {
                poker = true;
            } else if (contador[i] == 3) {
                cartasTrio = true;
            } else if (contador[i] == 2) {
                pares++;
            }
        }

        boolean escaleraReal = Arrays.equals(numeros, new int[] {10, 11, 12, 13, 14});
        // devuelve true solo si la mano es exactamente 10 11 12 13 14 (T J Q K A).
        // las manos.
        
        if (escaleraReal && color)
        return 10;
        if (escalera && color)
        return 9;
        if (poker)
        return 8;
        if (cartasTrio && pares == 1) 
        return 7;
        if (color)
        return 6;
        if (escalera)
        return 5;
        if (cartasTrio)
        return 4;
        if (pares == 2)
        return 3;
        if (pares == 1) 
        return 2;
        return 1; // carta alta.
    }

    int desempate(Carta[] jugador1, Carta[] jugador2) {
        int[] valores1 = new int[5];
        int[] valores2 = new int[5];

        for (int i = 0; i < 5; i++) {

            valores1[i] = jugador1[i].obtenerValor();
            valores2[i] = jugador2[i].obtenerValor();
        }
            Arrays.sort(valores1);
            Arrays.sort(valores2);

            for (int i = 4; i >= 0; i--) { // recorre de la carta mas alta a la mas baja.
                if (valores1[i] > valores2[i]) {
                    return 1;
                } else if (valores1[i] < valores2[i]) {
                    return 2;
                }
            }
            return 0; //empate.
        }

        public static void main (String[] args) {
            
            Poker01 pokerjuego = new Poker01();

            Carta[] jugador1 = pokerjuego.ingreso_usuario("Jugador 1");
            Carta[] jugador2 = pokerjuego.ingreso_usuario("Jugador 2");

            int mano1 = pokerjuego.identificarMano(jugador1);
            int mano2 = pokerjuego.identificarMano(jugador2);

            System.out.println("Jugador 1: " + mano1);
            System.out.println("Jugador 2: " + mano2);


            if (mano1 > mano2) {
                System.out.println("GANA JUGADOR 1! FELICIDADES!");
            } else if (mano2 > mano1) {
                System.out.println("GANA JUGADOR 2! - FELICITACIONES!!");
            } else {
                int ganador = pokerjuego.desempate(jugador1, jugador2);
                if (ganador == 1) {
                    System.out.println("Gana jugador 1 por desempate!");
                } else if (ganador == 2) {
                    System.out.println("Gana jugador 2 por desempate!!");
                } else {
                    System.out.println("Empate");
                }
            }
        } 
}
