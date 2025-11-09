import java.util.*;

class Carta {

    //los atributos
    String valor;
    String palo;


// este es el constructor.
    Carta (String carta) {

    this.valor = carta.substring(0, carta.length()-1 ); // agarra el valor 0
    this.palo  = carta.substring(carta.length()-1 );  // agarra el valor 1

    }

// y el metodo, este devuelve el valor numerico de la carta.

    int Valorcarta() {
        switch (valor.toUpperCase()) {
                case "A" : return 14;
                case "K" : return 13;
                case "Q" : return 12;
                case "J" : return 11;
                case "T" : return 10;
                default: return Integer.parseInt(valor);
        }
    }
}

public class Poker {

    // aca el metodo va a identificar la jugada de 5 cartas.
    static String identificacion(Carta[] mano) {

        int valores[] = new int [5];
        String palos[] = new String [5];

        for (int i = 0; i < 5; i++) { // recorre las cartas y llama al metodo.
            valores[i] = mano[i].Valorcarta();
            palos[i] = mano[i].palo;
        }

        Arrays.sort(valores); // ordena la matriz.

        // ahora verificar si es escalera.
        boolean escalera = true;
        for (int i = 0; i < 4;i++) {
            if (valores[i + 1] != valores[i] + 1) {
                escalera = false;
                break;
            }
        }
        //ahora ver la escalera color.
        if (!escalera && valores[4] == 14 && valores[0] == 2 &&
            valores[1] == 3 && valores[2] == 4 && valores[3] == 5) {
             escalera = true;
        }
        

        // ahora el ver si todas las cartas tienen el mismo palo.
        boolean color = palos[0].equals(palos[1]) && palos[0].equals(palos[2]) && palos[0].equals(palos[3]) && palos[0].equals(palos[4]);
        // Verificar Escalera Real
        boolean escaleraReal = color && Arrays.equals(valores, new int[]{10, 11, 12, 13, 14});

        // cuento repeticiones

        int [] contador = new int [15];
        for (int v:valores) {
            contador[v]++;
        }

        int pares = 0;
        boolean cartastrio = false;
        boolean poker = false;

        for (int c: contador) {
            if (c == 4) {
                poker = true;
            } else if ( c == 3) {
                cartastrio = true;
            } else if ( c == 2) {
                pares++;
            }
        }

        // determino la jugada.

        
        if (escaleraReal) {
            return "Escalera Real!";
        } else if (escalera && color ) {
            return "Escalera de color!";
        } else if (poker) {
            return "Poker!";
        } else if (cartastrio && pares == 1) {
            return "Full!";
        } else if (color) {
            return "Color!";
        } else if (escalera) {
            return "Escalera!";
        } else if (cartastrio) {
            return "Trio!";
        } else if (pares == 1) {
            return "Un Par!";
        } else if (pares == 2) {
            return "Doble Par!";
        } else {
            return "Carta Alta";
        }
    }
    
    // quiero que lea las cartas en una sola linea.

    Carta[] carta_jugador(Scanner jugador, String nombreUsuario) {


        System.out.println( "Ingresa tu mano en una sola línea (ejemplo: AH KH QH JH TH):");
        String linea = jugador.nextLine().trim();  // no redeclarar 'usuario'

        String[] separar = linea.split("\\s+");

         if (separar.length != 5) {
        System.out.println("Debes ingresar exactamente 5 cartas.");
        return carta_jugador(jugador, nombreUsuario);  // vuelve a pedir

        }

        Carta[] mano = new Carta[5];
        for (int i = 0; i < 5; i++) {
        mano[i] = new Carta(separar[i].toUpperCase());

        }

        return mano;

    }

    public static void main (String [] args) {

         Scanner sc = new Scanner(System.in);
        Poker juegoPoker = new Poker();

        // Pido la mano del jugador
        Carta[] manoJugador = juegoPoker.carta_jugador(sc, "Jugador");

        // Mostramos la jugada
        System.out.println("\nResultado: " + identificacion(manoJugador));


}


}


