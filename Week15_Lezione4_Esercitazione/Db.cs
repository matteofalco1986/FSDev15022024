using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Week15_Lezione4_Esercitazione
{
    public class Db
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["DbConcessionariaConnection"].ToString();
        public static SqlConnection conn = new SqlConnection(connectionString);
    }
}