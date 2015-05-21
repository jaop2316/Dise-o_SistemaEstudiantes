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

        private int _idEstudiante;

        public int IdEstudiante
        {
            get { return _idEstudiante; }
            set { _idEstudiante = value; }
        }
        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        private string _apellido;

        public string Apellido
        {
            get { return _apellido; }
            set { _apellido = value; }
        }
        private string _cedula;

        public string Cedula
        {
            get { return _cedula; }
            set { _cedula = value; }
        }


    }
}