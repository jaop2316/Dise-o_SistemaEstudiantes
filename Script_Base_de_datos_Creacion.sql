
create database ESTUDIANTES
go

use ESTUDIANTES
go

create table Estudiantes(
codigoEstudiante char(3) PRIMARY KEY,
nombreEstudiante varchar(50),
apellidoEstudiante varchar(50)
)

create table Notas(
codigoEstudiante char(3) PRIMARY KEY,
notaUno dec(2,1),
notaDos dec(2,1),
notaFinal dec(2,1),
FOREIGN KEY(codigoEstudiante) REFERENCES Estudiantes (codigoEstudiante)
)
