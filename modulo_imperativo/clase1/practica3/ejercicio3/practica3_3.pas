{
  Implementar un programa que contenga:
    a. Un módulo que lea información de los préstamos de libros realizados por los socios de una biblioteca y los almacene en una estructura
       de datos. De cada préstamo se lee: número de socio (1 a 60), código de libro (200 a 230), fecha de préstamo y cantidad de días del préstamo.
       La lectura de los préstamos finaliza con número de socio 0. La estructura generada debe ser eficiente para la búsqueda por número de
       socio y, para cada socio, deben almacenarse en una lista los préstamos de libros que realizó. Nota: No repetir información.

			 -leerPrestamo ✅
			 -agregarALista ✅
			 -agregarAArbol ✅
			 -cargarArbol ✅
			
			 
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
			if(elem.numSocio < a^.dato.numSocio) then agregarAArbol(a^.HI, elem)
			else agregarAArbol(a^.HD, elem);
	end;
procedure cargarArbol(var a:arbol);
	var prestamo:tPrestamo;
	begin
		leerPrestamo(prestamo);
		while prestamo.numSocio <> 0 do
			begin
				agregarAArbol(a,prestamo);
				leerPrestamo(prestamo);
			end;
	end;

begin
  // programa principal..
end.
