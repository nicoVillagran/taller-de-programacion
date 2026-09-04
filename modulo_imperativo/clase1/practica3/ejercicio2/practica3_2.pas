{
  Escribir un programa que: 
    a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio. Para cada venta generar código de producto (entre 1 y 100),
      fecha (dia, mes, año) y cantidad de unidades vendidas.
      Finalizar con el código de producto 0. Un producto puede estar en más de una venta. (hay repetidos en el arbol)
      Se pide: 
        i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto. Los códigos repetidos van a la derecha. ✅
        ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe
          contener el código de producto y la cantidad total de unidades vendidas. ✅
        iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener 
          el código de producto y la lista de las ventas realizadas del producto. Nota: No repetir información!!! 
          Nota: El módulo debe retornar TRES árboles.
    b. Implemente un módulo que reciba el árbol generado en i. y una fecha (día, mes y año) y retorne la cantidad total de productos vendidos
       en la fecha recibida. ✅
    c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto con mayor cantidad total de unidades vendidas. 
    ------------------------------------------------
    Nota clase: los arboles son estructuras "recursivas".
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
    unidadesVendidas: integer;
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
  tVenta2 = record
    fecha: tFecha;
    cantVentas: integer;
  end;
  lista = ^nodVenta;
  nodVenta = record
   dato: tVenta2;
   sig: lista;
  end;
  tProducto2 = record
    codProd: rango1;
    pLista: lista;
  end;
  arbol3 = ^nodoLista;
  nodoLista = record
    dato: tProducto2;
    HI: arbol3;
    HD: arbol3;
  end;
  
// módulos
procedure crearFecha(var f: tFecha);
  begin
    f.dia := random((30 - 1) + 1) + 1;
    // writeln('dia: ', f.dia);
    f.mes := random((12 - 1) + 1) + 1;
    // writeln('mes: ', f.mes);
    f.anio := 2026;
    // writeln('anio: ', f.anio);
  end;

procedure cargarArbol1(var a: arbol);
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
  procedure crearVenta(var v: tVenta);
    begin
      v.codProd := random(101);
      if(v.codProd <> 0)then
        begin
          writeln('codigo: ', v.codProd);
          crearFecha(v.fecha);
          WriteLn('fecha: ', v.fecha.dia, '/', v.fecha.mes, '/', v.fecha.anio);
          v.cantVentas := random((10-1) + 1) + 1;
          writeln('cantidad de ventas: ', v.cantVentas);
        end;
    end;
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
// --------------------------------
procedure cargarArbol2(var a2: arbol2);
  procedure agregarHojaArb2(var a: arbol2;elem:tProducto);
    begin
      if(a = nil) then
        begin
          new(a);
          a^.dato := elem;
          a^.HI := nil;
          a^.HD := nil;
        end
      else
        if (elem.codProd < a^.dato.codProd) then agregarHojaArb2(a^.HI, elem)
        else agregarHojaArb2(a^.HD, elem);
    end;
  procedure crearProducto(var p: tProducto);
    begin
      p.codProd := random(101);
      if(p.codProd <> 0)then
        begin
          writeln('codigo: ', p.codProd);
          p.unidadesVendidas := random((10-1) + 1) + 1;
          writeln('ventas totales: ', p.unidadesVendidas);
        end;
    end;
  var producto: tProducto;
  begin
    a2 := nil;
    crearProducto(producto);
    
    while(producto.codProd <> 0)do
      begin
        // acciones
        agregarHojaArb2(a2, producto);
        crearProducto(producto);
      end;
  end;
// -----------------------------------------
procedure cargarArbol3(var a3: arbol3);
  procedure cargarProducto(var p: tProducto2);
    begin
      p.codProd := random(101);
        if(p.codProd <> 0)then
          begin
            // writeln('codigo: ', p.codProd);
            // crear un nodo y cargar los datos de la venta en esa direccion
            new(p.pLista); // creamos nodo
            crearFecha(p.pLista^.dato.fecha);
            p.pLista^.dato.cantVentas := random((10-1) + 1) + 1;
            // writeln('cantidad de ventas: ', p.pLista^.dato.cantVentas);
            // inicializo el siguiente de este nodo
            p.pLista^.sig := nil;
          end;
    end;
  procedure agregarNodoLista(var pri:lista;nuevo:lista);
    begin
      if(pri = nil) then pri := nuevo
      else 
        begin
          nuevo^.sig := pri;
          pri := nuevo;
        end;
    end;
  procedure agregarHojaVenta(var a:arbol3;elem: tProducto2);
    begin
      if(a = nil) then
        begin
          new(a);
          a^.dato:= elem;
          a^.HI := nil;
          a^.HD := nil;
        end
      else
        if (elem.codProd = a^.dato.codProd) then agregarNodoLista(a^.dato.pLista, elem.pLista)
        else
          if (elem.codProd < a^.dato.codProd) then agregarHojaVenta(a^.HI, elem)
          else agregarHojaVenta(a^.HD, elem);
    end;
  var producto: tProducto2;
  begin
    a3 := nil;
    cargarProducto(producto);
    
    while producto.codProd <> 0 do
      begin
        agregarHojaVenta(a3, producto);
        cargarProducto(producto);
      end;
  end;
//--------------------------------
procedure enOrden(a:arbol3);
 var L:lista;
 begin
  if (a <> nil)then
  begin
   enOrden(a^.HI);
   writeln('producto: ',a^.dato.codProd);
   L:=a^.dato.pLista;
   while L <> nil do
    begin
      WriteLn('la fecha: ', L^.dato.fecha.dia, '/', L^.dato.fecha.mes, '/', L^.dato.fecha.anio);
      WriteLn('se vendieron: ', L^.dato.cantVentas);

      L:=L^.sig;
    end;
   enOrden(a^.HD);
  end;
 end;

procedure modulo1(var a: arbol{var a2: arbol2;var a3: arbol3});
  // var a: arbol3;
 begin
  // cargar primer arbol
  cargarArbol1(a);
  // cargar segundo arbol
  // cargarArbol2(a);
  // cargar tercer arbol
  // cargarArbol3(a);
  
  // enOrden(a);
 end;
function moduloB (a: arbol; f: tFecha) : integer;
  procedure recorrerArbol(a:arbol;f:tFecha;var cont:integer);
    function compararFecha(f1, f2: tFecha):boolean;
      var res:boolean;
      begin
        res:=false;
        if (f1.dia = f2.dia) then
          if f1.mes = f2.mes then
            if f1.anio = f2.anio then res:=true;
        compararFecha := res;
      end;
    var igual: boolean;
    begin
      if (a <> nil)then
        begin
          recorrerArbol(a^.HI, f, cont);
          igual:=compararFecha(a^.dato.fecha, f);
          if(igual)then cont:=cont+a^.dato.cantVentas;
          recorrerArbol(a^.HD, f, cont);
        end;
    end;
  var contador: integer;
  begin
    contador := 0;
    recorrerArbol(a,f,contador);

    moduloB:=contador;
  end;
Var
  a1: arbol;
  fecha: tFecha;
Begin
	Randomize;
	
  // generar y retornar ABB.
	modulo1(a1);
  // Módulo "b"
  // cargar / crear una fecha
  crearFecha(fecha);
  WriteLn('fecha: ', fecha.dia, '/', fecha.mes, '/', fecha.anio);
  writeln('hay ', moduloB(a1,fecha), ' ventas con esta fecha.');
  
End.
 

  
