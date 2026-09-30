/*
Se realizará un casting para un musical. El casting durará 5 días y en cada día se entrevistarán a 8 personas en distinto turno.  
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le 
    pide sus datos (nombre, DNI, edad) , el día (1..5)  y  turno (1..8) en que se quiere presentar al casting.
    La persona debe ser inscripta en ese día y turno si está disponible. En caso contrario, sólo informe la situación.
    La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting. 
    Una vez finalizada la inscripción: 
    b) Informar para cada día y turno: si está asignado o no y el nombre de la persona a entrevistar en ese caso de estar asignado.


    Notas:
    Repetir 40 veces (si nombre <> "ZZZ")
        - crear persona (datos..)
        leer(dia)1..5
        Si (matriz[dia] != null) entonces 
            - leer(turno)1..8
            Si (matriz[turno] != null) entonces {
                matriz[turno][dia] = persona;
            }
            Sino "turno No disponible"
        Sino "Dia NO disponible"

    Recorrer toda la matriz
    Si (posicion != null) "Dia (tal), turno (tal) asignado"
    Sino "Dia (tal), turno (tal) NO asignado"
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej03Musical {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DFDia = 5;
        int DFTurno = 8;
        int dia, turno, dni, edad, leidos;
        String nombre;
        
        Persona[][] vInscriptos = new Persona[DFTurno][DFDia]; // (2,5) y (3,2)
        
        leidos=0;
        Persona pAux;
        
        nombre = GeneradorAleatorio.generarString(4);
        while ((!nombre.equals("ZZZ"))&&(leidos < 40)){
            dni = GeneradorAleatorio.generarInt(45000000);
            edad = GeneradorAleatorio.generarInt(56);
            
            pAux = new Persona(nombre, dni, edad);
            
            dia = GeneradorAleatorio.generarInt(DFDia);
            turno = GeneradorAleatorio.generarInt(DFTurno);
            
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
        // TODO code application logic here
    }
}
