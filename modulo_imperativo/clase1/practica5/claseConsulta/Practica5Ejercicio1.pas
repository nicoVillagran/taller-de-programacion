{
   El administrador de un edificio de oficinas tiene la información del pago de expensas.
Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas. Se deben
cargar, para cada oficina, el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando llega el código de identificación 0.
b) Un módulo que reciba el vector retornado en inciso a) y retorne dicho vector ordenado
por código de identificación de la oficina.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en el inciso b) y un código de identificación de oficina. En caso de
encontrarlo, debe retornar la posición del vector donde se encuentra y en caso
contrario debe retornar 0. Luego el programa debe informar el DNI del propietario o un
cartel indicando que no se encontró la oficina.
d) Un módulo recursivo que retorne el monto total acumulado de las expensas.
   
   CRASH OUT DESPUES DE 45 MIN, siempre la suma de las expensas me da lo mismo, solucione un par mas de cosas
   pero eso sigue igual
}


program P5E1;
const
	DimF = 300;

type
oficina = record
		codigo : integer;
		DNI : integer;
		Valor : integer;
		end;
		
	
	VectorOficina = array [1..DimF] of oficina;

//----------------FIN DEL TYPE---------------------

//---------------INCISO A----------------------	
{Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas. Se deben
cargar, para cada oficina, el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando llega el código de identificación 0.}
procedure ArmarVector (var VO : VectorOficina ; var DimL : integer);

	Procedure CargarOficina (var Ofi: oficina);
	begin
		Ofi.codigo:= random(300)+1;
		if (Ofi.codigo <> 0) then begin
			Ofi.DNI:= random (1000)+1;
			Ofi.Valor:= random(1000);
			end;
	end; 
	
var
	Ofi: oficina;
	
begin
	CargarOficina (Ofi);
	while (Ofi.codigo <> 0) and (DimL < DimF) do begin
		DimL:= DimL+1;
		VO[DimL]:= Ofi;
		CargarOficina(Ofi);
	end;
end;

//------------------INCISO B-------------------
{Un módulo que reciba el vector retornado en inciso a) y retorne dicho vector ordenado
por código de identificación de la oficina.}

procedure OrdenarVector (var VO : VectorOficina ; DimL : Integer);
var
	i,j, pos : integer;
	item: oficina;
begin
	for i:= 1 to (DimL-1) do 
	begin
		pos:= i;
		for j:=i+1 to DimL do
			if (VO[j].codigo < VO[pos].codigo) then
				pos:= j;
		item:= VO[pos];
		VO[pos]:= VO[i];
		VO[i]:= item;
	end;
end;


//-----------------INCISO C-----------------------
{c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en el inciso b) y un código de identificación de oficina. En caso de
encontrarlo, debe retornar la posición del vector donde se encuentra y en caso
contrario debe retornar 0. Luego el programa debe informar el DNI del propietario o un
cartel indicando que no se encontró la oficina.}

procedure BusquedaDicotomica (VO: VectorOficina ; Identificador : integer ; DimL : integer);
var
	pri,ult, medio : integer;
begin
	pri:= 1;
	ult:= DimL;
	medio:= (pri + ult) div 2;
	while (pri < ult) and (Identificador <> VO[medio].codigo) do begin
		if (Identificador < VO[medio].codigo) then
			ult:= medio-1
		else
			pri:=medio +1;
		medio:= (pri+ult) div 2;
	end;
	if (pri <= ult) and (Identificador = VO[medio].codigo) then begin;
		writeln('el valor se encuentro en la posicion', medio);
		writeln('el documento del propietario es', VO[medio].DNI);
		end
	else
		writeln('No se encontro la oficina');
end;

//------------------INCISO D----------------
{Un módulo recursivo que retorne el monto total acumulado de las expensas.}
function ExpensasAcumuladas (VO: VectorOficina ; DimL : integer): integer;
begin
	if (DimL = 0) then
		ExpensasAcumuladas:= 0
	else
		ExpensasAcumuladas:= VO[DimL].valor + ExpensasAcumuladas(VO,DimL-1)
end;

//-----------------MODULO ADICIONAL IMPRIMIR VECTOR------------------
procedure	ImprimirVector (VO: VectorOficina ; DimL: integer);
var
	i: integer;
begin
	for i:=1 to DimL do
		writeln('el codigo de oficina es', VO[i].codigo);
end;

//----------------PROGRAMA PRINCIPAL------------------------
var
	VO:VectorOficina;
	Identificador, DimL: Integer;
BEGIN
	DimL:= 0;
	ArmarVector(VO,DimL);
	ImprimirVector(VO,DimL);
	writeln ('----------');
	writeln ('----------');
	OrdenarVector(VO, DimL);
	ImprimirVector(VO,DimL);
	writeln ('----------');
	writeln ('----------');
	writeln('ingrese un codigo de oficina');
	readln(Identificador);
	BusquedaDicotomica(VO,Identificador,DimL);
	writeln ('----------');
	writeln ('----------');
	writeln('El total de las expensas acumuladas es', ExpensasAcumuladas(VO,DimL));
END.

