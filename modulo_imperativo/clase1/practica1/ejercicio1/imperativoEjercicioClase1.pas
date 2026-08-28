{
 Se desea procesar la información de las ventas de productos de un comercio (como máximo 50).
 Implementar un programa que invoque los siguientes módulos:

  a. Un módulo que retorne la información de las ventas en un vector.
  	 De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).
  	 El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer. 
  	 El ingreso de las ventas finaliza con el día de venta 0 (no se procesa). ✅
  b. Un módulo que muestre el contenido del vector resultante del punto a). ✅
  c. Un módulo que ordene el vector de ventas por código. ✅
  d. Un módulo que muestre el contenido del vector resultante del punto c).✅
  e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros.
  f. Un módulo que muestre el contenido del vector resultante del punto e).
  g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total
	 de productos vendidos.
  h. Un módulo que muestre la información obtenida en el punto g).
}

program Clase1MI;
const dimF = 50;
// Tipos
type
  dias = 0..31;
  rango1 = 0..15;
  rango2 = 1..99;
  rango3 = 0..dimF;
  venta = record
    dia: dias;
    codigoP: rango1;
    cantidad: rango2;
  end;
  vector = array [1..dimF] of venta; { estructura principal para guardar la informacion }
  elemento = record
    codigoP: rango1;
    cantTotal: integer;
  end;
  lista = ^nodo;
  nodo = record
    dato: elemento;
    sig: lista;
  end;

// Modulos
{------------------- módulo "a" ---------------------------------}
procedure AlmacenarInformacion (var v: vector; var dimL: rango3); // recibe: un vector y un dimL con un rango determinado porque este módulo va a crear un vector.
 procedure LeerVenta (var v: venta); // sub-módulo: recibe un registro "venta".
  begin
   Randomize; // Creamos el objeto para crear numeros random.
   
   write ('Dia: '); // generamos un dia random
   v.dia:= random(32);
   
   writeln (v.dia); // mostramos el dia generado al usuario.
   if (v.dia <> 0)then  // Solo si el dia random generado NO es cero, seguimos con los demas datos.
	begin 
	 write ('Codigo de producto: ');
	 v.codigoP:= random(16) + 1; // numero random entre 1 y 15. formula: "random(max + 1) + min".
	 writeln (v.codigoP);
	 write ('Ingrese cantidad (entre 1 y 99): ');
	 readln (v.cantidad); // UNICO DATO QUE INGRESA EL USUARIO.
	end; // Nota: solo se muestran los datos generados, para que el usuario los vea.
  end;
 var unaVenta: venta;
 begin
  dimL := 0;
  LeerVenta (unaVenta);
  while (unaVenta.dia <> 0)  and ( dimL < dimF ) do // verificamos que (el dia no sea 0) y (que la dimension logica no halla superado la dim. fisica).
   begin
	dimL := dimL + 1; // aumentamos la dimL
	v[dimL]:= unaVenta; // añadimos la venta
	LeerVenta(unaVenta); // volvemos a leer
   end;
 // Nota módulo: creamos un registro, lo llenamos y lo agregamos al vector.
 end;


{------------------- módulo "B" ---------------------------------}
procedure ImprimirVector (v: vector; dimL: rango3); // Solo lectura. Vector y Tamaño lógico. Solo muestra los codigos y las cantidades
 var i: integer; // var contador.
 begin
  write ('         -'); // por qué?
  for i:= 1 to dimL do write ('-----');
  writeln; // representan un salto de linea.
  write ('  Codigo:| ');
  
  for i:= 1 to dimL do
   begin
	if(v[i].codigoP <= 9)then // no imprime numeros de 1 digito. En su lugar imprimer 0
	 write ('0');	
	write(v[i].codigoP, ' | '); // solo numeros de 2 o mas digitos
   end;
  writeln;
  writeln;
  write ('Cantidad:| ');
  for i:= 1 to dimL do
   begin
	if (v[i].cantidad <= 9)then
	 write ('0');
	write(v[i].cantidad, ' | ');
   end;
  writeln;
  write ('         -');
  for i:= 1 to dimL do write ('-----');
  writeln;
  writeln;
 End;


{------------------- módulo "C" ---------------------------------}
procedure Ordenar (var v: vector; dimL: rango3); // solo modificamos el vector, leemos la dimL.
  var
    i, j, pos: rango3;
    item: venta;
  begin
    for i:= 1 to dimL - 1 do
      begin
        pos := i; //en "pos" guardamos el minimo cuando lo encontremos.
      
        for j:=i+1 to dimL do
          if (v[j].codigoP < v[pos].codigoP) then pos:=j; // buscamos el minimo en el resto del vector.
        
        //intercambia v[i] y v[pos].
        item := v[pos]; // guardamos el valor minimo encontrado.
        v[pos] := v[i]; // liberamos la posicion "i".
        v[i] := item; // ubicamos el minimos en "i".
      end;
  end;

procedure Eliminar (var v: vector; var dimL: rango3; valorInferior, valorSuperior: rango1);
 // sub-módulos.
 function BuscarPosicion(v: vector; dimL: rango3; elemABuscar: rango1): rango3; // nos pasan un codigo. retornamos un posicion.
  var pos: rango3;
  begin
   pos:= 1; // inicializamos en la primera posicion.
   while (pos <= dimL) and (elemABuscar > v[pos].codigoP) do // mientras (la posicion sea valida) y (el elmento sea menor al actual)
	pos:= pos + 1; // avanzamos posiciones.
   if (pos > dimL) then BuscarPosicion:= 0 // recorrimos todo los elementos y no hubo coincidencias.
   else BuscarPosicion:= pos; // encontramos un codigo mayor o igual al dado.
  end;

 function BuscarPosicionDesde (v: vector; dimL, pos : integer; elemABuscar: rango1): rango3;
  begin
   while (pos <= dimL) and (elemABuscar >= v[pos].codigoP) do
	pos:= pos + 1;
   if (pos > dimL) then BuscarPosicionDesde:= dimL
   else BuscarPosicionDesde:= pos - 1;
  end;

 var posInferior, posSuperior, salto, i: rango3;
 Begin
  posInferior:= BuscarPosicion (v, dimL, valorInferior);
  if (posInferior <> 0) then // la posicion inferior pasada es valida (existe).
   begin
    posSuperior:= BuscarPosicionDesde (v, dimL, posInferior, valorSuperior); //
    //Escribir el código correspondiente para hacer el corrimiento y disminuir la dimensión lógica.
    // corrimiento
    salto:= (posSuperior - posInferior) + 1; // cantidad de elementos a eliminar
    for i:= posSuperior + 1 to dimL do
     v[i - salto]:= v[i]; // corrimiento a la izquierda.
    dimL:= dimL - salto; // disminuimos la dimension logica.
   end;
 end;


{------------------- módulo "" ---------------------------------}
procedure GenerarLista (v: vector; dimL: rango3; var L: lista);

  procedure AgregarAtras (var L{pri}, ult{ultimo nodo}: lista; elem {total ventas}: elemento);
    var nuevo: lista;
    begin
      //Completar...
      // creamos un nuevo nodo.
      new(nuevo);
      nuevo^.dato := elem;
      nuevo^.sig := nil;
      
      // buscamos donde ponerlo 
      if (L = nil) then
      begin
        L := nuevo;
        ult := nuevo;
      end
      else begin
      ult^.sig := nuevo;
        ult := nuevo;
      end;
    end;


  var
    i: rango3;
    ult: lista;
    e: elemento;
  begin
  L:= nil;
  ult:= nil;
  i:= 1;
  while (i<= dimL) do
    begin
    e.codigoP:=  v[i].codigoP;
    e.cantTotal:= 0;
      while ((i<= dimL) and (e.codigoP =  v[i].codigoP)) do
        begin
          e.cantTotal:= e.cantTotal + v[i].cantidad;
          i:= i + 1;
        end;
    AgregarAtras (L, ult, e);
    end;
  end;

procedure ImprimirLista (L: lista);
 begin
  //Completar
  while (L <> nil) do
   begin
    writeln(L^.dato.codigoP);
    writeln(L^.dato.cantTotal);
    
    // avanzar
    L := L^.sig;
   end;
 end;

var 
 v: vector;
 dimL: rango3;
 valorInferior, valorSuperior: rango1;
 L: lista;
Begin
 AlmacenarInformacion (v, dimL);
 writeln;
 if (dimL = 0) then writeln ('--- Vector sin elementos ---')
 else
  begin
		writeln ('--- Vector ingresado --->');
		writeln;
		ImprimirVector (v, dimL);
		writeln;
		writeln ('--- Vector ordenado --->');
		writeln;
		Ordenar (v, dimL);
		ImprimirVector (v, dimL);
		
		writeln ('--- Modifiquemos el vector --->');
    write ('Ingrese valor inferior (1..', dimL, '): ');
		readln (valorInferior);
		write ('Ingrese valor superior (', valorInferior, '..', dimL, '): ');
		readln (valorSuperior);
		Eliminar (v, dimL, valorInferior, valorSuperior);
		
    if (dimL = 0) then writeln ('--- Vector sin elementos, luego de la eliminacion ---')
    else begin
      writeln;
      writeln ('--- Vector luego de la eliminacion --->');
      writeln;
      ImprimirVector (v, dimL);
      GenerarLista (v, dimL, L);
      if (L = nil) then writeln ('--- Lista sin elementos ---')
      else begin
        writeln;
        writeln ('--- Lista obtenida --->');
        writeln;
        ImprimirLista (L);
      end;
    end;
  end;
end.
