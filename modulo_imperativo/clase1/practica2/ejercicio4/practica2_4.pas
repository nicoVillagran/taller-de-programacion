{
  Implementar un programa que invoque a los siguientes módulos. 
    a. Un módulo recursivo que retorne un vector de 30 números enteros “random” mayores a 300 y menores a 550 (incluidos ambos). ✅
    b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado en la práctica anterior). ✅
    c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente encabezado: 
        Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); ✅
}

program practica2_4;
// constantes
const dimF = 20;

// Tipos
Type
  rango1 = 300..550;
  rango2 = 0..dimF;
  vEnteros = array[1..dimF] of rango1;

// Módulos
procedure cargarVector(var v:vEnteros; var dimL:rango2);
  var nRandom: rango1;
  begin
    if(dimL+1 <= dimF) then
      begin
        dimL := dimL+1;
        nRandom := random((551 - 300) + 1) + 300;
        
        v[dimL] := nRandom;

        cargarVector(v, dimL);
      end;
  end;

procedure ordenarVector(var v:vEnteros; dimL:rango2);
  var
    i, j, pos: rango2;
    item: rango1;
  begin
    for i:=1 to dimL-1 do
      begin
        pos := i;
        for j:=i+1 to dimL do if (v[pos] >= v[j]) then pos := j;

        item := v[pos];
        v[pos] := v[i];
        v[i] := item;
      end;
  end;
Procedure busquedaDicotomica (v: vEnteros; ini,fin: rango2; dato:integer; var pos: integer); // se cambio el tipo de dato "indice" original por "rango2", tambien se cambio el tipo de "pos" por un simple entero.
  var medio: integer;
  begin
    if (ini >= fin) then pos := -1
    else
      begin
        medio := (ini + fin) div 2;
        if (dato = v[medio]) then pos := medio
        else
          begin
            if (dato < v[medio]) then
              begin
                fin := medio - 1;
                busquedaDicotomica(v, ini, fin, dato, pos);
              end
            else
              begin
                ini := medio + 1;
                busquedaDicotomica(v, ini, fin, dato, pos);
              end;
          end;
      end;
  end;
// Variables locales
Var
  enteros: vEnteros;
  dimL, ini, fin, i: rango2;
  dato, pos:integer;
begin
  Randomize;
  dimL := 0;
  
  // cremos el vector de enteros
  cargarVector(enteros,dimL);

  // ordenar el vector
  ordenarVector(enteros,dimL);

  // mostramos el vector
  for i:=1 to dimL do 
    writeln(enteros[i]);

  // buscar un número
  ini:=1;
  fin:=dimL;

  writeln('ingrese un numero: ');
  readln(dato);

  busquedaDicotomica(enteros, ini, fin, dato, pos);

  if pos=-1 then
    writeln('el numero no existe')
  else
    writeln('el numero esta en la posicion: ', pos);
end.