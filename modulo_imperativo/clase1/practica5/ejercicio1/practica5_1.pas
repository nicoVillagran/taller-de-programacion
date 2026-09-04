{
	El administrador de un edificio de oficinas tiene la información del pago de expensas. 
	Implementar un programa con: 
		a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas. Se deben cargar, para cada oficina, el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación 0.
		
	
}

program practica5_1;
const dimF = 6; // cambiar a 20 para pruebas - 300
//tipos
Type
	rango1 = 0..dimF;
	tOficina = record
		ID: integer;
		dniPropietario: int64;
		valorExpensa: real;
	end;
	vOficinas = array[1..dimF] of tOficina;

//módulos
procedure crearVector(var v:vOficinas; var dimL:rango1); // init dimL=0
	procedure cargarOficina(var  f: tOficina);
		begin
			f.ID := random(101);
			if(f.ID <> 0) then
				begin
					writeln('cod. identificacion: ', f.ID);
					f.dniPropietario := random((800 - 500) + 1) + 500;
					writeln('dni propietario: ', f.dniPropietario);
					writeln('ingrese valor de expensa: ');
					readln(f.valorExpensa);
				end;
		end;
	procedure agregarAVector(var v:vOficinas; var dimL:rango1;elem:tOficina);
		begin
			if(dimL+1 <= dimF)then
				begin
					dimL := dimL +1;
					v[dimL] := elem;
				end;
		end;
	
	var
		oficina: tOficina;
	begin
		cargarOficina(oficina);
		while(oficina.ID <> 0) and (dimL < dimF)do
			begin
				agregarAVector(v,dimL,oficina);
				cargarOficina(oficina);
			end;
	end;
Var
	oficinas: vOficinas;
	dimL:rango1;
begin
	Randomize;
	dimL:=0;
	
	crearVector(oficinas, dimL);
	
	//recorrer vector
	{for i:=1 to dimL do
		begin
			writeln('ID: ',oficinas[i].ID);
			writeln('dni propietario: ',oficinas[i].ID);
			writeln('ID: ',oficinas[i].ID);
		end}
		
end.
