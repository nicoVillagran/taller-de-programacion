{
  Escribir un programa que: 
    a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio. Para cada venta generar código de producto (entre 1 y 100),
      fecha (dia, mes, año) y cantidad de unidades vendidas.
      Finalizar con el código de producto 0. Un producto puede estar en más de una venta.
      Se pide: 
        i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha. 
        ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener 
          el código de producto y la cantidad total de unidades vendidas. 
        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener 
          el código de producto y la lista de las ventas realizadas del producto. Nota: No repetir información!!! 
          Nota: El módulo debe retornar TRES árboles.
}

program practica3_2;
type
  rango1 = 1..100;
  rango2 = 1..30;
  rango3 = 1..12;
  tFecha = record
    dia: rango2;
    mes: rango3;
    anio: integer;
  end;
  venta = record
    codProd: rango1;
    fecha: tFecha;
    cantVentas: integer;
  end;

  