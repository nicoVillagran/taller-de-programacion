{
  Escribir un programa que invoque a los siguientes módulos e informe el resultado:
    a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres que conformen una 
      palabra. La lectura de los caracteres termina en ‘.’ ✅
    b. Un módulo recursivo que reciba la “palabra” generada en a) y determine si dicha palabra es un palíndromo, es decir, si puede leerse
      de la misma manera de izquierda a derecha que de derecha a izquierda.  Este módulo debe retornar el valor booleano correspondiente. ✅
}

program practica2_3;
// constantes
const dimF = 5;

// tipos
Type
  // rango1 = 1..dimF;
  vLetras = array[1..dimF] of char;

// módulos
procedure cargarVector(var v: vLetras;var dimL:integer);
  var l: char;
  begin
    if (dimL+1 <= dimF) then
      begin
        write('ingrese una letra: ');
        readln(l);
        if (l <> '.') then
          begin
            dimL := dimL+1;
            v[dimL]:=l;
            
            cargarVector(v,dimL);
          end;
      end;
  end;

function esPalindromo(v: vLetras; dimL:integer):boolean;
  function armarPalabra(v:vLetras; dimL, pos:integer):string;
  begin
    if (pos <= dimL) then armarPalabra := v[pos] + armarPalabra(v,dimL,pos+1)
    else armarPalabra := '';
  end;

  function armarPalabraInv(v:vLetras; dimL, pos:integer):string;
  begin
    if (pos <= dimL) then armarPalabraInv := armarPalabraInv(v,dimL,pos+1) + v[pos]
    else armarPalabraInv := '';
  end;
  
  var 
    pOrdenada, pInvertida: string;
    pos:integer;
  begin
    if (dimL = 0) then esPalindromo := false
    else
      begin
        pos := 1;
        // ver si es palindromo
        pOrdenada := armarPalabra(v, dimL, pos);
        pInvertida := armarPalabraInv(v, dimL, pos);
        
        if (pOrdenada = pInvertida) then esPalindromo := true
        else esPalindromo := false;
      end;
  end;
// Var programa principal
Var
  letras: vLetras;
  dimL: integer;
  res:boolean;
begin
  dimL := 0;
  //probar codigo...
  cargarVector(letras,dimL);

  res := esPalindromo(letras, dimL);

  if res then writeln('la palabra es un palindromo')
  else writeln('No es un palindromo');
end.