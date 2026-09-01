{
  Escribir un programa que: 
    a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio. Para cada venta generar código de producto (entre 1 y 100),
      fecha (dia, mes, año) y cantidad de unidades vendidas.
      Finalizar con el código de producto 0. Un producto puede estar en más de una venta. (hay repetidos en el arbol)
      Se pide: 
        i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha. ✅
        ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener 
          el código de producto y la cantidad total de unidades vendidas.
          * 
          * - recorrer arbol 1
          * - leer los datos, y generar el nodo de tipo "tProducto"
          * - agregar al arbol --> modificar el modulo "agrgarHoja" para que si el codigo de producto se repite (es igual a..) se sume la cantidad vendida al campo "totalVentas" de ese nodo.
          * 		---> cuando agregamos tenemos que contemplar si vamos a agregar o a sumar.
          * 
        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener 
          el código de producto y la lista de las ventas realizadas del producto. Nota: No repetir información!!! 
          Nota: El módulo debe retornar TRES árboles.
          * 
          * 
          * 
    Nota clase: los arboles son estructuras "recursivas"
}

program practica3_2;
//tipos
type
  rango1 = 0..100;
  rango2 = 1..30;
  rango3 = 1..12;
  tFecha = record
    dia: rango2;
    mes: rango3;
    anio: integer;
  end;
  tVenta = record
    codProd: rango1;
    fecha: tFecha;
    cantVentas: integer;
  end;
  tProducto = record
    codProd: rango1;
    totalVentas: integer;
  end;
  arbol = ^nodo;
  nodo = record
    dato: tVenta;
    HI: arbol;
    HD: arbol;
  end;
  arbol2 = ^nodoProd;
  nodoProd = record
    dato: tProducto;
    HI: arbol2;
    HD: arbol2;
  end;
  
// módulos
procedure crearFecha(var f: tFecha);
  begin
    f.dia := random((30 - 1) + 1) + 1;
    writeln('día: ', f.dia);
    f.mes := random((12 - 1) + 1) + 1;
    writeln('mes: ', f.mes);
    f.anio := 2026;
    writeln('año: ', f.anio);
  end;
procedure crearVenta(var v: tVenta);
  begin
    v.codProd := random(101);
    if(v.codProd <> 0)then
      begin
        writeln('código: ', v.codProd);
        crearFecha(v.fecha);
        v.cantVentas := random((10-1) + 1) + 1;
        writeln('cantidad de ventas: ', v.cantVentas);
      end;
  end;
procedure agregarHoja(var a: arbol; elem: tVenta);
  begin
    if(a = nil) then
      begin
        new(a);
        a^.dato := elem;
        a^.HI := nil;
        a^.HD := nil;
      end
    else
      if (elem.codProd < a^.dato.codProd) then agregarHoja(a^.HI, elem)
      else agregarHoja(a^.HD, elem);
  end;

procedure cargarArbol1(var a: arbol);
  var venta: tVenta;
  begin
    a := nil;
    crearVenta(venta);
    while(venta.codProd <> 0) do
      begin
        agregarHoja(a, venta);
        crearVenta(venta);
      end;
  end;
procedure insertarOAcumular(var a: arbol2;elem:tProducto);
  begin
    if(a = nil) then
      begin
        new(a);
        a^.dato := elem;
        a^.HI := nil;
        a^.HD := nil;
      end
    else
      if (elem.codProd = a^.dato.codProd) then a^.dato.totalVentas := a^.dato.totalVentas + elem.totalVentas
      else
        if (elem.codProd < a^.dato.codProd) then insertarOAcumular(a^.HI, elem)
        else insertarOAcumular(a^.HD, elem);
  end;
procedure reccorrerArbol(a: arbol; var a2: arbol2);
  var producto: tProducto;
  begin
    if(a <> nil)then
      begin
        reccorrerArbol(a^.HI, a2);
        // acciones
        producto.codProd := a^.dato.codProd;
        producto.totalVentas := a^.dato.cantVentas;

        insertarOAcumular(a2, producto);
        reccorrerArbol(a^.HD, a2);
      end;
  end;
  
Begin
	Randomize;
	// generar y retornar ABB.
End.
 

  
