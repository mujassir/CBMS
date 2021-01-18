using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using SQL = System.Data;
//using Excel=Microsoft.CSharp.RuntimeBinder ;
using Microsoft.CSharp.RuntimeBinder;
//using Excel = Microsoft.Office.Interop.Excel;

using System.Text;
namespace cbmsWA
{
    public partial class ExcelAuto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    string conString = "your connection string";
        //    StringBuilder query = new StringBuilder();
        //    query.Append("SELECT Categories.CategoryName ");
        //    query.Append(",[ProductID], [ProductName], [SupplierID] ");
        //    query.Append(",[QuantityPerUnit], [UnitPrice], [UnitsInStock] ");
        //    query.Append(",[UnitsOnOrder], [ReorderLevel], [Discontinued] ");
        //    query.Append("FROM [northwind].[dbo].[Products] ");
        //    query.Append("JOIN Categories ON Categories.CategoryID = Products.CategoryID ");
        //    query.Append("ORDER BY Categories.CategoryName ");

        //    SQL.DataTable dtProducts = new SQL.DataTable();
        //    using (SqlConnection cn = new SqlConnection(conString))
        //    {
        //        using (SqlDataAdapter da = new SqlDataAdapter(query.ToString(), cn))
        //        {
        //            da.Fill(dtProducts);
        //            Excel.Application oXL;
        //            Excel._Workbook oWB;
        //            Excel._Worksheet oSheet;

        //            oXL = new Excel.Application();
        //            oXL.Visible = true;

        //            oWB = (Excel._Workbook)(oXL.Workbooks.Add(Missing.Value));
        //           oSheet = (Excel._Worksheet)oWB.ActiveSheet;
        //        }
        //    }
        }


    }
}