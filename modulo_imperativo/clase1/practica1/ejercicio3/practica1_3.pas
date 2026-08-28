{
    Netflix ha publicado la lista de películas que estarán disponibles durante el mes de septiembre de 2025.
    De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico,
    7: documental y 8: terror) y puntaje promedio otorgado por las críticas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 
      a. Lea los datos de películas, almacenarlos por orden de llegada y agrupados por código de género, y retornar en una estructura de 
        datos adecuada. La lectura finaliza cuando se lee el código de la película -1. ✅
      b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas, a partir 
        de la estructura generada en a). ✅
      c. Ordene los elementos del vector generado en b) por puntaje utilizando el método visto en la teoría. ✅
      d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, del vector obtenido en el punto c). ✅
}

program practica1_3; // Netflix.
const dimFPeliculas = 8; // Cantidad de géneros.
// Tipos.
type
  rangoGenero = 1..dimFPeliculas;
  pelicula = record
    codPelicula: integer;
    codGenero: rangoGenero;
    puntaje: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: pelicula;
    sig: lista;
  end;
  punteros = record
    pri: lista;
    ult: lista;
  end;
  vectorListas = array[rangoGenero] of punteros; // Vector de listas. Despues se tendra que cambiar por un registro con 2 punteros (pri y ult).
  vMaxPeliculas = array[rangoGenero] of integer; // Vector de códigos de película con mayor puntaje.

// Módulos.
procedure AlmacenarPeliculas(var v: vectorListas; var dimL: integer);
  procedure LeerPelicula(var p: pelicula);
    begin
      writeln('Ingrese el código de la película: ');
      readln(p.codPelicula);
      if (p.codPelicula <> -1) then
        begin
          writeln('Ingrese el código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror): ');
          readln(p.codGenero);
          writeln('Ingrese el puntaje promedio otorgado por las críticas: ');
          readln(p.puntaje);
        end;
    end;
  procedure initVectorListas(var v: vectorListas);
    var i: integer;
    begin
      for i := 1 to dimFPeliculas do
        begin
          v[i].pri := nil;
          v[i].ult := nil;
        end;
      dimL := dimFPeliculas;
    end;
  procedure agregarAlFinal(var pri, ult: lista; p: pelicula);
    var nue: lista;
    begin
      new(nue);
      nue^.dato := p;
      nue^.sig := nil;

      if(pri = nil) then
        begin
          pri := nue;
          ult := nue;
        end
      else
        begin
          ult^.sig := nue;
          ult := nue;
        end;
    end;
  var
    p: pelicula;
  begin
    initVectorListas(v);
    LeerPelicula(p);
    while (p.codPelicula <> -1) do
      begin
        agregarAlFinal(v[p.codGenero].pri, v[p.codGenero].ult, p);
        LeerPelicula(p);
      end;
  end;
function GenerarVectorMaximos(v: vectorListas; var dimLMax: integer): vMaxPeliculas;
  procedure initVectorMaximos(var maxPeliculas: vMaxPeliculas);
    var i: integer;
    begin
      for i := 1 to dimFPeliculas do
        maxPeliculas[i] := -1; // Inicializo con -1 para indicar que no hay películas aún.
    end;
  // programar funcion encontrar maximo...
  // esta funcionara con un puntero en vez de un par valor-referencia, por lo que se recibe un puntero al valor maximo (puntero de referencia) y un puntero con el valor actual (puntero de actual).
  procedure encontrarMaximo (var pReferencia:lista; pActual: lista);
    begin
      if (pActual^.dato.puntaje > pReferencia^.dato.puntaje) then
        pReferencia := pActual;
    end;
  var
    i: integer;
    pMax: lista;
    vMaximos: vMaxPeliculas;
  begin
    // completar programa principal del proceso..
    initVectorMaximos(vMaximos);
    dimLMax := dimFPeliculas;
    for i := 1 to dimLMax do
      begin
        pMax := v[i].pri;
        while (v[i].pri <> nil) do
          begin
            encontrarMaximo(pMax, v[i].pri);
            v[i].pri := v[i].pri^.sig;
          end;
        if (pMax <> nil) then
          vMaximos[i] := pMax^.dato.codPelicula;
      end;
    GenerarVectorMaximos := vMaximos;
  end;
procedure ordenarVector(var v:vMaxPeliculas; var dimL: integer);
  var
    i,j, pos: integer;
    item: integer;
  begin
    for i:=1 to dimL-1 do
      begin
        pos := i;
        
        for j:=i+1 to dimL do
          if (v[j] > item) then pos := j;
        
        item:= v[pos];
        v[pos] := v[i];
        v[i] := item;
      end;
  end;

var
  vPeliculas: vectorListas;
  vMaxs: vMaxPeliculas;
  dimLMax, dimLPeliculas: integer;
begin
  dimLMax := 0;
  dimLPeliculas := 0;
  almacenarPeliculas(vPeliculas, dimLPeliculas);
  vMaxs := GenerarVectorMaximos(vPeliculas, dimLMax);
  ordenarVector(vMaxs, dimLMax);
  writeln('Código de película con mayor puntaje: ', vMaxs[dimLMax]);
  writeln('Código de película con menor puntaje: ', vMaxs[1]);
end.