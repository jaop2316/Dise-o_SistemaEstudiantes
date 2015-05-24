using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for DataAccessObject
/// </summary>
public class DataAccessObject
{
    private Conexion c;
	public DataAccessObject()
	{

        c = new Conexion();

	}

    /*Crear Este metodo es el que haria posible crear un estudiante de datos en nuestra BD* /

    public void CrearEstudiante(clsEstudiante estudiante)
    {
        String insert = "insert into Estudiantes values('" + estudiante.IdEstudiante + "','" + estudiante.Nombre + "','" + estudiante.Apellido + "')'";
        String insert2 = "insert into Notas  values('" + estudiante.IdEstudiante + "','" + estudiante.Nombre + "','" + estudiante.Apellido + "')'";
        Ejecutar(insert);
    }

    /*Leer Bases de DAtos */

    //public clsEstudiante LeerEstudiante()
    //{
       // String select = "Select *from Estudiantes";
        //Ejecutar(select);
    //}

    public void Ejecutar(String ConsultasSql)
    {
        c.con.Open();
        c.sen = new SqlCommand(ConsultasSql,c.con);
        c.sen.ExecuteNonQuery();
        c.con.Close();
    }
}