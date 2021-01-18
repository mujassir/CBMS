using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
//using CbmsLib;
using System.Drawing;

namespace cbmsWA
{
    public partial class SearchCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               string formID = Request.QueryString["c"];
               formid.Text = formID;
                
                area.Text = GetAreaId();
                int areaid = int.Parse(area.Text);
                if (formid.Text == "")
                {
                   // bclose.Visible = false;
                    formid.Text = "~/Default.aspx";
                }
            }
        }

                public string GetAreaId()
        {

            using (var ctx = new ModelEntities())
            {
                var query = ctx.UserDetails.Where(u => u.UserName == Page.User.Identity.Name).FirstOrDefault();
                return query.AreaID.ToString();
            }
        }
                public string GetStationId()
                {

                    using (var ctx = new ModelEntities())
                    {
                        var query = ctx.UserDetails.Where(u => u.UserName == Page.User.Identity.Name).FirstOrDefault();
                        return query.StationID.ToString();
                    }
                }
        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
                   // int areaid = int.Parse(area.Text);
            int areaid = int.Parse(GetStationId());
            SqlConnection cn = null;
            try
            {
                if (!string.IsNullOrEmpty(areaid.ToString()))
                {
         
                    cn = new SqlConnection(DbConnection.DbConnectionString);
                    cn.Open();
                    string sql = "SELECT * FROM [QueryCustomers] WHERE ([StationID] = @stationid)";
                    SqlCommand cmd = new SqlCommand(sql, cn);

                    cmd.Parameters.AddWithValue("@stationid", areaid);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    grid.DataSource = ds.Tables[0];
                }

            }
            catch (Exception ex)
            {
                result.Text = ex.GetBaseException().Message;
            }
            finally
            {
                cn.Close();
            }

        }

        protected void bclose_Click(object sender, EventArgs e)
        {
          //  Page.Dispose();
            string urlName = Request.UrlReferrer.ToString();
            urlName = Request.Url.ToString();

           // string ab = Page.Parent.NamingContainer.ToString();
           // Response.Redirect("~/MeterReading/MeterReadingForm.aspx");
            if (formid.Text != "")
            {
                Response.Redirect(formid.Text);
            }
            else
            {
                Response.Redirect(formid.Text);
            }
                

        }

        protected void btnref_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerRefernce.aspx");
        }
     }
}