{
 El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas.
 * Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
 * 
 a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. 
 * De cada oficina se ingresa:
 * 	 el código de identificación,
 *  DNI del propietario 
 * y valor de la expensa. 
    
   La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
 
 b. Ordene el vector aplicando el método de selección, por "código de identificación" de la oficina.
}

program practica1_2;
const dimF = 300;
// tipos
Type
 oficina = record
  ID: integer;
  dniPropietario: int64;
  expensa: real;
 end;
 vector = array[1..dimF] of oficina;
 
//módulos
procedure generarVector (var v: vector; var dimL:integer);
 procedure LeerOficina (var ofi: oficina);
  begin   
   readln(ofi.ID);
   if (ofi.ID <> -1)then  // Solo si el dia random generado NO es cero, seguimos con los demas datos.
	begin 
	 writeln('DNI del propietario:');
	 readln(ofi.dniPropietario);
	 writeln('valor expensa: ');
	 readln(ofi.expensa);
	end;
  end;

begin

end;
