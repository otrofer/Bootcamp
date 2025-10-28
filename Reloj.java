import java.util.Scanner;

public class Reloj {

    private int horas, minutos, segundos;
// constructores
public Reloj() {
    horas = 12;
    minutos = 0;
    segundos = 0;
}
public Reloj(int h, int m, int s) {
    horas = h;
    minutos = m;
    segundos = s;
} 
public Reloj(int segundos2) {
    horas = segundos2 / 3600;
    minutos = (segundos2 - (horas * 3600)) / 60;
    segundos = segundos2 - ((horas * 3600) + (minutos * 60));
    System.out.println(horas + " : " + minutos + " : " + segundos + " : ");
} 
// metodos 
public void setReloj(int segundos2) {
    horas = segundos2 / 3600;
    minutos = (segundos2 - (horas * 3600)) / 60;
    segundos = segundos2 - ((horas * 3600) + (minutos * 60));
    System.out.println(this.toString());
     // es un metodo de objeto. que se usa sobre una instancia especifica, no de manera general.
}
public String toString() {
    return String.format("[%02d:%02d:%02d]", horas, minutos, segundos);
    
}

public int getHoras() {
    return horas;
}
public int getMinutos() {
    return minutos;
}
public int getSegundos() {
    return segundos;
} 
public void setHoras(int h) {
    horas = h;
}
public void setMinutos(int m) {
    minutos = m;
}
public void setSegundos (int s) {
    segundos = s;
} 
public void tick() {
        int[] array1 = convertToSeconds(horas, minutos);
        int relojAux = array1[0] + array1[1] + segundos + 1;
        setReloj(relojAux);
    }

    public void addReloj(Reloj relojX) {
        int[] array1 = convertToSeconds(relojX.horas, relojX.minutos);
        int[] array2 = convertToSeconds(horas, minutos);

        int newReloj = array1[0] + array2[0] + array1[1] + array2[1] + segundos + relojX.segundos;
        setReloj(newReloj);
    }
    public void toString1() {
        System.out.println("[" + horas + ":" + minutos + ":" + segundos + "]");
    }
    public void restaReloj(Reloj relojX) {
    int total1 = horas * 3600 + minutos * 60 + segundos;
    int total2 = relojX.horas * 3600 + relojX.minutos * 60 + relojX.segundos;
    setReloj(Math.abs(total1 - total2));
}

    public int[] convertToSeconds(int h, int m) {
        int[] array1 = new int[2];
        array1[0] = h * 3600;
        array1[1] = m * 60;
        return array1;

    }
    public static void main(String[] args) {
        System.out.println("Ingrese un numero: ");
        Scanner input = new Scanner(System.in);
        int x = input.nextInt();
        input.close();
        Reloj reloj1 = new Reloj(x);
        Reloj reloj2 = new Reloj(1,0,0);
        reloj2.restaReloj(reloj1);
        
        for (int i = 0; i < 10; i++) {
            reloj1.tick();
        }
    }
}







