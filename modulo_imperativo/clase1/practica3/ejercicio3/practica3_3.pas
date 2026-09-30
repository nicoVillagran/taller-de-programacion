{
  Implementar un programa que contenga:
    a. Un módulo que lea información de los préstamos de libros realizados por los socios de una biblioteca y los almacene en una estructura
       de datos. De cada préstamo se lee: número de socio (1 a 60), código de libro (200 a 230), fecha de préstamo y cantidad de días del préstamo.
       La lectura de los préstamos finaliza con número de socio 0. La estructura generada debe ser eficiente para la búsqueda por número de
       socio y, para cada socio, deben almacenarse en una lista los préstamos de libros que realizó. Nota: No repetir información. *
		b. Un módulo que reciba la estructura generada en el inciso a) y retorne la cantidad de socios cuyo número de socio es múltiplo de 5. *
		c. Un módulo que reciba la estructura generada en el inciso a) e informe, para cada socio, su número de socio y la cantidad de préstamos
			 de libros cuya duración fue menor o igual a 7 días. *
		d. Un módulo que reciba la estructura generada en el inciso a) y un valor real que representa una cantidad promedio de días.
			 El módulo debe retornar los números de socio y el promedio de días de préstamo de aquellos socios cuyo promedio supere 
			 el valor ingresado. 
			
		
}

program practica3_3;
// tipos
type
  rango1 = 0..60;
  rango2 = 200..230;
  rango3 = 1..30;
  rango4 = 1..12;
  tFecha = record
    dia: rango3;
    mes: rango4;
    anio: integer;
  end;
  tPrestamo = record
    numSocio: rango1;
    codLibro: rango2;
    fecha: tFecha;
    cantDias: rango3;
  end;
	tPrestamo2=record
    codLibro: rango2;
    fecha: tFecha;
    cantDias: rango3;
	end;
	lista=^nLista;
	nLista=record
		dato: tPrestamo2;
		sig: lista;
	end;
	datoArbol=record
		numSocio: integer;
		p: lista;
	end;
	arbol=^nodo;
	nodo=record
		dato: datoArbol;
		HI:arbol;
		HD:arbol;
	end;

// Módulos
// ---------------------------- módulo "a"
procedure cargarArbol(var a:arbol);
	procedure leerFecha(var f: tFecha);
		begin
			f.dia:=random((30-1)+1)+1;
			f.mes:=random((12-1)+1)+1;
			f.anio:=2026;
		end;
	procedure leerPrestamo(var p: tPrestamo);
		begin
			p.numSocio := random(61);
			if(p.numSocio <> 0) then
				begin
					p.codLibro:=random((230-200) +1)+200;
					leerFecha(p.fecha);
					p.cantDias:=random((30-1)+1)+1;
				end;
		end;
	function cargarPrestamo2(var p: tPrestamo) : tPrestamo2;
		var p2: tPrestamo2;
		begin
			p2.codLibro:=p.codLibro;
			p2.fecha:=p.fecha;
			p2.cantDias:=p.cantDias;

			cargarPrestamo2:=p2;
		end;
	procedure agregarALista(var pri: lista;elem: tPrestamo2);
		var nuevo: lista;
		begin
			New(nuevo);
			nuevo^.dato:=elem;
			nuevo^.sig:=nil;

			if pri = nil then pri:=nuevo
			else
				begin
					nuevo^.sig:=pri;
					pri:=nuevo;
				end;
		end;
	procedure agregarAArbol(var a:arbol;elem:tPrestamo);
		begin
			if (a = nil) then
				begin
					new(a);
					a^.dato.numSocio:=elem.numSocio;
					a^.dato.p:=nil;
					agregarALista(a^.dato.p, cargarPrestamo2(elem));
					a^.HI:=nil;
					a^.HD:=nil;
				end
			else
				if (elem.numSocio = a^.dato.numSocio) then agregarALista(a^.dato.p, cargarPrestamo2(elem))
				else
					if(elem.numSocio < a^.dato.numSocio) then agregarAArbol(a^.HI, elem)
					else agregarAArbol(a^.HD, elem);
		end;
	var prestamo:tPrestamo;
	begin
		leerPrestamo(prestamo);
		while prestamo.numSocio <> 0 do
			begin
				agregarAArbol(a,prestamo);
				leerPrestamo(prestamo);
			end;
	end;
// --------------------------- fin modulo "a"
// --------------------------- modulo "b"
procedure contarSociosMultiplos(a:arbol;var cant:Integer);
	function esMultiploDe5(n:rango1): Boolean;
		begin
			esMultiploDe5:=n MOD 5 = 0;
		end;
	begin
		if(a <> nil)then
			begin
				contarSociosMultiplos(a^.HI, cant);
				if (esMultiploDe5(a^.dato.numSocio))then
					cant:=cant+1;
				contarSociosMultiplos(a^.HD, cant);
			end;
	end;
// --------------------------- fin modulo "b"
// --------------------------- modulo "C"
procedure mostrarInfo(a:arbol);
	function contarPrestamos(pri:lista):Integer;
		var res: Integer;
		begin
			res:=0;
			while pri <> Nil do
				begin
					if (pri^.dato.cantDias <= 7) then
						res := res +1; 
				end;
			contarPrestamos:=res;
		end;
	var cant: Integer;
	begin
		if a <> nil then
			begin
				mostrarInfo(a^.HI);
				cant := contarPrestamos(a^.dato.p);
				WriteLn('num. socio: ',a^.dato.numSocio);
				WriteLn('cant prestamos duracion <= 7: ',cant);
				mostrarInfo(a^.HD);
			end;
	end;
// --------------------------- modulo "d"
// ...
// --------------------------- modulo "d"

Var
	
begin
end.
