using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Http;
using System.Text;

namespace cbmsWA
{
    public partial class ExcelConvertion : System.Web.UI.Page
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
        //private void ExcelConvert()
        //{
        //    using (ExcelEngine excelEngine = new ExcelEngine())
        //    {
        //        IApplication application = excelEngine.Excel;
        //        application.DefaultVersion = ExcelVersion.Excel2016;
        //        //Create a new workbook
        //        IWorkbook workbook = application.Workbooks.Create(1);
        //        IWorksheet sheet = workbook.Worksheets[0];

        //        if (sheet.ListObjects.Count == 0)
        //        {
        //            //Estabilishing the connection in the worksheet
        //            string dBPath = Path.GetFullPath(@"../../Data/EmployeeData.mdb");
        //            string ConnectionString = "OLEDB;Provider=Microsoft.JET.OLEDB.4.0;Password=\"\";User ID=Admin;Data Source=" + dBPath;
        //            string query = "SELECT EmployeeID,FirstName,LastName,Title,HireDate,Extension,ReportsTo FROM [Employees]";
        //            IConnection Connection = workbook.Connections.Add("Connection1", "Sample connection with MsAccess", ConnectionString, query, ExcelCommandType.Sql);
        //            sheet.ListObjects.AddEx(ExcelListObjectSourceType.SrcQuery, Connection, sheet.Range["A1"]);
        //        }

        //        //Refresh Excel table to get updated values from database
        //        sheet.ListObjects[0].Refresh();

        //        sheet.UsedRange.AutofitColumns();

        //        //Save the file in the given path
        //        Stream excelStream = File.Create(Path.GetFullPath(@"Output.xlsx"));
        //        workbook.SaveAs(excelStream);
        //        excelStream.Dispose();
        //    }

        //}




        //namespace WebApplication44
        //    {
        //        public partial class WebForm1 : System.Web.UI.Page
        //        {
        //            protected void Page_Load(object sender, EventArgs e)
        //            {

        //            }
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
            y1.CommandText = "[sp_displyStocks]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            x.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            SendAPIRequest(GridView1, "CompStockPosition.xls");
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
            y1.CommandText = "[sp_displBOGWeeklyRAtes]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            x.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            SendAPIRequest(GridView1, "CompWeeklyRates.xls");

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
            y1.CommandText = "[sp_displPurchaseSalesBOG]";

            y1.CommandType = CommandType.StoredProcedure;
            y1.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
            SqlDataAdapter y = new SqlDataAdapter(y1);

            dt = new DataTable();
            y.Fill(dt);
            x.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
            SendAPIRequest(GridView1, "CompPurSales.xls");
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

        protected void SaveExcelFile(GridView GridView1, string fileName)
        {
            MemoryStream stream = new MemoryStream();
            //using (StreamWriter sw = new StreamWriter(Server.MapPath("temp\\" + fileName)))
            using (StreamWriter sw = new StreamWriter(stream))
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    GridView1.RenderControl(hw);
                }
            }

        }
        protected void SendAPIRequest(GridView GridView1, string fileName)
        {
            string baseUrl = "https://orassvas.bog.gov.gh:7002/";
            string revisionId = "2";
            string returnTypeId = "0ab99033-f1cd-4e19-b425-88ed467b2a0f";
            string version = "1";
            bool clearData = true;

            MemoryStream stream = new MemoryStream();
            using (StreamWriter sw = new StreamWriter(stream))
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    GridView1.RenderControl(hw);
                }
            }
            string apiURL = baseUrl + "v" + version + "/returns/" + revisionId + "/submit/" + returnTypeId + "/upload/" + clearData;

            //string apiURL = "https://orassvas.bog.gov.gh:7002/v1/returns/2/submit/0ab99033-f1cd-4e19-b425-88ed467b2a0f/upload/false";
            HttpClient httpClient = new HttpClient();
            MultipartFormDataContent form = new MultipartFormDataContent();
            var file_bytes = stream.GetBuffer();
            form.Add(new ByteArrayContent(file_bytes, 0, file_bytes.Length), Path.GetFileNameWithoutExtension(fileName), fileName);
            try
            {
                HttpResponseMessage response = httpClient.PostAsync(apiURL, form).Result;
                response.EnsureSuccessStatusCode();

            }
            catch (Exception ex)
            {
            }
            httpClient.Dispose();

        }
    }
}


