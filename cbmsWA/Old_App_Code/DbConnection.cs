using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for DbConnection
/// </summary>
/// 
namespace cbmsWA
{


    public static class DbConnection
    {

        // Caches the connection string
        private static string dbConnectionString;
        // Caches the data provider name 
        private static string dbProviderName;
        static DbConnection()
        {
            dbConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        }
        public static string DbConnectionString
        {
            get
            {
                return dbConnectionString;
            }
        }

        // Returns the data provider name
        public static string DbProviderName
        {
            get
            {
                return dbProviderName;
            }
        }
    }



}