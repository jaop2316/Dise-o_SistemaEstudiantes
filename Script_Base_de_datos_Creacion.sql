
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
notaUno int check(notaUno > 0 and notaUno <=10),
notaDos int check(notaDos > 0 and notaDos <=10),
notaTres int check(notaTres > 0 and notaTres <=10),
notaFinal int check(notaFinal > 0 and notaFinal <=10),
notaUno dec(2,1),
notaDos dec(2,1),
notaTres dec(2,1) default (null),
notaFinal dec(3,1),
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
insert into Notas values ('E01',8,9,8,8,default)
insert into Notas values ('E02',4,8,6,6,default)
insert into Notas values ('E03',9,10,9,9,default)
insert into Notas values ('E04',7,7,7,7,default)
insert into Notas values ('E05',10,8,6,8,default)
insert into Notas values ('E06',6,7,8,7,default)
insert into Notas values ('E07',9,9,8,9,default)
insert into Notas values ('E08',3,10,6,6,default)
insert into Notas values ('E09',4,7,5,5,default)
insert into Notas values ('E10',8,10,9,9,default)
insert into Notas values ('E11',10,8,7,8,default)
insert into Notas values ('E12',8,6,8,7,default)
insert into Notas values ('E13',10,5,7,7,default)
insert into Notas values ('E14',9,8,9,9,default)
insert into Notas values ('E15',5,7,4,5,default)
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
