/*
 Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo 15 personas.
La información (nombre, DNI, edad) se debe generar aleatoriamente hasta obtener edad 0.
Luego de almacenar la información:
    -  Informe la cantidad de personas mayores de 65 años.
    -  Muestre la representación de la persona con menor DNI. 
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02VectorPersonas {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); // importante cada vez que se use el generador.
        // variables
        int DF =5;
        Persona[] vPersonas = new Persona[DF]; // vector de personas. cambiar de 15 a 5 para pruebas de codigo.
        Persona pN;
        int DL = 0;
        int edad;
        int dni;
        String nombre;
        
        edad = GeneradorAleatorio.generarInt(70);
//        System.out.println("edad: "+edad);
        while ((edad != 0) && (DL < DF)) {
            nombre = GeneradorAleatorio.generarString(15);
//            System.out.println("nombre: "+nombre);
            dni = GeneradorAleatorio.generarInt(45000000);
//            System.out.println("dni: "+dni);
            
            pN = new Persona(nombre, dni, edad);
            
            vPersonas[DL] = pN;
            DL++;
            edad = GeneradorAleatorio.generarInt(70);
        }
        
        if (DL != 0) {
            int cant =0;
            Persona minP = vPersonas[0];
            for (int a=0;a<DL;a++){
                if (vPersonas[a].getEdad() > 65) cant++;
                if ((a>0)&&(vPersonas[a].getDNI() < minP.getDNI())) minP = vPersonas[a];
                
                System.out.println("- "+vPersonas[a].getNombre()+", dni: "+vPersonas[a].getDNI()+", "+vPersonas[a].getEdad()+" anios");
            }
            System.out.println("Cant. Mayores de 65 anios: "+cant);
            System.out.println("Persona con menor dni: "+minP.getNombre()+", dni: "+minP.getDNI()+", "+minP.getEdad()+" anios");
        }
        else System.out.println("Vector vacio");
        
        
        // TODO code application logic here
    }
    
}
