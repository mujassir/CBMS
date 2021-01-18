using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace cbmsWA
{
    public class ConnClass
    {
 public SqlCommand cmd = new SqlCommand();
        public SqlDataReader dr;

        public void openConnection()
        {
            var getConnectionstring = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(getConnectionstring);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = connection();
            cmd.Parameters.Clear();
            conn.Open();
        }
        public void closeConnection()
        {
            var getConnectionstring = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(getConnectionstring);
            conn.Close();
        }
        public SqlConnection connection()
        {
            var getConnectionstring = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(getConnectionstring);
            return conn;
        }
    }
}
