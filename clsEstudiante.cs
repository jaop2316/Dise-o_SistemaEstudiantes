using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Estudiantes_Proyecto.Entidad
{
    public class clsEstudiante
    {
        public clsEstudiante()
        {
        }
//Atributos
        private int _idEstudiante;
        private string _nombre;
        private string _apellido;
        private string _cedula;
        private double _nota;


//Metodos set y get

        public int IdEstudiante
        {
            get { return _idEstudiante; }
            set { _idEstudiante = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
 
        public string Apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }

        public string Cedula
        {
            get { return _cedula; }
            set { _cedula = value; }
        }

        public double Nota
        {
            get { return _nota; }
            set { _nota = value; }
        }


    }
}