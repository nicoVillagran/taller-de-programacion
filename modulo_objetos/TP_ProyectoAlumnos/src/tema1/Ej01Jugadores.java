/*
Escriba un programa que lea las alturas de los 15 jugadores de un equipo de básquet y 
las almacene en un vector.  Luego informe: 
    - la altura promedio (**)
    - la cantidad de jugadores con altura por encima del promedio (***)
NOTA: Dispone de un esqueleto para este programa en Ej01Jugadores.java ✅

(**) para sacar el promedio, "promedio = sumaTotal / cant"
(***) crear un 2do contador que se incremente cuando (promedio > altura) sea true.
*/
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej01Jugadores {
    public static void main(String[] args) {
        //Paso 2: Declarar y crear el vector para 15 double
        int DF = 5; // reducimos de 14 a 5 para las pruebas.
        double[] vAlturas = new double[DF];
        
        //Paso 3: Ingresar 15 numeros (altura), cargarlos en el vector, 
        //        ir calculando la suma de alturas sobre variable auxiliar
        int i; // seguir esta convencion.
        double auxSuma=0;
        
        for (i=0;i<vAlturas.length;i++){
            System.out.println("ingrese una altura: ");
            double altura = Lector.leerDouble();
            auxSuma = auxSuma+altura;
        }
        
        //Paso 4: Calcular el promedio de alturas e informar
        double altPromedio = auxSuma / vAlturas.length;
        System.out.println("altura promedio: " + altPromedio);
        
        //Paso 5: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int contAlturas = 0;
        for (double alt: vAlturas) {
            if(alt > altPromedio) {
                contAlturas = contAlturas+1; // se puede remplazar por "contAlturas++"
            }
        }
        //Paso 6: Informar la cantidad.
        System.out.println("cantidad de alturas promedio: "+ contAlturas);
    }
}
