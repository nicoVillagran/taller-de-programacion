procedure agregarNodo(var L: lista; elem: rango1);
    var nuevo: lista;
    begin
      new(nuevo);
      nuevo^.dato:= elem;
      nuevo^.sig := nil;

      if (L = nil) then L := nuevo
      else
        begin
          nuevo^.sig := L;
          L := nuevo;
        end;
    end;