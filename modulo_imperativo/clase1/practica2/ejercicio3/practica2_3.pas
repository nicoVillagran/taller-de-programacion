{
  Escribir un programa que invoque a los siguientes módulos e informe el resultado:
    a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres que conformen una 
    palabra. La lectura de los caracteres termina en ‘.’ ✅
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

// Var programa principal
Var
  letras: vLetras;
  dimL: integer;
begin
  dimL := 0;
  //probar codigo...
  cargarVector(letras,dimL);

  
end.