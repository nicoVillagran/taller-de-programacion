{
  Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2015..2026), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos:
i) Una estructura eficiente para la búsqueda por patente.
ii) Una estructura eficiente para la búsqueda por marca.
b) Invoque un módulo que reciba la estructura generada en el inciso a) i) y una marca y
retorne la cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generada en el inciso a) ii) y una marca y
retorne la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y retorne una
estructura con la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y una patente y
devuelva el modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en el inciso a) ii) y una patente y
devuelva el color del auto con dicha patente.

   
}


program Practica5Ejercicio2;

type
rango = 2015..2026;
	
	Informacion	= record
		patente : string;
		anioFabri : rango;
		marca : string;
		color : string;
		modelo : string;
		end;
		
	arbol = ^rama;
	rama = record
		dato : Informacion;
		HD: arbol;
		HI : arbol;
		end;
		
		autos = record
			patente : string;
			marca : string;
			color : string;
			modelo : string;
			end;
		
	Lista = ^nodo;
		nodo = record
			dato : autos;
			sig : Lista;
			end;
	VectorAnio = array [rango] of Lista; 
	
//------------------FIN DEL TYPE----------------



//------------------INCISO A-------------------
{a) Genere la información de los autos (patente, año de fabricación (2015..2026), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos: i) Una estructura eficiente para la búsqueda por patente.
ii) Una estructura eficiente para la búsqueda por marca.}

 procedure armararboles (var a1: arbol ; var a2: arbol);

		procedure GenerarInformacion (var Info: informacion);
		begin
			readln(Info.Marca);
			if (Info.marca <> 'MMM') then begin
				readln(Info.patente);
				readln(Info.anioFabri);
				readln(Info.color);
				readln(Info.modelo);
			end;
		end	;
	
		procedure CargarArbol1 (var a1 : arbol ; Info : Informacion);
		begin
			if (a1 = nil) then begin
				new(a1);
				a1^.dato:= Info;
				a1^.HD:= nil;
				a1^.HI:= nil;
				end
			else
				if (Info.patente < a1^.dato.patente) then
					CargarArbol1(a1^.HI,Info)
				else
					CargarArbol1(a1^.HD,Info);
		end;
	
	procedure CargarArbol2 (var a2 : arbol ; Info : Informacion);
	begin
		if (a2 = nil) then begin
			new(a1);
			a2^.dato:= Info;
			a2^.HD:= nil;
			a2^.HI:= nil;
			end
		else
			if (Info.Marca < a2^.dato.marca) then
				CargarArbol2(a2^.HI,Info)
			else
				CargarArbol2(a2^.HD,Info);
	end;
var
	Info: Informacion;
begin
	GenerarInformacion(Info);
	while (Info.Marca <> 'MMM') do begin
		CargarArbol1(a1,Info);
		CargarArbol2(a2,Info);
		GenerarInformacion(Info);
	end;
end;


//------------------------INCISO B------------------
{b) Invoque un módulo que reciba la estructura generada en el inciso a) i) y una marca y
retorne la cantidad de autos de dicha marca que posee la agencia.}

function BuscarMarca (a1:arbol ; Marca : String): integer;
begin
	if (a1 = nil) then
		BuscarMarca:= 0
	else
		if (a1^.dato.marca = Marca) then
			BuscarMarca:= 1 + BuscarMarca(a1^.HI,Marca) + BuscarMarca(a1^.HD,Marca)
		else
			BuscarMarca:= BuscarMarca(a1^.HI,Marca) + BuscarMarca(a1^.HD,Marca);
end;

//----------------------INCISO C----------------------
{c) Invoque a un módulo que reciba la estructura generada en el inciso a) ii) y una marca y
retorne la cantidad de autos de dicha marca que posee la agencia.}

function BuscarMarcaA2 (a2: arbol ; Marca : String): integer;
begin
	if (a2 = nil) then
		BuscarMarcaA2:= 0
	else
		if (Marca < a2^.dato.Marca) then
			BuscarMarcaA2:= BuscarMarcaA2(a2^.HI , Marca)
		else
			if (Marca = a2^.dato.Marca) then
				BuscarMarcaA2:= 1 + BuscarMarcaA2(a2^.HD , Marca)
			else
				BuscarMarcaA2:= BuscarMarcaA2(a2^.HD , Marca);
end;

//---------------------INCISO D---------------------
{d) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y retorne una
estructura con la información de los autos agrupados por año de fabricación.}

{Sera hacer un vector de listas?}

procedure InicializarVector (var VA : VectorAnio);
var
	i: integer;
begin
	for i:= 2015 to 2026 do
		VA[i]:= nil;
end;


procedure ArmadoNuevaEstructura (a1 : arbol ; var VA: VectorAnio);

	procedure AgregarNodo (Info: informacion ; var L : Lista);
		
		procedure pasarRegistro (Info : informacion ; var autito : autos);
		begin
			autito.marca:= Info.marca;
			autito.color:=Info.color;
			autito.modelo:=Info.modelo;
			autito.patente:=Info.patente;
		end;
		
	var
		nue : Lista;
	begin
		new(nue);
		pasarRegistro(a1^.dato,nue^.dato);
		nue^.sig:= L;
		L:= nue;
	end;
	
Begin
	if (a1 <> nil) then begin
		AgregarNodo(a1^.dato,VA[a1^.dato.anioFabri]);
		ArmadoNuevaEstructura(a1^.HI,VA);
		ArmadoNuevaEstructura(a1^.HD,VA);
	end;
end;
		


//------------------INCISO E----------------------
{e) Invoque a un módulo que reciba el árbol generado en el inciso a) i) y una patente y
devuelva el modelo del auto con dicha patente.}

procedure BusquedaModelo (a1 : arbol ; patente: string ; var Modelo : string);
begin 
	if (a1 = nil) then
		writeln('No se encontro un auto con dicha patente')
	else
		if (patente < a1^.dato.patente) then
			BusquedaModelo(a1^.HI,patente,Modelo)
		else
			if (patente = a1^.dato.patente) then
				Modelo:= a1^.dato.modelo
			else
				BusquedaModelo(a1^.HD,patente,Modelo);
end;

//----------------------------INCISO F-----------------------------
{ Invoque a un módulo que reciba el árbol generado en el inciso a) ii) y una patente y
devuelva el color del auto con dicha patente.}

procedure BusquedaColor (a2: arbol ; patente : string ; var color : string);
begin
	if (a2 = nil) then
		writeln('No se encontro un auto con dicha patente')
	else
		if (patente < a2^.dato.patente) then
			BusquedaColor(a2^.HI,patente,color)
		else
			if (patente = a2^.dato.patente) then
				color:= a2^.dato.color
			else
				BusquedaColor(a2^.HD,patente,color)
end;

//----------------------PROGRAMA PRINCIPAL-------------------
var
	a1,a2 : arbol;
	Marca,Patente,Modelo,Color : string;
BEGIN
	a1:= nil;
	a2:= nil;
	armararboles(a1,a2);
	writeln('escriba la marca a buscar');
	readln(Marca);
	writeln('la cantidad de autos con dicha marca es:', BuscarMarca(a1,Marca));
	writeln('La cantidad de autos con dicha marca es:',BuscarMarcaA2(a2,Marca));
	writeln('escriba la patente a buscar');
	readln(Patente);
	BusquedaModelo(a1,patente,Modelo);
	readln(patente);
	BusquedaColor(a2,patente,color);	
END.

