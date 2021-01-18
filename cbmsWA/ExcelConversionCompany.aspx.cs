using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;





namespace cbmsWA
{
    public partial class ExcelConversionCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                userid.Text = Page.User.Identity.Name;
                using (var ctx = new ModelEntities())
                {
                    var query = ctx.UserDetails.Where(u => u.UserName == userid.Text).FirstOrDefault();
                    bureau.Text = query.BureauID.ToString();
                    int buro = int.Parse(bureau.Text);
                    var bureu = ctx.Bureaus.Where(p => p.BureauID == buro).FirstOrDefault();
                    company.Text = bureu.CompanyID.ToString();

                }

            }
        }
        SqlConnection x;
        SqlCommand y1;
        DataTable dt;
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = null;
            cn1 = new SqlConnection(DbConnection.DbConnectionString);
            cn1.Open();

            SqlCommand cmd2 = new SqlCommand("delete WeeklyDates where Active='" + userid + "'", cn1);
            cmd2.ExecuteNonQuery();


            //  x = new SqlConnection(@ "Data Source=.;Initial Catalog=test;User ID=sa;Password=password@123");
            SqlConnection x = null;
            x = new SqlConnection(DbConnection.DbConnectionString);
            x.Open();
            y1 = new SqlCommand();
            y1.Connection = x;
            y1.CommandText = "[sp_displyStocksComp]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            x.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (GridView1.Visible)
            {
                Response.AddHeader("content-disposition", "attachment; filename=CompStockPosition.xls");
                Response.ContentType = "application/excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hTextWriter = new HtmlTextWriter(sWriter);
                GridView1.RenderControl(hTextWriter);
                Response.Write(sWriter.ToString());
                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void btngen_Click(object sender, EventArgs e)
        {

        }
        //BOG Weekly Rates
        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = null;
            cn1 = new SqlConnection(DbConnection.DbConnectionString);
            cn1.Open();

            //          SqlCommand cmd2 = new SqlCommand("delete WeeklyDates where Active='" + userid + "'", cn1);
            //          cmd2.ExecuteNonQuery();
            //          x = new SqlConnection(@ "Data Source=.;Initial Catalog=test;User ID=sa;Password=password@123");

            SqlConnection x = null;
            x = new SqlConnection(DbConnection.DbConnectionString);
            x.Open();
            y1 = new SqlCommand();
            y1.Connection = x;
            y1.CommandText = "[sp_displCompWeeklyRAtes]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            x.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.Visible)
            {
                Response.AddHeader("content-disposition", "attachment; filename=CompWeeklyRates.xls");
                Response.ContentType = "application/excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hTextWriter = new HtmlTextWriter(sWriter);
                GridView1.RenderControl(hTextWriter);
                Response.Write(sWriter.ToString());
                Response.End();
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = null;
            cn1 = new SqlConnection(DbConnection.DbConnectionString);
            cn1.Open();

            SqlConnection x = null;
            x = new SqlConnection(DbConnection.DbConnectionString);
            x.Open();
            y1 = new SqlCommand();
            y1.Connection = x;
            y1.CommandText = "[sp_displPurchaseSalesComp]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            x.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (GridView1.Visible)
            {
                Response.AddHeader("content-disposition", "attachment; filename=CompPurSales.xls");
                Response.ContentType = "application/excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hTextWriter = new HtmlTextWriter(sWriter);
                GridView1.RenderControl(hTextWriter);
                Response.Write(sWriter.ToString());
                Response.End();
            }
        }
    }
}