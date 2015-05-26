
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
notaUno dec(2,1),
notaDos dec(2,1),
notaTres dec(2,1) default (null),
notaFinal dec(3,1),
statusAprueba char(1) default (null),
FOREIGN KEY(codigoEstudiante) REFERENCES Estudiantes (codigoEstudiante)
)

select *from Estudiantes

insert into Estudiantes values ('E01','Arellano','Patricia')
insert into Estudiantes values ('E02','Castro','Alejandra')
insert into Estudiantes values ('E03','Cortez','Gabriel')
insert into Estudiantes values ('E04','Gavilanes','Carlos')
insert into Estudiantes values ('E05','Guevara','Veronica')
insert into Estudiantes values ('E06','Lara','Francisco')
insert into Estudiantes values ('E07','Lozada','Silvia')
insert into Estudiantes values ('E08','Novoa','Guillermo')
insert into Estudiantes values ('E09','Rivera','Carolina')
insert into Estudiantes values ('E10','Salazar','Manuel')


select *from Notas
insert into Notas values ('E01',8.5,9.0,default,17.5,´default')
insert into Notas values ('E02',4.0,4.5,default,8.5,'default')
insert into Notas values ('E03',5.0,4.0,default,9.0,'default')
insert into Notas values ('E04',7.0,7.0,default,14.0,'default')
insert into Notas values ('E05',4.5,6.0,default,10.5,'default')
insert into Notas values ('E06',6.5,7.0,default,13.5,'default')
insert into Notas values ('E07',9.0,9.0,default,18.0,'default')
insert into Notas values ('E08',3.5,5.0,default,8.5,'default')
insert into Notas values ('E09',4.5,5.0,default,9.5,'default')
insert into Notas values ('E10',8.0,7.5,default,8.75,'default')
