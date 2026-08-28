{
  Metodo de ordenamiento por insercion.
}

program metodo_insercion;
const dimF = 6;
{ tipos }
type
  vector = array[1..dimF] of integer;
var 
  v: vector;
  dimL : integer;
begin
  // dimL := 0;
  { inicializo y cargo el vector }
  v[1] := 5;
  v[2] := 3;
  v[3] := 2;
  v[4] := 1;
  v[5] := 4;
  v[6] := 6;
  dimL := 6;

  // Metodo de insercion
  for i := 2 to dimL do // recorro el vector desde la segunda posicion
  begin
    actual := v[i]; // guardamos el valor a ordenar
    j := i - 1; // este es el "verdadero" indice del vector, ya que el vector comienza en 1.

    {
      Aclaracion: "j" y "i" van a ir avanzando juntos, como una pareja de [..j, i]. Evaluamos de "i" hacia atras.

      Logica:
      Dado un vector de n elementos, para ordenar el elemento i, debemos compararlo con los elementos anteriores a el, es decir, desde i-1 hasta 1.
    }

    while (j > 0) and (v[j] > actual) do // (J es mayor a 0) y (anterior es mayor al actual)
    begin
      v[j + 1] := v[j]; // el siguiente a anterior toma el valor del anterior, es decir, lo corremos una posicion a la derecha.
      j := j - 1; // disminuimos la posicion "j".
    end;
    v[j + 1] := actual; // ubicamos actual en la posicion calculada.
    {Nota: si j es 0, actual va enla posicion 1, si j es 1, actual va en la posicion 2, etc.}
  end;