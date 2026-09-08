{
  PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 2025. Implementar un programa que implemente
   e invoque los siguientes módulos:  
    a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee código del videojuego, código de cliente y mes.
       La lectura finaliza con el código de cliente 0 (se sugiere utilizar el módulo para leer una compra, el cual se especifica más 
      abajo) y se debe retornar un árbol binario de búsqueda ordenado por código de videojuego. En el árbol, para cada código de videojuego 
      debe almacenarse una lista con código de cliente y mes perteneciente a cada compra. 
    b) Implementar un módulo que reciba el árbol generado en el inciso a) y un código de videojuego. Este módulo debe retornar la lista de 
      las compras de ese videojuego. 
    c) Implementar un módulo recursivo que reciba la lista generada en el inciso b) y un mes. El módulo debe retornar la cantidad de 
      clientes que compraron en el mes ingresado.
}


program practica5_3;
// tipos
type 
  // tipo dado por el enunciado
  meses = 1..12; 
  compra = record // dato primario
    cod_vj: integer; 
    cod_cli: integer; 
    mes: meses; 
  end; 
  // mis tipos
  tCompra2 = record // dato a insertar en lista
    cod_cli: integer; 
    mes: meses;
  end;
  lista = ^nLista; // lista
  nLista = record
    dato: tCompra2;
    sig: lista;
  end;
  aDato = record // dato a insertar en arbol
    cod_vj: Integer;
    p: lista;
  end;
  arbol = ^nArbol; // arbol
  nArbol = record
    dato: aDato;
    HI: arbol;
    HD: arbol;
  end;
 
// --------------- modulo "A" -------------------------
procedure cargarAbol(var a: arbol);
  // modulo dado por el enunciado
  procedure leerCompra (var c: compra); 
    begin 
      c.cod_cli := Random(200); 
      if (c.cod_cli <> 0) then begin 
        c.mes := Random(12) + 1; 
        c.cod_vj := Random(200) + 1000; 
      end;
    end;
  // mis modulos
  function cargarCompra2(c: compra):tCompra2;
    var c2: tCompra2
    begin
      c2.cod_cli:=elem.cod_cli;
      c2.mes := elem.mes;
    end;
  procedure insertarEnLista(var pri: lista;elem: tCompra2);
    var
    nuevo: lista;
    begin
      new(nuevo);
      nuevo^.dato := elem;
      nuevo^.sig := nil;

      if (pri = nil) then pri := nuevo
      else 
        begin
          nuevo^.sig := pri;
          pri := nuevo;
        end;
    end;
  procedure agregarAArbol(var a: arbol; elem: compra);
    begin
      if(a = nil) then
        begin
          a^.dato.cod_vj := elem.cod_vj;
          a^.dato.p := nil;
          insertarEnLista(a^.dato.p, cargarCompra2(elem));
          a^.HI := nil;
          a^.HD := nil;
        end
      else
        if (elem.cod_vj = a^.dato.cod_vj) then insertarEnLista(a^.dato.p, cargarCompra2(elem))
        else 
          if (elem.cod_vj < a^.dato.cod_vj) then agregarAArbol(a^.HI, elem)
          else agregarAArbol(a^.HD, elem);
    end;
  var c: compra;
  begin
    leerCompra(c);

    while c.cod_cli <> 0 do
      begin
        agregarAArbol(a, c);
        leerCompra(c);
      end;
  end;
// --------------- fin modulo "A" -------------------------
// --------------- modulo "B" -------------------------
function buscarJuego(a: arbol; codigo: Integer) : lista;
  begin
    if (a = nil) then buscarJuego := nil
    else
      if (a^.dato.cod_vj = codigo) then buscarJuego := a^.dato.p
      else 
        if (codigo < a^.dato.cod_vj) then buscarJuego := buscarJuego(a^.HI, codigo)
        else buscarJuego := buscarJuego(a^.HD, codigo);
  end;
// --------------- fin modulo "B" -------------------------
// --------------- modulo "C" -------------------------
procedure cantClientesRecursivo(l: lista; m: mes; var cant: integer);
  begin
    if (l <> nil) then 
      begin
        if (l^.dato.mes = m) then cant := cant + 1;
        cantClientes(l^.sig,m,cant);
      end;
  end;

begin
  // principal...
end.