using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


public class Conexion 
{
    clsEstudiante Estudiante;
    public SqlConnection con;
    public SqlCommand sen;
    public SqlDataReader rs;
	public Conexion()
	{
        con = new SqlConnection("Data Source=CLARO_PC;Initial Catalog=ESTUDIANTES;Integrated Security=True");
	}

    public void BDDIngresaEstudiantes(String id, String n, String a)
    {
        Estudiante.IdEstudiante = id;
        Estudiante.Nombre = n;
        Estudiante.Apellido = a;

        String comando = "insert into ESTUDIANTES values(@codigo,@nombre,@apellido)";
        SqlCommand cmd = new SqlCommand(comando, con);

        con.Open();

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@codigo", SqlDbType.Char, 3).Value = Convert.ToChar(id);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = Convert.ToChar(n);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = Convert.ToChar(a);

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BDDIngresaNotas(String codigoEstudiante ,double n1 , double n2)
    {
        Estudiante.Nota = n1;
        Estudiante.Nota2 = n2;

        Estudiante.Suma();

        String comando = "insert into Notas values(@codigo,@nota1,@nota2,default,default,default)";
        SqlCommand cmd = new SqlCommand(comando, con);
        con.Open();

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@codigo", SqlDbType.Char, 3).Value = Convert.ToChar(codigoEstudiante);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@nota1", SqlDbType.Decimal, 3).Value = Convert.ToDecimal(n1);
        cmd.Parameters["@nota1"].Precision = 3;
        cmd.Parameters["@nota1"].Scale = 1;
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@nota2", SqlDbType.Decimal, 3).Value = Convert.ToDecimal(n2);
        cmd.Parameters["@nota2"].Precision = 3;
        cmd.Parameters["@nota2"].Scale = 1;

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void BDDIngresaSupletorio(String cod,double nota3)
    {
        Estudiante.Nota3 = nota3;
        Estudiante.IdEstudiante = cod;

        String comando = "update Notas set notaTres=@nota3 where codigoEstudiante = @codEst";
        SqlCommand cmd = new SqlCommand(comando, con);
        con.Open();

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add("@codEst", SqlDbType.Char, 3).Value = Convert.ToChar(cod);
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.Add("@nota3", SqlDbType.Decimal, 3).Value = Convert.ToDecimal(nota3);
        cmd.Parameters["@nota3"].Precision = 3;
        cmd.Parameters["@nota3"].Scale = 1;

        cmd.ExecuteNonQuery();
        con.Close();
    }




}
