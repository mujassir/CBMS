using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
namespace cbmsWA
{
    public partial class SalesPurchases : System.Web.UI.Page
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

        protected void btngen_Click(object sender, EventArgs e)
        {
            try
            {


                SqlConnection cn = null;
                cn = new SqlConnection(DbConnection.DbConnectionString);
                cn.Open();
                string sp = "sp_BOGPurchasesSales";
                SqlCommand cmd = new SqlCommand(sp, cn);
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CompanyID", int.Parse(company.Text));
                cmd.Parameters.AddWithValue("@BureauID", int.Parse(bureau.Text));
                cmd.Parameters.AddWithValue("@UserName", userid.Text);
                cmd.Parameters.AddWithValue("@StartDate", startDate.SelectedDate);
                cmd.Parameters.AddWithValue("@endDate", endDate.SelectedDate);
                cmd.ExecuteNonQuery();
                cn.Close();
                result.ForeColor = System.Drawing.Color.Green;
                result.Text = "Report Data Generated Successfully";
            }
            catch(Exception  ex)
            {
              result.Text=  ex.Message;

            }
        }
    }
}