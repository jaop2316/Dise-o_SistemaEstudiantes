
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
notaUno dec(2,1) check(notaUno > 0 and notaUno <=10),
notaDos dec(2,1) check(notaDos > 0 and notaDos <=10),
notaTres dec(2,1) default(null) check(notaTres > 0 and notaTres <=10),
notaFinal dec(2,1) check(notaFinal > 0 and notaFinal <=20),
statusAprueba char(1) default (null),
FOREIGN KEY(codigoEstudiante) REFERENCES Estudiantes (codigoEstudiante)
)

select *from Estudiantes

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

insert into Notas values ('E01',8.5,9.0,default,17.5,default)
insert into Notas values ('E02',4.0,4.5,default,8.5,default)
insert into Notas values ('E03',5.0,4.0,default,9.0,default)
insert into Notas values ('E04',7.0,7.0,default,14.0,default)
insert into Notas values ('E05',4.5,6.0,default,10.5,default)
insert into Notas values ('E06',6.5,7.0,default,13.5,default)
insert into Notas values ('E07',9.0,9.0,default,18.0,default)
insert into Notas values ('E08',3.5,5.0,default,8.5,default)
insert into Notas values ('E09',4.5,5.0,default,9.5,default)
insert into Notas values ('E10',8.0,7.5,default,8.75,default)
