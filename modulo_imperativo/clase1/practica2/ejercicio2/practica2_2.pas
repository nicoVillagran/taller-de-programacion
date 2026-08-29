{
  Escribir un programa que:
    a. Implemente un módulo recursivo que genere y retorne una lista de números enteros “random” en el rango 200-230.
     Finalizar con el número 200. ✅
    b.  Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el mismo orden que están almacenados. ✅
    c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en orden inverso al que están almacenados. ✅
    d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo valor de la lista.  
}

program practica2_2;
Type
  rango1 =  200..230;
  lista = ^nodo;
  nodo = record
    dato: rango1;
    sig: lista;
  end;

//modulo A
procedure generarLista(var L: lista; numR: rango1);
  procedure agregarNodo(var L: lista; elem: rango1);
    var nuevo: lista;
    begin
      new(nuevo);
      nuevo^.dato:= elem;
      nuevo^.sig := nil;

      if (L = nil) then L := nuevo
      else
        begin
          nuevo^.sig := L;
          L := nuevo;
        end;
    end;
  begin
    if (numR <> 200) then
      begin
        agregarNodo(L, numR);
        numR := random((230 - 200) + 1) + 200;
        generarLista(L, numR);
      end;
  end;
procedure mostrarLista(L:lista);
  begin
    if (L <> nil) then
      begin
        writeln(L^.dato);
        L := L^.sig;
        mostrarLista(L);
      end;
  end;
procedure mostrarListaInversa(L:lista);
  begin
    if (L^.sig <> nil) then
      mostrarListaInversa(L^.sig);
    writeln(L^.dato);
  end;
function obtenerMin(l:lista):rango1;
  function minimo(num,min:rango1):rango1;
    begin
      if(num < min) then minimo:=num
      else minimo:=min;
    end;
  begin
    if(L = nil) then obtenerMin := 230
    else obtenerMin := minimo(L^.dato, obtenerMin(l^.sig));
  end;
var
  randoms:lista;
  numR, min:rango1;
begin
  Randomize;
  randoms := nil;
  numR := random((230 - 200) + 1) + 200;

  // implementacion modulo "a".
  generarLista(randoms, numR);
  
  // Si se cargaron datos, imprimis lista.
  if(randoms <> nil)then
    begin
      // mostramos lista..
      writeln('----------- lista ------------');
      mostrarLista(randoms);

      // mostramos la lista de adelante para atras.
      writeln('----------- lista inversa ------------');
      mostrarListaInversa(randoms);

      writeln('----------- numero mas chico ------------');
      min:=obtenerMin(randoms);
      writeln('El numero mas chico es el ', min);
    end
  else writeln('lista vacia');
end.