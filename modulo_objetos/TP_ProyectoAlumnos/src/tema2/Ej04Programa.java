/*
Se realizará un casting para un programa de TV. El casting durará 5 días y en cada día se entrevistarán a 8 personas en distinto turno. 
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide sus datos (nombre, DNI y edad)
       y se la debe asignar en un día y turno de la siguiente manera: las personas primero completan el primer día en turnos 
       sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ”
       o al cubrirse los 40 cupos de casting. 
    Una vez finalizada la inscripción:  
    b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar. 
    Piense: ¿Es necesario recorrer toda la estructura en el inciso b?

    Nota: el enunciado, cuando nos dice: "y se la debe asignar en un día y turno de la siguiente manera:
    las personas primero completan el primer día en turnos sucesivos, luego el segundo día y así siguiendo.",
    nos está indicando debemos o seria recomendable tener un vector de DL para hacer eficiente el recorrido.
    Principal diferencia con el enunciado o ejercicio 3.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Programa {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();// inicio generadorAleatorio

        int DFDia = 5;
        int DFTurno = 8;
        int dni, edad;

        Persona[][] casting = new Persona[DFDia][DFTurno];
        int[] DMCasting =  new int[DFDia];

        // Inicio los turnos en disponible
        for (int dia = 0; dia < DFDia; dia++) {
            for (int turno = 0; turno < DFTurno; turno++) {
                casting[dia][turno] = null;
            }
        }
        for (int i=0;i<DMCasting.length;i++) DMCasting[i]=0;

        // A)
        int dia = 0;
        int turno = 0;
        int cantInscriptos = 0;

        String nombre = GeneradorAleatorio.generarString(4);
        while ((!nombre.equals("ZZZ")) && (cantInscriptos < 40)) {
            dni = GeneradorAleatorio.generarInt(45000000);
            edad = GeneradorAleatorio.generarInt(86);

            casting[dia][turno] = new Persona(nombre, edad, dni);
            DMCasting[dia]++;

            cantInscriptos++;

            if (cantInscriptos < 40) {
                if ((turno + 1 < DFTurno)) {
                    turno++;
                } else {
                    if (dia + 1 < DFDia) {
                        turno = 0;
                        dia++;
                    }
                }
            }
            
            if (cantInscriptos < 40) nombre = GeneradorAleatorio.generarString(4);
            
//             ----- simulisacion de entrada de nombre "ZZZ"
//            if (cantInscriptos > 23) {
//                nombre = "ZZZ";
//            } else {
//                nombre = GeneradorAleatorio.generarString(4);
//            }
        }

        // B)
        if (casting[0][0] != null) {
            int d = 0;
            
            System.out.println("===== CASTING =====");
            /* ------------- recorrido condicional*/
            while ((d<DFDia) && (DMCasting[d] != 0)) {
                for (int t = 0;t<DMCasting[d];t++) {
                    System.out.println("- "+casting[d][t].getNombre()+" ("+d+", "+t+")");
                }
                if (d+1 <= DFDia) d++;
            }
            if ((d<DFDia)&&(DMCasting[d] == 0)) System.out.println("No hay mas elementos que mostrar."); //d sale valiendo 5
            /* ---------- recorrido completo 
            for (Persona[] casting1 : casting) {
                for (Persona p : casting1) {
                    if (p != null) System.out.println("- "+p.getNombre());
                    else System.out.println(p);
                }
            }*/
//            while (d < dia) {
//                System.out.println("Día " + (d + 1) + ":");
//                while (t < turno) {
//                    System.out.println("Turno " + (t + 1) + ": ASIGNADO a " + casting[d][t].getNombre());
//                    t++;
//                }
//
//                t = 0;
//                d++;
//            }
        }else System.out.println("No hay inscriptos.");

        /*for (int d=0;d<DFDia;d++){
            System.out.println("Dia "+(d+1)+": "); // output: "Dia c: "
            for (int t=0;t<DFTurno;t++){
                System.out.print("  - ");
                if(casting[d][t] != null) {
                    System.out.println("Turno "+(f+1)+" asignado a "+casting[f][c].getNombre());
                }
            }
            System.out.println("-------------");
        }*/
    }
}
