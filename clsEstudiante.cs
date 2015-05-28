using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsEstudiante
/// </summary>
public class clsEstudiante
{
	
		public clsEstudiante()
    {
        this.IdEstudiante = _idEstudiante;
        this.Nombre = _nombre;
        this.Apellido = _apellido;
        this.Cedula = _cedula;
        this.Nota = _nota;
        this.Nota2 = _nota2;
        this.Nota3 = _nota3;
        this.NotaTotal = 0;
    }
    //Atributos
    private string _idEstudiante;
    private string _nombre;
    private string _apellido;
    private string _cedula;
    private double _nota;
    private double _nota2;
    private double _nota3;
    private double _notaTotal;
    private string _status;



    //Metodos set y get

    public string IdEstudiante
    {
        get { return _idEstudiante; }
        set { _idEstudiante = value; }
    }
    public double Nota2
    {
        get { return _nota2; }
        set { _nota2 = value; }
    }
    public double Nota3
    {
        get { return _nota3; }
        set { _nota3 = value; }
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
    public double NotaTotal
    {
        get { return _notaTotal; }
        set { _notaTotal = value; }
    }

    public double Suma()
    {
        double Suma;
        Suma = Nota + Nota2;
        return Suma;

    }

    public string Status1
{
  get { return _status; }
  set { _status = value; }
}


    public string Status()
    {
        
   String status;
        if ((Nota + Nota2 >= 14))
        {
            status = Convert.ToString('A');
        }
        else
        {
            if ((Nota + Nota2 >= 9 && Nota + Nota2 < 14))
            {
                status = Convert.ToString('F');
            }
            else
            {
                status = Convert.ToString('F');
            }

        }

        return status;
    }

    public double SumaSupletorio(string status)
    {
        double suma=0;
       
        if (String.Compare(status, Convert.ToString("A")) == 0)
        {
            suma = Nota + Nota2 + Nota3;
        }

        return suma;
    }

    public string ActualizarEstadoLuegoSupletorio(double suma)
    {
        String status;
        if (suma >= 24)
        {
            status = Convert.ToString('A');
        }
        else
        {
            status = Convert.ToString('F');
        }

        return status;
    }

	}
