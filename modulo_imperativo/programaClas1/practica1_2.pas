{
 El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas.
 Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
 
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
		De cada oficina se ingresa:
			-el código de identificación,
			-DNI del propietario
			-y valor de la expensa.

	La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. (while) ✅

	b. Ordene el vector aplicando el método de selección, por "código de identificación" de la oficina.
--------------
	Para generar un vector, se debe haber:
	- creado el tipo vector ✅
	- creado el tipo oficina ✅
	- inicializado el vector (poner todos sus elementos en cero) ✅
	- agregado elementos al vector (dimL = dimL + 1). ✅
}

program practica1_2;
const dimF = 300;
{ tipos }
Type
 oficina = record
  ID: integer;
  dniPropietario: int64;
  expensa: real;
 end;
 vector = array[1..dimF] of oficina;

{ módulos }
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

 procedure initVector (var v:vector);
  var i: integer;
	begin
	 for i:=1 to dimF do
		v[i]:=0;
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
	var ofi: oficina;
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

var
 ofi: oficina;
 ok: boolean;
 dimL: integer;
begin
 dimL := 0;
 initVector(v);
 cargarVector(v,dimL);
end;
