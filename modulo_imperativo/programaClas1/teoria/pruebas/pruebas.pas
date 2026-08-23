program pruebas;
    type vector = array[1..6] of integer;
var
  i, salto, posSuperior,posInferior: integer;
  v: vector;
  dimL: integer;
begin
// inicializamos vector
v[1]:= 1;
v[2]:= 3;
v[3]:= 5;
v[4]:= 2;
v[5]:= 4;
v[6]:= 6;

dimL := 6;
	
posInferior := 2;
posSuperior := 4;
salto := posSuperior - posInferior + 1;
for i:=posSuperior + 1 to dimL do
  v[i - salto] := v[i];
dimL := dimL - salto;

// mostrar el nuevo vector
for i:= 1 to dimL do
  writeln(v[i]);
end.
