{
	El administrador de un edificio de oficinas tiene la información del pago de expensas.
	Implementar un programa con:
		a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas. Se deben cargar, para cada oficina, el código de identificación,
			 DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación 0. ✅

		b) Un módulo que reciba el vector retornado en inciso a) y retorne dicho vector ordenado por código de identificación de la oficina. ✅

		c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector generado en el inciso b) y un código de identificación
			 de oficina. En caso de encontrarlo, debe retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
			 Luego el programa debe informar el DNI del propietario o un cartel indicando que no se encontró la oficina. (NO parte modulo) ✅

			 "dependiendo lo que arroje la funcion el programa hace una cosa o la otra."

		d) Un módulo recursivo que retorne el monto total acumulado de las expensas. ✅


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

// ----------------------- modulo 'a'-------------------
procedure crearVector(var v:vOficinas; var dimL:rango1); // init dimL=0
	procedure cargarOficina(var  f: tOficina);
		begin
			f.ID := random(101);
			if(f.ID <> 0) then
				begin
					// writeln('cod. identificacion: ', f.ID);
					f.dniPropietario := random((4500 - 1200) + 1) + 1200;
					// writeln('dni propietario: ', f.dniPropietario);
					f.valorExpensa := random((800 - 400) + 1) + 400;
					// writeln('valor expensa: ', f.valorExpensa:0:2);
					// writeln('ingrese valor de expensa: ');
					// readln(f.valorExpensa);
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
// ----------------------- fin modulo 'a'------------------

// ----------------------- modulo 'b'------------------
procedure ordenarVector(var v:vOficinas; dimL:rango1);
	var
		i, j, pos: rango1;
		item: tOficina;
	begin
		for i:=1 to dimL-1 do
			begin
				pos := i; // se reinicia en cada vuelta del for
				for j:=i+1 to dimL do
					if (v[pos].ID > v[j].ID) then pos:=j;

				item := v[pos];
				v[pos] := v[i];
				v[i] := item;
			end;
	end;
// ----------------------- fin modulo 'b'------------------

// ----------------------- modulo 'c'------------------
function buscarElemento(v: vOficinas;dimL:rango1;elem: integer) : rango1;// usando la busqueda dicotomica.
	var
		pri, medio, ult: rango1;
	begin
		pri := 1;
		ult := dimL;
		medio := (ult + pri) DIV 2;

		while (pri <= ult) and (v[medio].ID <> elem) do
			begin
				if (elem < v[medio].ID) then ult := medio-1
				else pri := medio+1;

				medio := (ult + pri) DIV 2;
			end;
		
		if (pri <= ult) and (v[medio].ID = elem) then buscarElemento := medio
		else buscarElemento := 0;
	end;

// ------------------------ modulo "d" --------------------
function sumarExpensas (v: vOficinas; dL:rango1):real;
	begin
		if (dL = 0) then sumarExpensas := 0
		else sumarExpensas := v[dL].valorExpensa + sumarExpensas(v,dL-1);
	end;
// ------------------------ modulo "d" --------------------
Var
	oficinas: vOficinas;
	dimL, i, pos:rango1;
	idElem: Integer; 
	res: Real;
begin
	Randomize;
	dimL:=0;

	crearVector(oficinas, dimL);
	
	//recorrer vector
	writeln('---------------------- vector -------------------');
	for i:=1 to dimL do
		begin
			writeln('ID: ',oficinas[i].ID);
			writeln('dni propietario: ',oficinas[i].dniPropietario);
			writeln('expensas: ',oficinas[i].valorExpensa:0:2);
		end;
	writeln('---------------------- vector ordenado -------------------');
	ordenarVector(oficinas, dimL);

	for i:=1 to dimL do writeln(i,'. ', oficinas[i].ID);
	writeln('---------------------- buscar un ID -------------------');
	writeln('ingrese un cod. identificacion a buscar: ');
	ReadLn(idElem);
	
	pos := buscarElemento(oficinas, dimL, idElem);
	if pos <> 0 then writeln('el ID esta ', idElem, ' esta en la posicion: ', pos)
	else WriteLn('no se encontro la oficina');

	WriteLn('---------------------- sumar expensas ----------------');
	res := sumarExpensas(oficinas, dimL);
	WriteLn('El valor total de las expensas es: ', res:0:2);
end.
