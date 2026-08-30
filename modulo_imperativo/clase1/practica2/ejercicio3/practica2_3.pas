{
  Escribir un programa que invoque a los siguientes módulos e informe el resultado:
    a. Un módulo recursivo que retorne un vector de a lo sumo 20 caracteres que conformen una 
    palabra. La lectura de los caracteres termina en ‘.’
}

program practica2_3;
// constantes
const dimF = 20;

// tipos
Type
  vLetras = array[1..dimF] of char;

// módulos
procedure cargarVector(v: vLetras;dimL:integer);
  procedure agregarLetra(v:vLetras;var i:integer; l: char);
    begin
      if (i <= dimF) and (l <> '.') then
          begin
            v[i]:=l;
            write('ingrese una letra: ');
            readln(l);
            agregarLetra(v,i+1,l);
          end;
    end;
  
  var letra: char;
  begin
    write('ingrese una letra: ');
    readln(l);
    if(letra <> '.') then
      begin
        // funcion recursiva..
        agregar(v, dimL+1, letra);
      end;
  end;

// Var programa principal
Var
  letras = vLetras;
begin
  //probar codigo...
end;