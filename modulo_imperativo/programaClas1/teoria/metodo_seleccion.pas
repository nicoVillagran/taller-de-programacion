
{
 Variables
 - masChico (item): el valor mas chico encontrado hasta el momento.
 - j: se usa, como indice, para recorrer desde "i" en adelante.
 - pos: se usa para comparar "j" (valor actual) con su valor anterior. "pos" va a ser siempre el anterior a "j".
}

for i:=1 to dimL-1 do
 begin
    pos := 1;
    for j := i+1 to dimL do
     begin
        if(v[j] < v[pos]) then pos := j;

        masChico := v[pos]; // guardamos el valor más chico para que no se pierda. esta en la posicion "pos", siempre.
        v[pos] := v[i]; // si queremos poner el valor más chico en la posicion "i", tenemos que liberar esa posición.
        v[i] := masChico; // finalmente, colocamos el valor mas chico encontrado hasta el momento en la posicion "i".
     end;
 end;