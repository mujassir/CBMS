using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace cbmsWA
{
    public partial class CompanyWeeklyRates : System.Web.UI.Page
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
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;
            string userid = Page.User.Identity.Name;
            using (var ctx = new ModelEntities())
            {
                DateTime vdate = sdate;
                SqlConnection cn1 = null;
                cn1 = new SqlConnection(DbConnection.DbConnectionString);
                cn1.Open();

                SqlCommand cmd2 = new SqlCommand("delete WeeklyDates where Active='" + userid + "'", cn1);
                cmd2.ExecuteNonQuery();
                int days = 0;
                while (vdate <= edate)
                {
                    days += 1;
                    vdate = vdate.AddDays(1);
                    SqlCommand cmd1 = new SqlCommand("insert into WeeklyDates (DATED,Active,Days)" + " values('" + vdate + "','" + userid + "','" + days + "')", cn1);
                    cmd1.ExecuteNonQuery();
                }
                cn1.Close();
                //var companys = from s in ctx.Companies select s;
                //foreach (var company in companys)
                //{
                   int compid = int.Parse(company.Text);

                
                    var wdates = from s in ctx.WEEKLYDATES select s;
                    foreach (var daydate in wdates)
                    {
                        DateTime dates = (DateTime)daydate.DATED;
                        int xday = int.Parse(daydate.Days.ToString());

                        var currencys = from s in ctx.Currencies select s;

                        foreach (var currency in currencys)
                        {

                            string curr = currency.CurrencyId.ToString();
                            var query = (from s in ctx.BOGPucRates where s.CompanyID == compid && s.Dated <= dates && s.CurrencyId == curr select s).FirstOrDefault();
                            float rate = 0;
                            if (query == null)
                            {
                                rate = 0;
                            }
                            else
                            {
                                rate = (float)query.PurchaseRate;
                            }

                            try
                            {
                                SqlConnection cn = null;
                                cn = new SqlConnection(DbConnection.DbConnectionString);
                                cn.Open();
                                //    string sp = "[sp_BOGStockPosition]";
                                string sp = "[sp_CompUpdateWeeklyRates]";

                                SqlCommand cmd = new SqlCommand(sp, cn);
                                cmd.CommandTimeout = 0;
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@CompanyID", compid);
                                cmd.Parameters.AddWithValue("@CurrencyId", curr);
                                cmd.Parameters.AddWithValue("@PurchaseRate", rate);
                                cmd.Parameters.AddWithValue("@StartDate", sdate);
                                cmd.Parameters.AddWithValue("@EndDate", edate);
                                cmd.Parameters.AddWithValue("@Action", '1');
                                cmd.Parameters.AddWithValue("@Days", xday);
                                cmd.ExecuteNonQuery();
                                cn.Close();

                            }
                            catch (Exception ex)
                            {
                                result.Text = ex.Message;
                            }

                            result.Text = "Update Successful";

                        }
                    }
                }

           
            WeeklySalesRates();

        }

        private void WeeklySalesRates()
        {
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;
            string userid = Page.User.Identity.Name;
            using (var ctx = new ModelEntities())
            {
                DateTime vdate = sdate;
                SqlConnection cn1 = null;
                cn1 = new SqlConnection(DbConnection.DbConnectionString);
                cn1.Open();

                SqlCommand cmd2 = new SqlCommand("delete WeeklyDates where Active='" + userid + "'", cn1);
                cmd2.ExecuteNonQuery();
                int days = 0;
                while (vdate <= edate)
                {
                    days += 1;
                    vdate = vdate.AddDays(1);
                    SqlCommand cmd1 = new SqlCommand("insert into WeeklyDates (DATED,Active,Days)" + " values('" + vdate + "','" + userid + "','" + days + "')", cn1);
                    cmd1.ExecuteNonQuery();
                }
                cn1.Close();

                    int compid = int.Parse(company.Text);
                    var wdates = from s in ctx.WEEKLYDATES select s;
                    foreach (var daydate in wdates)
                    {
                        DateTime dates = (DateTime)daydate.DATED;
                        int xday = int.Parse(daydate.Days.ToString());

                        var currencys = from s in ctx.Currencies select s;

                        foreach (var currency in currencys)
                        {

                            string curr = currency.CurrencyId.ToString();
                            var query = (from s in ctx.BOGSalesRates where s.CompanyID == compid && s.Dated <= dates && s.CurrencyId == curr select s).FirstOrDefault();
                            float rate = 0;
                            if (query == null)
                            {
                                rate = 0;
                            }
                            else
                            {
                                rate = (float)query.Rate;
                            }

                            try
                            {
                                SqlConnection cn = null;
                                cn = new SqlConnection(DbConnection.DbConnectionString);
                                cn.Open();
                                //    string sp = "[sp_BOGStockPosition]";
                                string sp = "[sp_CompUpdateWeeklyRates]";

                                SqlCommand cmd = new SqlCommand(sp, cn);
                                cmd.CommandTimeout = 0;
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@CompanyID", compid);
                                cmd.Parameters.AddWithValue("@CurrencyId", curr);
                                cmd.Parameters.AddWithValue("@PurchaseRate", rate);
                                cmd.Parameters.AddWithValue("@StartDate", sdate);
                                cmd.Parameters.AddWithValue("@EndDate", edate);
                                cmd.Parameters.AddWithValue("@Action", '2');
                                cmd.Parameters.AddWithValue("@Days", xday);
                                cmd.ExecuteNonQuery();
                                cn.Close();

                            }
                            catch (Exception ex)
                            {
                                result.Text = ex.Message;
                            }

                            result.Text = "Update Successful";

                        }
                   

                }
            }
        }


    }
}