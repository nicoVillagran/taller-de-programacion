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
        GeneradorAleatorio.iniciar();
        
        int DFDia = 5;
        int DFTurno = 8;
        int dni, edad;
        String nombre;
        
        Persona[][] casting = new Persona[DFDia][DFTurno];

        int leidos=0;
        // estas variables replazaran, a los 2 bucles "for" (*2)
        int dia=0; 
        int turno=0;
        
        boolean completado=false;
        nombre = GeneradorAleatorio.generarString(4);
        
        while ((!nombre.equals("ZZZ"))&&(leidos < 40)){
            dni = GeneradorAleatorio.generarInt(45000000);
            edad = GeneradorAleatorio.generarInt(86);
            
            if (dia < DFDia) {
                if (turno < DFTurno) casting[dia][turno] = new Persona(nombre, dni, edad);
                else completado=true;
            }
            else completado=true;
            // Eliminar este "for", solo se necesita avanzar, no recorrer toda la matriz. Ver apuntes: variables de condicionales. (*2)
//            for (int c=0;c<DFDia;c++){ // nos movemos por dia, una constante fija "C".
//                for (int f=0;f<DFTurno;f++){// nos movemos por fila, siempre en la misma columna "C"
//                    casting[f][c] = new Persona(nombre, dni, edad); // en vez de una variable crear la persona directamente en esta linea (new Persona).
//                }
//            }
            
            leidos++;
            if (leidos > 20) nombre = "ZZZ"; // simulamos un ingreso de nombre = "ZZZ"
            else nombre = GeneradorAleatorio.generarString(4);
        }
//        vPersonas[1][4] = new Persona("nicolas",45873479,22);
//        vPersonas[2][1] = new Persona("nicolas",45873479,22);
        

        /*
        Informar para cada día y turno asignado, el nombre de la persona a entrevistar. 
        Piense: ¿Es necesario recorrer toda la estructura en el inciso b? --> NO
        */
        for (int d=0;d<DFDia;d++){
            System.out.println("Dia "+(d+1)+": "); // output: "Dia c: "
            for (int t=0;t<DFTurno;t++){
                System.out.print("  - ");
                if(casting[d][t] != null) {
                    System.out.println("Turno "+(f+1)+" asignado a "+casting[f][c].getNombre());
                }
            }
            System.out.println("-------------");
        }
    }
}
