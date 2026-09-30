/*
Se dispone de la clase Persona (en la carpeta tema2). 
Un objeto persona puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese orden).
Un objeto persona responde a los siguientes mensajes:
getNombre()  retorna el nombre (String) de la persona
getDNI()     retorna el dni (int) de la persona
getEdad()    retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X)    modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X)   modifica la edad de la persona al “int” pasado por parámetro (X)
toString()   retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”

 */
package tema2;

import PaqueteLectura.Lector;

public class Ej01Unapersona {

    public static void main(String[] args) {
        
        System.out.println("Ingrese nombre:");
        String nombre = Lector.leerString();
        System.out.println("Ingrese dni:");        
        int dni = Lector.leerInt();
        System.out.println("Ingrese edad:");
        int edad= Lector.leerInt();
        
        //Opcion 1
        Persona p1 = new Persona();       //Instancio el objeto sin valores iniciales
        p1.setNombre(nombre);             //Luego, seteo los datos enviando mensajes set
        p1.setDNI(dni);
        p1.setEdad(edad);
        System.out.println(p1.toString()); //Obtengo la representación (mensaje toString) e imprimo
        
        //Opcion 2                                   
        Persona p2 = new Persona(nombre, dni, edad); //Instancio el objeto enviando valores iniciales al constructor
        System.out.println(p2.toString());           //Obtengo la representación (mensaje toString) e imprimo
        System.out.println(p2.getDNI());             //Obtengo sólo el dni (mensaje getDNI) e imprimo 
    }
    
}
