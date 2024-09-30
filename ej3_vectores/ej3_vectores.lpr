program ej3_vectores;

uses LOVectores;

const
  Min=1;
  Max=15;
type
  tBase=integer;
  tVector=array[Min..Max] of tBase;
var
   A:tVector;
   B:tVector;
   C:tVector;
   Nombre:char;
   num:tBase;
   D:tVector; //D es el vector inverso.
   ult_c:integer;
procedure cargarVector (var x:tVector);
var
   i:integer;
begin
  //randomize; {te genera los mismos valores, por eso se pone en ppal}
  for i:=Min to Max do
  x[i]:=random(100);
end;
procedure mostrarVector (x:tVector;nom:char);
var
   i:integer;
begin
  write(nom,'=(');
  for i:=Min to Max do
  //begin
  if i<>Max then
  write(x[i],',')
  else
  if i=Max then
  write(x[i]);
  //end;
  writeln(')');
end;
procedure sumarVector (x,y:tVector; var z:tVector);
var
   i:integer;
begin
  for i:=Min to Max do
  z[i]:=x[i]+y[i];
end;
function sumarElementos (x,y:tVector; z:tBase):tBase;
var
   suma:tBase;
   i:integer;
begin
  suma:=0;
  for i:=Min to z do
  suma:=suma+x[i]+y[i];
  sumarElementos:=suma;
end;
function sumarElementos2 (x,y:tVector; z:tBase):tBase;
var
   i:integer;
   sumaX,sumaY:tBase;
begin
  sumaX:=0;
  sumaY:=0;
  for i:=Min to z do
  sumaX:=sumaX+x[i];
  for i:=Max downto Max-z+1 do
  sumaY:=sumaY+y[i];
  sumarElementos2:=sumaX+sumaY;
end;

procedure invertirVector(x:tVector;var y:tVector);
var
   i:integer;
begin
for i:=Min to Max do
  y[i]:=x[Max-i+1];
end;

function validarNum (x:tBase):boolean;
begin
 if (x>=Min) and (x<=Max) then
 validarNum:=true;
end;
procedure copiarIguales (a,b:tVector; var c:tVector; var ultimo_c:integer);
var
   i,j:integer;
begin
     ultimo_c:=0;
     for i:=Min to Max do
         for j:=Min to Max do
             if a[i]=b[j] then
             begin
                ultimo_c:=ultimo_c+1;
                c[ultimo_c]:=a[i];
             end;
end;
procedure copiarNoIguales (a,b:tVector; var c:tVector; var ultimo_c:integer);
var
   i,j:integer;
   encontro:boolean;
begin
     ultimo_c:=0;

     for i:=Min to Max do
     begin
          encontro:=false;
          for j:=Min to Max do
              if a[i]=b[j] then
              encontro:=true;
          if not encontro then
          begin
               ultimo_c:=ultimo_c+1;
               c[ultimo_c]:=a[i];
          end;
     end;
end;
begin //ppal
     randomize;
     cargarVector(A);
     CargarVector(B);

     writeln('el vector A es:');
     nombre:='A';
     mostrarVector(A,nombre);

     writeln('el vector B es:');
     nombre:='B';
     mostrarVector(B,nombre);

     writeln('la suma de A y B se almacena en C: ');
     nombre:='C';
     sumarVector(A,B,C);
     mostrarVector(C,nombre);

     invertirVector(B,D);
     writeln('el vector inverso de B es D y es:');
     nombre:='D';
     mostrarVector(D,nombre);

     writeln('el vector B es:');
     nombre:='B';
     mostrarVector(B,nombre);

     repeat
     write('Ingrese un valor de <n> para sumar los primeros de A y los ultimos de B: ');
     readln(num);
     if validarNum(num) then
     begin
        writeln('la suma es: ',sumarElementos(A,D,num));
        writeln('la suma2 es: ',sumarElementos2(A,B,num));
     end
     else
         writeln('error, debe ingresar un valor de n entre ',Min,' y ',Max);
     until validarNum(num);

     copiarIguales(A,B,C,ult_c);
     writeln('el vector C de elementos iguales entre A y B es: ');
     nombre:='C';
     mostrarVector(C,nombre);
     writeln('el ultimo elemento de C esta en posicion: ',ult_c);

     copiarNoIguales(A,B,C,ult_c);
     writeln('el vector C de elementos de A que no estan en B es: ');
     nombre:='C';
     mostrarVector(C,nombre);
     writeln('el ultimo elemento de C esta en posicion: ',ult_c);

     readln;
end.

