
/*Ejecutar las setencias en el orden en el que estan*/
create database ESTUDIANTES
go

use ESTUDIANTES
go


create table Estudiantes(
codigoEstudiante char(3) PRIMARY KEY,
apellidoEstudiante varchar(50),
nombreEstudiante varchar(50)
)

create table Notas(
codigoEstudiante char(3) PRIMARY KEY,
notaUno dec(3,1) check(notaUno > 0 and notaUno <=10),
notaDos dec(3,1) check(notaDos > 0 and notaDos <=10),
notaTres dec(3,1) default (null) check(notaTres > 0 and notaTres <=20),
notaFinal dec(4,1) default (null) check(notaFinal > 0 and notaFinal <=40),
statusAprueba char(1) default (null) check(statusAprueba in('A','F','S')),
FOREIGN KEY(codigoEstudiante) REFERENCES Estudiantes (codigoEstudiante)
)

create table aprobados(codigoEstudiante char(3) foreign key references Estudiantes(codigoEstudiante), 
nombreEstudiante varchar(50),apellidoEstudiante varchar(50),
primary Key(codigoEstudiante))

create table supletorio(codigoEstudiante char(3) foreign key references Estudiantes(codigoEstudiante), 
nombreEstudiante varchar(50),apellidoEstudiante varchar(50),
primary Key(codigoEstudiante))

create table reprobados(codigoEstudiante char(3) foreign key references Estudiantes(codigoEstudiante), 
nombreEstudiante varchar(50),apellidoEstudiante varchar(50),
primary Key(codigoEstudiante))

create table Resultado_Especificos(
NroEstudiantes int ,Grupo char(10))

/*Trigger para controlar la insercion de las notas , que sume las notas y de la final*/
create trigger tr_InserccionNotas 
on Notas 
after insert 
as 
declare @nota1 dec(3,1) ,
@nota2 dec(3,1),
@notafinal dec(3,1)

set @nota1=(select i.notaUno from inserted i ,Notas n where n.codigoEstudiante=i.codigoEstudiante)
set @nota2=(select i.notaDos from inserted i, Notas n where n.codigoEstudiante=i.codigoEstudiante)
set @notafinal=@nota1+@nota2

update Notas set notaFinal=@nota1+@nota2 from Notas n , inserted i 
where n.codigoEstudiante=i.codigoEstudiante
if(@notafinal>=14)
update Notas set statusAprueba='A' from Notas n, inserted i
where n.codigoEstudiante=i.codigoEstudiante
else
begin
if(@notafinal>=9 and @notafinal<14)
update Notas set statusAprueba='S'from Notas n, inserted i
where n.codigoEstudiante=i.codigoEstudiante
else
begin 
update Notas set statusAprueba='F'from Notas n, inserted i
where n.codigoEstudiante=i.codigoEstudiante
end
end

/*TRigger para dar el estatus atraves del cual se pone al estudiante en su tabla si ha 
aprobado , fallado o suple*/
create trigger tr_InsercionAprobadosSuplePierde
on Notas 
after insert 
as 
declare
@nota1 dec(3,1) ,
@nota2 dec(3,1),
@notafinal dec(3,1),
@nombreEstudiante varchar(50),
@apellidoEstudiante varchar(50),
@codigoEstudiante char(3)
set @nota1=(select i.notaUno from inserted i ,Notas n where n.codigoEstudiante=i.codigoEstudiante)
set @nota2=(select i.notaDos from inserted i, Notas n where n.codigoEstudiante=i.codigoEstudiante)
set @notafinal=@nota1+@nota2
set @apellidoEstudiante=(select apellidoEstudiante from inserted i, Notas n inner join 
Estudiantes e on e.codigoEstudiante=n.codigoEstudiante where i.codigoEstudiante=e.codigoEstudiante)
set @nombreEstudiante=(select nombreEstudiante from inserted i, Notas n inner join 
Estudiantes e on e.codigoEstudiante=n.codigoEstudiante where i.codigoEstudiante=e.codigoEstudiante)
set @codigoEstudiante= (select i.codigoEstudiante from inserted i )
if(@notafinal>=14)
insert into aprobados values (@codigoEstudiante,@nombreEstudiante,@apellidoEstudiante)
else
begin
if(@notafinal>=9 and @notafinal<14)
insert into supletorio values(@codigoEstudiante,@nombreEstudiante,@apellidoEstudiante)
else 
begin 
insert into reprobados values(@codigoEstudiante,@nombreEstudiante,@apellidoEstudiante)
end
end

/*Trigger para que mediante un update se ingrese la nota del supletorio y se sume a la nota para 
ver si pasa o no*/
create trigger tr_Supletorio 
on Notas
after update 
as 
declare 
@statusAprueba char(1),
@NotaFinal decimal(4,1)
set @statusAprueba=(select n.statusAprueba from Notas n , inserted i  
where n.codigoEstudiante=i.codigoEstudiante)
set @NotaFinal=(select n.notaFinal from Notas n , inserted i
where n.codigoEstudiante=i.codigoEstudiante)
if(@statusAprueba='S')
begin
if update(notaTres)
begin 
update Notas set notaFinal=i.notaTres+@NotaFinal from Notas n , inserted i 
where n.codigoEstudiante=i.codigoEstudiante
end
end
/*Trigger actualiza el estado despues del ingresar la tecera nota del suple*/
create trigger tr_ApruebaFinal
on Notas
after update 
as 
declare 
@statusAprueba char(1),
@NotaFinal decimal(4,1),
@NotaTres decimal(4,1)
set @statusAprueba=(select n.statusAprueba from Notas n , inserted i  
where n.codigoEstudiante=i.codigoEstudiante)
set @NotaFinal=(select n.notaFinal from Notas n , inserted i
where n.codigoEstudiante=i.codigoEstudiante)
set @notaTres=(select i.notaTres from inserted i)
if(@statusAprueba='S')
begin
if update(notaTres)
begin 
if (@NotaFinal+@NotaTres>=24)
update Notas set statusAprueba='A' from Notas n , inserted i 
where n.codigoEstudiante=i.codigoEstudiante
end
end



alter trigger _trResultados
on Notas 
after insert 
as 
declare
@nroEstudiantesAprobados int ,
@nroEstudiantesSupletorio int,
@nroEstudiantesFallidos int ,
@statusEstudiante char(1)
set @nroEstudiantesAprobados=(select count(*) from aprobados)
set @nroEstudiantesSupletorio=(select count(*) from supletorio)
set @nroEstudiantesFallidos=(select count(*) from reprobados)
set @statusEstudiante=(select n.statusAprueba from Notas n , inserted i 
where n.codigoEstudiante=i.codigoEstudiante)

if not exists (select Grupo from Resultado_Especificos where Grupo='Aprobados' ) 
begin
if(@statusEstudiante='A')
begin 
insert into Resultado_Especificos values(@nroEstudiantesAprobados,'Aprobados')
end
end
else 
begin
if not exists (select Grupo from Resultado_Especificos where Grupo='Suspensos' ) and(@statusEstudiante='S')
begin 
insert into Resultado_Especificos values(@nroEstudiantesSupletorio,'Suspensos')
end
else
begin
if not exists (select Grupo from Resultado_Especificos where Grupo='Fallidos' ) and (@statusEstudiante='F')
begin
insert into Resultado_Especificos values(@nroEstudiantesFallidos,'Fallidos')
end
end
end




create trigger tr_actualizarREsultado_Especificos
on Notas 
after insert 
as 
declare
@nroEstudiantesAprobados int ,
@nroEstudiantesSupletorio int,
@nroEstudiantesFallidos int ,
@statusEstudiante char(1)
set @nroEstudiantesAprobados=(select count(*) from aprobados)
set @nroEstudiantesSupletorio=(select count(*) from supletorio)
set @nroEstudiantesFallidos=(select count(*) from reprobados)
set @statusEstudiante=(select n.statusAprueba from Notas n , inserted i 
where n.codigoEstudiante=i.codigoEstudiante)

if(@statusEstudiante='A')
begin 
update Resultado_Especificos set NroEstudiantes=@nroEstudiantesAprobados from Resultado_Especificos
 where Grupo='APROBADOS'
end
else 
begin
if(@statusEstudiante='S')
begin 
update Resultado_Especificos set NroEstudiantes=@nroEstudiantesAprobados from Resultado_Especificos
 where Grupo='SUSPENSOS'
end
else
begin
update Resultado_Especificos set NroEstudiantes=@nroEstudiantesAprobados from Resultado_Especificos
 where Grupo='FALLIDOS'
end
end

select *from Notas
select *from supletorio

insert into Estudiantes values ('E01','Arciniega','Jessica')
insert into Estudiantes values ('E02','Betancourt','Patricio')
insert into Estudiantes values ('E03','Borja','Luis')
insert into Estudiantes values ('E04','Chiliquinga','Victoria')
insert into Estudiantes values ('E05','Galarza','Solange')
insert into Estudiantes values ('E06','Granda','Hugo')
insert into Estudiantes values ('E07','Guachamin','Vinicio')
insert into Estudiantes values ('E08','Guamani','Paul')
insert into Estudiantes values ('E09','Morocho','Jefferson')
insert into Estudiantes values ('E10','Muñoz','Geovanny')
insert into Estudiantes values ('E11','Olivo','Jessica')
insert into Estudiantes values ('E12','Pacheco','Cristian')
insert into Estudiantes values ('E13','Prado','Giovanny')
insert into Estudiantes values ('E14','Sanchez','Jhon')
insert into Estudiantes values ('E15','Tapia','Jorge')


select *from Notas
insert into Notas values ('E01',8.5,9.0,default,default,default)
insert into Notas values ('E02',4.0,4.5,default,default,default)
insert into Notas values ('E03',5.0,4.0,default,default,default)
insert into Notas values ('E04',7.0,7.0,default,default,default)
insert into Notas values ('E05',4.5,6.0,default,default,default)
insert into Notas values ('E06',6.5,7.0,default,default,default)
insert into Notas values ('E07',9.0,9.0,default,default,default)
insert into Notas values ('E08',3.5,5.0,default,default,default)
insert into Notas values ('E09',4.5,5.0,default,default,default)
insert into Notas values ('E10',8.0,7.5,default,default,default)
insert into Notas values ('E11',10.0,7.5,default,default,default)
insert into Notas values ('E12',8.0,6.0,default,default,default)
insert into Notas values ('E13',10.0,5.0,default,default,default)
insert into Notas values ('E14',9.0,8.0,default,default,default)
insert into Notas values ('E15',8.0,7.5,default,default,default)

/*update para probar notas de supletorio*/
update Notas set notaTres=15 where codigoEstudiante='E03'




select *from Notas
select *from aprobados
select *from reprobados 
select *from supletorio
select *from Resultado_Especificos
select *from Estudiantes
truncate table Notas 
truncate table aprobados
truncate table reprobados
truncate table supletorio
truncate table Resultado_Especificos

select count(*) from aprobados ,reprobados,supletorio



