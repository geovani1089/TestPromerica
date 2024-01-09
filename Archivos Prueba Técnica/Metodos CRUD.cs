using System;
using System.Data;
using System.Data.SqlClient;
public class DatosCRUD
{
private string connectionString;
public DatosCRUD(string connectionString)
{
this.connectionString = connectionString;
}
public DataSet EjecutarConsulta(string query)
{
using (SqlConnection connection = new SqlConnection(connectionString))
{
using (SqlCommand command = new SqlCommand(query, connection))
{
using (SqlDataAdapter adapter = new SqlDataAdapter(command))
{
DataSet dataSet = new DataSet();
adapter.Fill(dataSet);
return dataSet;
}
}
}
}
public int ContarFilasAfectadas(string query)
{
using (SqlConnection connection = new SqlConnection(connectionString))
{
connection.Open();
using (SqlCommand command = new SqlCommand(query, connection))
{
return command.ContarFilasAfectadas();
}
}
}
public int ContarFilasRespuesta(string query)
{
using (SqlConnection connection = new SqlConnection(connectionString))
{
using (SqlCommand command = new SqlCommand(query, connection))
{
connection.Open();
using (SqlDataReader reader = command.ExecuteReader())
{
int count = 0;
while (reader.Read())
{
count++;
}
return count;
}
}
}
}
}