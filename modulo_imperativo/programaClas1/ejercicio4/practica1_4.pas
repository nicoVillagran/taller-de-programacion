{
  Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto,
  código de rubro (del 1 al 6) y precio. Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 
    a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura 
      de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio -1. ✅
    b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. ✅
    c. Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3. 
      Considerar que puede haber más o menos de 20 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 20, 
      se debe almacenar los primeros 20 que están en la lista e ignore el resto. ✅
    d. Ordenar, por precio, los elementos del vector generado en c) utilizando el método visto en la teoría. ✅
    e. Muestre los precios del vector resultante del punto d). ✅
    f. Calcule el promedio de los precios del vector resultante del punto d). ✅
}

program ejercicio4;
const dimF = 6;
const dimFRubro3 = 20;
// Tipos
type
  rangoRubro = 1..dimF;
  producto = record
    codProd: integer;
    codRubro: rangoRubro;
    precio: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: producto;
    sig: lista;
  end;
  vectorListas = array[rangoRubro] of lista;
  vRubro3 = array[1..dimFRubro3] of producto;

// Módulos
procedure almacenarProductos(var v: vectorListas; var dimL: integer);
  procedure leerProducto(var p: producto);
    begin
      write('Ingrese codigo de producto: ');
      readln(p.codProd);
      write('Ingrese codigo de rubro (1 a 6): ');
      readln(p.codRubro);
      write('Ingrese precio: ');
      readln(p.precio);
    end;
  procedure insertarOrdenado(var l: lista; p: producto);
    var nue, ant, act: lista;
    begin
      new(nue);
      nue^.dato := p;

      ant := l;
      act := l;
      
      while (act <> nil) and (act^.dato.codProd < p.codProd) do
        begin
          ant := act;
          act := act^.sig;
        end;
      
      if act = ant then
        nue^.sig := l
        l := nue
      else
        ant^.sig := nue;
      nue^.sig := act;
    end;
  procedure initVectorListas(var v: vectorListas);
    var i: integer;
    begin
      for i := 1 to dimF do
        v[i] := nil;
    end;
  var p: producto;
  begin
    dimL:= 0;
    initVectorListas(v);
    leerProducto(p);
    while (p.precio <> -1) do
      begin
        insertarOrdenado(v[p.codRubro], p);
        dimL := dimL + 1;
        leerProducto(p);
      end;
  end;
procedure mostrarVectosListas(v: vectorListas);
  var 
    i: integer;
    act: lista;
  begin
    for i:=1 to dimF do
      begin
        writeln('-------------- productos del rubro ', i);
        
        act:=v[i];
        while (act <> nil) do
          begin
            writeln(act^.dato.codProd);
            act:=act^.sig;
          end;
        writeln('---------------------');
      end;
  end;
procedure generarVector(l: lista; var v:vRubro3; var dimL: integer);
  procedure agregarAVector(var v: vRubro3; var dimL: integer; p: producto);
    begin
      if (dimL + 1 <= dimF) then
        begin
          dimL := dimL +1;
          v[dimL] := p;
        end;
    end;
  begin
    while (l <> nil) and (dimL <= dimFRubro3) do
      begin
        agregarAVector(v,dimL,l^.dato);
        l := l^.sig;
      end;
  end;
procedure ordenerVector(var v: vRubro3; dimL: integer);
  var
    i,j, pos: integer;
    item: producto;
  begin
    for i:=1 to dimL-1 do
      begin
        pos := i;

        for j:=i+1 to dimL do if (v[j].precio > v[pos].precio) then pos := j;
        
        item := v[pos];
        v[pos] := v[i];
        v[i] := item;
      end;
  end;
procedure mostrarVector(v: vRubro3; dimL: integer);
  var i: integer;
  begin
    for i:=1 to dimL do
    begin
      writeln('-producto ', v[i].codProd, ':');
      writeln('  rubro: ', v[i].codProd);
      writeln('  precio: ', v[i].codProd);
      writeln('-----------');
    end;
  end;
function calcularPromedio (v: vRubro3; dimL: integer) : real;
  var
    i: integer;
    sumaTotal, res: real;
  begin
    for i:=1 to dimL do sumaTotal := sumaTotal + v[i].precio;

    calcularPromedio := sumaTotal / dimL;
  end;
// Acá va a el programa principal.
var
  vListas: vectorListas;
  vectorRubro3: vRubro3;
  lRubro3: lista;
  dimLProductos, dimLRubro3: integer;
  promedPrecios: real;
begin
  dimLProductos := 0;
  dimLRubro3 := 0;

  almacenarProductos(vListas, dimLProductos);
  mostrarVectosListas(vListas);
  generarVector(vListas[3], vectorRubro3, dimLRubro3);
  ordenerVector(vectorRubro3, dimLRubro3);
  mostrarVector(vectorRubro3, dimLRubro3);

  promedPrecios := calcularPromedio(vectorRubro3, dimLRubro3);

  writeln('el promedio de precios: ', promedPrecios:2:0);
end;