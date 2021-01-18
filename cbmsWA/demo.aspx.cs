using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace cbmsWA
{
    public partial class demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var rpt = new ReportDocument();
            //rpt.Load(Server.MapPath("crystalreport8.rpt"));
            //rpt.SetDatabaseLogon("sa", "Passw0rd", "D4BTMYJ2\NEDCONEWCBMS", "CustomerBilling");
            //var ds = new System.Data.DataSet();
            //System.Data.DataTable dt = ds.Tables["billrpt"];
            //rpt.SetDataSource(dt);
            //CrystalReportViewer1.ReportSource = rpt;
        }
        private void confi()
        {
            var rpt = new ReportDocument();
            rpt.Load(Server.MapPath("crystalreport8.rpt"));
            rpt.SetDatabaseLogon("sa", "Passw0rd", @"D4BTMYJ2\NEDCONEWCBMS", "CustomerBilling");
            var ds = new System.Data.DataSet();
            System.Data.DataTable dt = ds.Tables["billrpt"];
            rpt.SetDataSource(dt);
            CrystalReportViewer1.ReportSource = rpt;
        }
        protected void Page_Init(object sender, EventArgs e)
        {

            var rpt = new ReportDocument();
            rpt.Load(Server.MapPath("crystalreport8.rpt"));
            var conn = new System.Data.SqlClient.SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            var adp = new System.Data.SqlClient.SqlDataAdapter("select * from billrpt", conn);
            System.Data.DataSet dt = new System.Data.DataSet();
            adp.Fill(dt, "billrpt");
            rpt.SetDataSource(dt);
            CrystalReportViewer1.ReportSource = rpt;
        }
    }
}