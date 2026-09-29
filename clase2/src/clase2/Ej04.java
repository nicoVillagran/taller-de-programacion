/*
Se realizará un casting para un programa de TV. El casting durará 5 días y en cada día se entrevistarán a 
8 personas en distinto turno.
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le
    pide sus datos (nombre, DNI y edad) y se la debe asignar en un día y turno de la
    siguiente manera: las personas primero completan el primer día en turnos
    sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al llegar una
    persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.
Una vez finalizada la inscripción:
    b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
    Piense: ¿Es necesario recorrer toda la estructura en el inciso b?
 */
package clase2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04 {
    public static void main(String[] args) {
        // TODO code application logic here
        Persona[][] casting = new Persona[5][8];
        int leidos=0;
        int[] vDimL = new int[5];
        
        String nombre;
        int dni, edad;
        
        nombre = GeneradorAleatorio.generarString(4);
        
        while((nombre != "ZZZ")&&(leidos <= 40)){
            dni = GeneradorAleatorio.generarInt(45000000);
            edad = GeneradorAleatorio.generarInt(80);
            Persona pAux = new Persona(nombre, dni, edad);
            
            for (int c=0;c<casting.length;c++){
              for (int f=0;f<casting[c].length;f++){
                  casting[c][f] = pAux;
              }
            
            
        }
        }
        
    }
    
}
