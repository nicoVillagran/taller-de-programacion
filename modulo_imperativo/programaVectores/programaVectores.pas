{
  ACTIVIDAD2: crear un archivo "programaVectores".
  
  a) Implemente un módulo CargarVector que cree
   un vector de enteros con a lo sumo 50 valores 
   aleatorios. Los valores, generados 
   aleatoriamente (entre un mínimo y máximo 
   recibidos por parámetro), deben ser almacenados
   en el vector en el mismo orden que se
   generaron, hasta que se genere el valor
   máximo. ✅️
  b) Implemente un módulo ImprimirVector que
   reciba el vector generado en a) e imprima todos
   los valores de las posiciones pares del vector
   en el mismo orden que están almacenados. ✅️
   ¿Qué cambiaría para imprimir en orden inverso?


}

program programaVectores;
uses crt;
const dimF = 20; // deberia ser 50
// tipos.
type
 enteros = array[1..dimF] of Integer ;
 
// módulos.
function generarRandm(A,B:Integer):Integer ;
 var res, num: Integer;
 begin
  res := -1;
  num := random(B - A + 1) + A;
  
  if(num <> B) then res := num
  else res := -1;
  
  generarRandm := res;
 end;
procedure initVector(var v:enteros);
 var i: Integer ;
 begin
  for i:=1 to dimF do
   v[i] := 0;
 end;
procedure agregarVec(var v:enteros;var dimL:Integer;n:Integer); 
 begin
  if ((dimL+1) <= dimF) then
   begin
    dimL := dimL+1;
    v[dimL] := n;
   end;
 end;

procedure cargarVector(var v:enteros;var dimL:Integer ;min,max:Integer);
 var 
  i, ale: Integer; // dimL
  //v: enteros;
 begin
  i:=1;
  //dimL:=0;
 // initVector(v);
  
  ale := generarRandm(5, 15);
  while (i < dimF) and (ale <> -1) do
   begin
    agregarVec(v,dimL,ale); // agregar vector
    
    // actualizar variables.
    i := i+1;
    ale := generarRandm(5, 15);
   end;
  
  //mostrar vector
  {for i:=1 to dimL do
   writeln(v[i]);}
 end;
procedure imprimirVector(v:enteros;dimL:Integer);
 var
  i: Integer;
 begin
  i:=2;
  
  while(i < dimL) do
   begin 
    writeln(i,': ',v[i]);
    i:=i+2;
   end;
 end;

var
 v: enteros;
 dimL: Integer;
 min, max, i: Integer;
begin
 randomize;
 dimL := 0;
 min:=5;
 max:=15;
 initVector(v);
 
 cargarVector(v,dimL,min,max);
 imprimirVector(v,dimL);
 readln;
end.
