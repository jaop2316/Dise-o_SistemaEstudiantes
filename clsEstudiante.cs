using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsEstudiante
/// </summary>
public class clsEstudiante
{
    public clsEstudiante(string idEstudiante, string nombre, string apellido, string cedula, double nota1, double nota2, double nota3)
    {
        this.IdEstudiante = idEstudiante;
        this.Nombre = nombre;
        this.Apellido = apellido;
        this.Cedula = cedula;
        this.Nota = nota1;
        this.Nota2 = nota2;
        this.Nota3 = nota3;
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


}
