{
 El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas.
 Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
 
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
		De cada oficina se ingresa: el código de identificación, DNI del propietario y valor de la expensa.
		La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. (while) ✅

	b. Ordene el vector aplicando el método de selección, por "código de identificación" de la oficina. ✅
}

program practica1_2;
const dimF = 300;
// Tipos.
Type
 oficina = record
  ID: integer;
  dniPropietario: int64;
  expensa: real;
 end;
 vector = array[1..dimF] of oficina;

//	Módulos.
// punto a.
procedure generarVector (var v: vector; var dimL:integer);
 procedure LeerOficina (var ofi: oficina);
  begin
   readln(ofi.ID);
   if (ofi.ID <> -1)then {Solo si el dia random generado NO es cero, seguimos con los demas datos.}
		begin
			writeln('DNI del propietario:');
			readln(ofi.dniPropietario);
			writeln('valor expensa: ');
			readln(ofi.expensa);
		end;
  end;

 procedure agregarVector(var v:vector; var dimL:integer;elem:oficina;var ok:boolean);
	begin
		if (dimL+1 <= dimF) then
		begin
			dimL := dimL+1;
			v[dimL] := elem;
		end;
	end;
 procedure cargarVector(var v:vector; var dimL:integer);
	var 
		ofi: oficina;
		ok: boolean;
	begin
		LeerOficina(ofi);
		while (ofi.ID <> -1) do
			begin
				agregarVector(v,dimL,ofi,ok);
				if (not ok) then
					writeln('No se pudo agregar la oficina. Vector lleno.');
				LeerOficina(ofi);
			end;
	end;
 begin
	dimL := 0;
	cargarVector(v,dimL);
 end;
// punto b.
procedure ordenarVector (var v:vector; dimL:integer);
 var
 	i,j,pos: integer;
 	item: oficina;
 begin
	for i:=1 to dimL-1 do
		begin
			pos := i;
			for j:=i+1 to dimL do 
				if (v[j].ID < v[pos].ID) then pos := j; // busqueda del minimo.
			// intercambio
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
 end;

//  Programa principal.
var
 v: vector;
 dimL: integer;
begin
 generarVector(v,dimL);
 ordenarVector(v,dimL);
end.