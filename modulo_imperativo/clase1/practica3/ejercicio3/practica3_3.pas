{
  Implementar un programa que contenga:
    a. Un módulo que lea información de los préstamos de libros realizados por los socios de una biblioteca y los almacene en una estructura
       de datos. De cada préstamo se lee: número de socio (1 a 60), código de libro (200 a 230), fecha de préstamo y cantidad de días del préstamo. 
       La lectura de los préstamos finaliza con número de socio 0. La estructura generada debe ser eficiente para la búsqueda por número de 
       socio y, para cada socio, deben almacenarse en una lista los préstamos de libros que realizó. Nota: No repetir información. 
}

program practica3_3;
// tipos
type
  rango1 = 1..60;
  rango2 = 200..230;
  rango3 = 1..30;
  rango4 = 1..12;
  tFecha = record
    dia: rango3;
    mes: rango4;
    anio: integer;
  end;
  tPrestamo = record
    numSocio: rango1;
    codLibro: rango2;
    fecha: tFecha;
    cantDias: rango3;
  end;

begin
  // programa principal..
end.