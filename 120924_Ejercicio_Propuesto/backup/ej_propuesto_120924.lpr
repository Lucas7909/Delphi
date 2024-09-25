program ej_propuesto_120924;
const
  Min=1;
  Max=7;
  type
   tBase=integer;
   tVector=array[Min..Max] of tBase;
   tVectorDia=array[Min..Max] of string;
var
  i:integer;
  cantidad:tBase;
  dia:tbase;
  cantDias:tBase;
  vectorProd:tVector;
  vectorNomDia:tVectorDia;
  NumDiaVec:tVector;
procedure cargarDias (var dV:tVectorDia);
var
  i:integer;
begin
for i:=Min to Max do
    case i of
    1:dV[i]:='Lunes';
    2:dV[i]:='Martes';
    3:dV[i]:='Miercoles';
    4:dV[i]:='Jueves';
    5:dV[i]:='Viernes';
    6:dV[i]:='Sabado';
    7:dV[i]:='Domingo';
    end;
end;

procedure cargarProd (prod:tBase;d:tBase;var pV:tVector);
begin
   pV[d]:=prod;
end;
procedure mostrarProd (pV:tVector;dV:tVectorDia);
var
  i:integer;
begin
   for i:=Min to Max do
   case i of
   1: writeln(dV[i],'= ',pV[i]);
   2: writeln(dV[i],'= ',pV[i]);
   3: writeln(dV[i],'= ',pV[i]);
   4: writeln(dV[i],'= ',pV[i]);
   5: writeln(dV[i],'= ',pV[i]);
   6: writeln(dV[i],'= ',pV[i]);
   7: writeln(dV[i],'= ',pV[i]);
   end;
end;
function sumaProd (vP:tVector):integer;
var
  i:integer;
  suma:integer;
  begin
  suma:=0;
  for i:=Min to Max do
    suma:=suma+vP[i];
  sumaProd:=suma;
  end;
function promProd (vP:tVector):real;
begin
promProd:=sumaProd(vP)/Max;
end;
function maxProd (vP:tVector):integer;
var
  i:integer;
  proMax:integer;
begin
proMax:=0;
for i:=Min to Max do
if vP[i]>=proMax then
proMax:=vP[i];
maxProd:=proMax;
end;
function minProd (vP:tVector):integer;
var
  i:integer;
  proMin:integer;
begin
proMin:=vP[1];
for i:=2 to Max do
if vP[i]<=proMin then
proMin:=vP[i];
minProd:=proMin;
end;
procedure buscar (vP:tVector;vBuscado:tBase;var cant:integer;var NDVMax:tVector);
var
  i:integer;
begin
cant:=0;
for i:=Min to Max do
if vP[i]=vBuscado then
begin
cant:=cant+1;
NDVMax[cant]:=i;
end;
end;
procedure mayorAlProm (vP:tVector;prom:real;var cant:integer;var NDVSupProm:tVector);
var
  i:integer;
begin
cant:=0;
for i:=Min to Max do
if vP[i]>prom then
begin
cant:=cant+1;
NDVSupProm[cant]:=i;
end;
end;
begin //ppal
 writeln('ingrese la produccion semanal');
 cargarDias(vectorNomDia);
 repeat
 writeln('ingrese un numero del dia: ');
 writeln('1-Lunes');
 writeln('2-Martes');
 writeln('3-Miercoles');
 writeln('4-Jueves');
 writeln('5-Viernes');
 writeln('6-Sabado');
 writeln('7-Domingo');
 writeln('0-Salir');
 readln(dia);
 if dia<>0 then
    begin
      writeln('ingrese la cantidad de produccion: ');
      readln(cantidad);
      cargarProd(cantidad,dia,vectorProd);
    end
 else
     if dia=0 then
     begin
          writeln('la produccion de la semana fue: ');
          mostrarProd(vectorProd,vectorNomDia);
          write('si la carga de datos es correcta, ingrese 0 para salir, sino, 8 para corregir: ');
          readln(dia);
     end;
until (dia=0);
writeln('la suma de la produccion semanal es: ',sumaProd(vectorProd));
writeln('el promedio de la produccion semanal es: ',promProd(vectorProd):0:2);

buscar(vectorProd,maxProd(vectorProd),cantDias,NumDiaVec);
writeln('la mayor produccion fue de ',maxProd(vectorProd),' y se produjo en ',cantDias,' dias, y son: ');
for i:=1 to cantDias do
writeln(vectorNomDia[NumDiaVec[i]]);

buscar(vectorProd,minProd(vectorProd),cantDias,NumDiaVec);
writeln('la menor produccion fue de ',minProd(vectorProd),' y se produjo en ',cantDias,' dias, y son: ');
for i:=1 to cantDias do
writeln(vectorNomDia[NumDiaVec[i]]);

mayorAlProm (vectorProd,promProd(vectorProd),cantDias,NumDiaVec);
writeln('los dias que superaron el promedio de ',promProd(vectorProd):0:2,' son ',cantDias,' dias, y son: ');
for i:=1 to cantDias do
writeln(vectorNomDia[NumDiaVec[i]]);
readln;
end.

