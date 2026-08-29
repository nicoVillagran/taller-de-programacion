{
  1.- Implementar un programa que invoque a los siguientes módulos.
    a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros "random" mayores a 130 y menores a 145 (incluidos ambos).
    La carga finaliza con el valor 130. ✅
    b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector. ✅
    c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector. ✅
    d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores contenidos en el vector. ✅
    e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del vector. ✅
    f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.✅
    g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en el vector, sus dígitos en el orden en que aparecen en el número. 
    Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se recibe el valor 134, se debe imprimir 1  3  4. ✅
}

Program Clase2MI;
const
  dimF = 15;
  min = 130;
  max = 145;
type
  vector = array [1..dimF] of integer;  

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor := min + random (max - min + 1);
    if ((valor <> 130 ) and (dimL < dimF)) 
    then begin
      dimL := dimL + 1;
      v[dimL] := valor;
      CargarVectorRecursivo (v, dimL);
    end;
  end;
  
  begin
    dimL := 0;
    CargarVectorRecursivo (v, dimL);
  end;
 
procedure ImprimirVector (v: vector; dimL: integer);
  var
    i: integer;
  begin
    for i := 1 to dimL do
      write ('------');
    writeln;
    write (' ');
    for i := 1 to dimL do begin
      write(v[i], ' | ');
    end;
    writeln;
    for i := 1 to dimL do
      write ('------');
    writeln;
    writeln;
  end;

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
  procedure ImprimirRecursivo (v:vector; pos, dimL: integer);
  begin
    if (pos <= dimL) then begin
      writeln('Elemento ', pos, ': ', v[pos]);
      ImprimirRecursivo(v, pos+1, dimL);
    end;
  end;
  var pos: integer;
  begin
    pos := 1;
    if (dimL = 0) then
      writeln('No hay elementos.')
    else
      ImprimirRecursivo(v, pos, dimL);
  end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;
  begin
    if (pos <= dimL)  
    then SumarRecursivo := SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo := 0  
  end;
 
  var pos: integer; 
  begin
    pos := 1;
    Sumar := SumarRecursivo (v, pos, dimL);
  end;

function ObtenerMaximo (v: vector; dimL: integer): integer;
  function buscarMaxRecursivo(v:vector; dimL, pos: integer; var max: integer): integer;
    begin
      if (pos > dimL) then
        buscarMaxRecursivo := max
      else
      begin
        if (v[pos] > max) then
          max := v[pos];

        buscarMaxRecursivo := buscarMaxRecursivo(v, dimL, pos + 1, max);
      end;
    end;
  var
    max: integer;
  begin
    if (dimL = 0) then
      ObtenerMaximo := -1
    else
    begin
      max := v[1];
      ObtenerMaximo := buscarMaxRecursivo(v, dimL, 2, max);
    end;
  end;
     
function BuscarValor (v: vector; dimL, valor: integer): boolean;
  function recorrerVec(v: vector; dimL, pos, val: integer): boolean;
  begin
    if (pos > dimL) then
      recorrerVec := false
    else if (v[pos] = val) then
      recorrerVec := true
    else
      recorrerVec := recorrerVec(v, dimL, pos + 1, val);
  end;

  var
    pos: integer;
  begin
    pos := 1;
    BuscarValor := recorrerVec(v, dimL, pos, valor);
  end;

procedure ImprimirDigitos (v: vector; dimL: integer);
  procedure ImprimirDigitosRecursivo(num: integer);
  begin
    if (num >= 10) then
    begin
      ImprimirDigitosRecursivo(num DIV 10);
      write(num MOD 10, '  ');
    end
    else
      write(num, '  ');
  end;
  
  procedure ImprimirRecursivo (v:vector; pos, dimL: integer);
  begin
    if (pos <= dimL) then begin
      write('numero ', v[pos], ': ');
      ImprimirDigitosRecursivo(v[pos]);
      writeln;
      ImprimirRecursivo(v, pos+1, dimL);
    end;
  end;
  var pos: integer;
  begin
    pos := 1;
    if (dimL = 0) then
      writeln('No hay elementos.')
    else
      ImprimirRecursivo(v, pos, dimL);
  end; 

var dimL, suma, maximo, valor: integer; 
  v: vector;
  encontre: boolean;

begin 
  randomize;
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
    else begin
      // ImprimirVector (v, dimL);
      ImprimirVectorRecursivo (v, dimL);
    end;
  writeln;
  writeln;                   
  suma := Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo := ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre := BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
    else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.