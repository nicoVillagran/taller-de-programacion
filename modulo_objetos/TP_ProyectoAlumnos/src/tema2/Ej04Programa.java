/*
Se realizará un casting para un programa de TV. El casting durará 5 días y en cada día se entrevistarán a 8 personas en distinto turno. 
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide sus datos (nombre, DNI y edad)
       y se la debe asignar en un día y turno de la siguiente manera: las personas primero completan el primer día en turnos 
       sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ”
       o al cubrirse los 40 cupos de casting. 
    Una vez finalizada la inscripción:  
    b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar. 
    Piense: ¿Es necesario recorrer toda la estructura en el inciso b?


*/
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Programa {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DFDia = 5;
        int DFTurno = 8;
        int dia, turno, dni, edad;
        String nombre;
        
        Persona[][] vInscriptos = new Persona[DFTurno][DFDia]; // (2,5) y (3,2)
        
        int leidos=0;
//        int c=0;
//        int f=0;
        Persona pAux;
        
        nombre = GeneradorAleatorio.generarString(4);
        while ((!nombre.equals("ZZZ"))&&(leidos < 40)){
            dni = GeneradorAleatorio.generarInt(45000000);
            edad = GeneradorAleatorio.generarInt(56);
            
            pAux = new Persona(nombre, dni, edad);
            
            for (int c=0;c<DFDia;c++){
            // nos movemos por dia, una constante fija "C"
                for (int f=0;f<DFTurno;f++){// nos movemos por fila, siempre en la misma columna "C"
                    vInscriptos[f][c] = pAux;
                }
            }
            
            if (vInscriptos[turno][dia] != null) System.out.println("Dia "+(dia+1)+", Turno "+(turno+1)+" No disponible");
            else vInscriptos[turno][dia] = pAux;
            
            leidos++;
            if (leidos > 20) nombre = "ZZZ";
            else nombre = GeneradorAleatorio.generarString(4);
        }
//        vPersonas[1][4] = new Persona("nicolas",45873479,22);
//        vPersonas[2][1] = new Persona("nicolas",45873479,22);
        
        for (int c=0;c<DFDia;c++){
            System.out.println("Dia "+(c+1)+": ");
            for (int f=0;f<DFTurno;f++){
                System.out.print("  - ");
                if(vInscriptos[f][c] != null) {
                    System.out.println("Turno "+(f+1)+" asignado a "+vInscriptos[f][c].getNombre());
                }
                else System.out.println("Turno "+(f+1)+" NO asignado");
            }
            System.out.println("-------------");
        }
    }
}
