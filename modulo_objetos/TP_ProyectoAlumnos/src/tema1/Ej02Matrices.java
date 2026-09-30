/*
Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice la matriz con números aleatorios entre 0 y 30.   
Luego realice las siguientes operaciones en recorridos independientes:
    - Mostrar el contenido de la matriz en consola.
    - Calcular e informar la suma de los elementos de la fila 1.
    - Generar un vector de 5 posiciones donde cada posición j contiene la suma de los 
    elementos de la columna j de la matriz. Luego, imprima el vector.
    - Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de 
    encontrarse indique su ubicación (fila y columna) en caso contrario imprima “No se encontró el elemento”.  
NOTA: Dispone de un esqueleto para este programa en Ej02Matrices.java 
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej02Matrices {
    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();

        //Paso 3. definir y crear la matriz de enteros de 5x5, iniciarla con nros. aleatorios 
        int[][] vEnteros = new int[5][5];
        
        for (int i=0;i<vEnteros.length;i++){
            int[] vAux= vEnteros[i];
            for (int a=0;a<vAux.length;a++){
                vAux[a] = GeneradorAleatorio.generarInt(30);
            }
        }        
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for (int a=0;a<vEnteros.length;a++){
            for (int n: vEnteros[a]) System.out.print("--");
            System.out.println();
            for (int n: vEnteros[a]){
                System.out.print(n+" | ");
            }
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1.
        int sumaElems = 0;
        for (int i=0;i<vEnteros[1].length;i++){
            sumaElems = sumaElems + vEnteros[0][i];
        }
        System.out.println("Suma elementos, fila 1: "+sumaElems);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int[] vSumas = new int[5];
        //inicializar valores en 0
        for (int i=0;i<vSumas.length;i++) vSumas[i]=0;
        
        for (int j=0;j<vSumas.length;j++){
//            System.out.println("columna: "+j);
            for(int i=0;i<vEnteros.length;i++){
//                System.out.println("fila: "+i);
                vSumas[j] = vSumas[j] + vEnteros[i][j];
            }
        }
        
        for (int i=0;i<vSumas.length;i++) System.out.print(vSumas[i]+" | ");
        System.out.println();
        
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. 
        //        En caso de encontrarse indique su ubicación (fila y columna)
        //        y en caso contrario imprima "No se encontró el elemento".

        boolean existe=false;
        int f=0;
        int c = 0;
        int valor;
        System.out.println("ingrese un numero: ");
        valor = Lector.leerInt();
        
        while((f<vEnteros.length)&&(!existe)){
            while((c<vEnteros[f].length)&&(!existe)){
                if(vEnteros[f][c] == valor) existe=true;
                else c++;
            }
            // moverse
            if(!existe){
                f++;
                c=0;
            }
        }
        
        if(existe) System.out.println("elemento esta en fila: "+(f+1)+", columna: "+(c+1));
        else System.out.println("El "+valor+" NO esta en la matriz");
    }
}
