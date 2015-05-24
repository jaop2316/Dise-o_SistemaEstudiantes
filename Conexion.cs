using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Conexion
/// </summary>
public class Conexion
{
    public SqlConnection con;
    public SqlCommand sen;
    public SqlDataReader rs;
	public Conexion()
	{
        con = new SqlConnection("Data Source =localhost;" + "Initial Catalog=ESTUDIANTES;" + "Integrated Security=True");
	}
}