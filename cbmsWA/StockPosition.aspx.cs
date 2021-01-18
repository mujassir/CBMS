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
    public partial class StockPosition : System.Web.UI.Page
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
            char action1 = '1'; //sales
            char action5 = '5'; //sales

            GetPurchases(action1);
            InsertPurchases(action1);
            GetPurchases(action5);
            InsertPurchases(action5);

            char action2 = '2'; //sales
            char action4 = '4'; //lodgement,Expenses,Derectors cash withdrawal
            GetSales(action2);
            InsertSales(action2);
            GetSales(action4);
            InsertSales(action4);
            ClosingRates();

            //(Transtype=2 or Transtype=3 or transtype=4 or Transtype=7)
            //action = "1";
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;

            using (var ctx = new ModelEntities())
            {
                var companys = from s in ctx.Companies select s;
                foreach (var company in companys)
                {
                    int compid = company.CompanyID;


                    //     select top 1 openningbalance from qryopenningBal where companyid = 1 and dated<'2020-11-26' and currencyid = 'CAD' order by dated desc
                    var currencys = from s in ctx.Currencies select s;
                    foreach (var currency in currencys)
                    {
                      
                        string curr = currency.CurrencyId.ToString();
                        var query = (from s in ctx.qryopenningBals where s.CompanyID == compid && s.Dated < sdate && s.CurrencyID == curr  select s).FirstOrDefault();
                        float amnt = 0;
                        if (query == null)
                        {
                            amnt = 0;
                        }
                        else
                        {
                            amnt = (float)query.Openningbalance;
                        }
                       
                        try
                        {
                            SqlConnection cn = null;
                            cn = new SqlConnection(DbConnection.DbConnectionString);
                            cn.Open();
                        //    string sp = "[sp_BOGStockPosition]";
                            string sp = "[sp_BOGOpenningBalance]";

                            SqlCommand cmd = new SqlCommand(sp, cn);
                            cmd.CommandTimeout = 0;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@CompanyID", compid);
                            cmd.Parameters.AddWithValue("@CurrencyId", curr);
                            cmd.Parameters.AddWithValue("@Openningbalance", amnt);
                            cmd.Parameters.AddWithValue("@StartDate", sdate);
                            cmd.Parameters.AddWithValue("@EndDate", edate);
                            cmd.ExecuteNonQuery();
                            cn.Close();

                        }
                        catch (Exception ex)
                        {
                            result.Text = ex.Message;
                        }
                        result.ForeColor = System.Drawing.Color.Green;
                        result.Text = "Update Successful";

                    }
                }
                
            }
            SumUp();

        }

   protected void GetPurchases(Char action)
         {
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;
           
            using (var ctx=new ModelEntities())
            {

                try
                {
                    SqlConnection cn = null;
                    cn = new SqlConnection(DbConnection.DbConnectionString);
                    cn.Open();
                    string sp = "[sp_BOGGetPurchases]";
                    SqlCommand cmd = new SqlCommand(sp, cn);
                    cmd.CommandTimeout = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", sdate);
                    cmd.Parameters.AddWithValue("@EndDate", edate);
                    cmd.Parameters.AddWithValue("@Active", userid.Text);
                    cmd.Parameters.AddWithValue("@Action", action);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
                catch (Exception ex)
                {
                    result.Text = ex.Message;
                }
            }
        }
        protected void GetSales(char action)
        {
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;

            using (var ctx = new ModelEntities())
            {

                try
                {
                    SqlConnection cn = null;
                    cn = new SqlConnection(DbConnection.DbConnectionString);
                    cn.Open();
                    string sp = "[sp_BOGGetSales]";
                    SqlCommand cmd = new SqlCommand(sp, cn);
                    cmd.CommandTimeout = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", sdate);
                    cmd.Parameters.AddWithValue("@EndDate", edate);
                    cmd.Parameters.AddWithValue("@Active", userid.Text);
                    cmd.Parameters.AddWithValue("@Action", action);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                   
                }
                catch (Exception ex)
                {
                    result.Text = ex.Message;
                }
          
            }
        }
        protected void InsertPurchases(char action)
        {
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;
            using(var ctx=new ModelEntities())
            {
                try
                {

                  var sales = from s in ctx.StockPurSums where s.Active == userid.Text select s;
                foreach (var sale in sales)
                   {
                    float sums = (float)sale.SumPurhases;
                    int compid = int.Parse(sale.CompanyID.ToString());
                    string curr = sale.CurrencyID;
                    SqlConnection cn = null;
                    cn = new SqlConnection(DbConnection.DbConnectionString);
                    cn.Open();
                    string sp = "[sp_BOGApplyPurchases]";
                    SqlCommand cmd = new SqlCommand(sp, cn);
                    cmd.CommandTimeout = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", sdate);
                    cmd.Parameters.AddWithValue("@EndDate", edate);
                    cmd.Parameters.AddWithValue("@SumSales", sums);
                    cmd.Parameters.AddWithValue("@CompanyID", int.Parse(sale.CompanyID.ToString()));
                    cmd.Parameters.AddWithValue("@CurrencyID", sale.CurrencyID);
                    cmd.Parameters.AddWithValue("@Action", action);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
                }
                catch (Exception ex)
                {
                    result.Text = ex.Message;
                }
            }
        }
        protected void InsertSales(char action)
        {
            DateTime sdate = (DateTime)startDate.SelectedDate;
            DateTime edate = (DateTime)endDate.SelectedDate;
            using (var ctx = new ModelEntities())
            {
                try
                {
                    var sales = from s in ctx.StockSaleSums where s.Active == userid.Text select s;
                    foreach (var sale in sales)
                    {
                        float sums = (float)sale.SumSales;
                        int compid = int.Parse(sale.CompanyID.ToString());
                        string curr = sale.CurrencyID;
                        SqlConnection cn = null;
                        cn = new SqlConnection(DbConnection.DbConnectionString);
                        cn.Open();
                        string sp = "[sp_BOGApplySales]";
                        SqlCommand cmd = new SqlCommand(sp, cn);
                        cmd.CommandTimeout = 0;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@StartDate", sdate);
                        cmd.Parameters.AddWithValue("@EndDate", edate);
                        cmd.Parameters.AddWithValue("@SumSales", sums);
                        cmd.Parameters.AddWithValue("@CompanyID", int.Parse(sale.CompanyID.ToString()));
                        cmd.Parameters.AddWithValue("@CurrencyID", sale.CurrencyID);
                        cmd.Parameters.AddWithValue("@Action", action);
                        cmd.ExecuteNonQuery();
                        cn.Close();
                    }
                }

                catch (Exception ex)
                {
                    result.Text = ex.Message;
                }
            }
        }
        private void SumUp()
        {
        using(var ctx=new ModelEntities())
            {
              try
                {
                    var comps = from s in ctx.Companies select s;
                foreach(var company in comps)
                {
                    DateTime sdate = (DateTime)startDate.SelectedDate;
                    DateTime edate = (DateTime)endDate.SelectedDate;
                    int compid = company.CompanyID;
                    var query = (from s in ctx.BOGStockPositions where s.CompanyID == compid && s.ORDERBY == 1 select s).FirstOrDefault();
                    float usd1 = (float)query.USD;
                    float gbp1 = (float)query.GBP;
                    float zar1 = (float)query.ZAR;
                    float eur1 = (float)query.EUR;
                    float ngn1 = (float)query.NGN;
                    float jpy1 = (float)query.JPY;
                    float cad1 = (float)query.CAD;
                    float cny1 = (float)query.CNY;
                    float xof1 = (float)query.XOF;
                    float chf1 = (float)query.CHF;
                    var query3 = (from s in ctx.BOGStockPositions where s.CompanyID == compid && s.ORDERBY == 3 select s).FirstOrDefault();
                    float usd3 = (float)query3.USD;
                    float gbp3 = (float)query3.GBP;
                    float zar3 = (float)query3.ZAR;
                    float eur3 = (float)query3.EUR;
                    float ngn3 = (float)query3.NGN;
                    float jpy3 = (float)query3.JPY;
                    float cad3 = (float)query3.CAD;
                    float cny3 = (float)query3.CNY;
                    float xof3 = (float)query3.XOF;
                    float chf3 = (float)query3.CHF;
                        //                var query4 = (from s in ctx.BOGStockPositions where s.CompanyID == compid && s.ORDERBY == 1 select s).FirstOrDefault();
                        float usd31 = usd3 + usd1;
                        float gbp31 = gbp3 + gbp1;
                        float zar31 = zar3 + zar1;
                        float eur31 = eur3 + eur1;
                        float ngn31 = ngn3 + ngn1;
                        float jpy31 = jpy3 + jpy1;
                        float cad31 = cad3 + cad1;
                        float cny31 = cny3 + cny1;
                        float xof31 = xof3 + xof1;
                        float chf31 = chf3 + chf1;


                    //Sales sum up
                    var query5 = (from s in ctx.BOGStockPositions where s.CompanyID == compid && s.ORDERBY == 7 select s).FirstOrDefault();
                    float usd5 = (float)query5.USD;
                    float gbp5 = (float)query5.GBP;
                    float zar5 = (float)query5.ZAR;
                    float eur5 = (float)query5.EUR;
                    float ngn5 = (float)query5.NGN;
                    float jpy5 = (float)query5.JPY;
                    float cad5 = (float)query5.CAD;
                    float cny5 = (float)query5.CNY;
                    float xof5 = (float)query5.XOF;
                    float chf5 = (float)query5.CHF;
                    var query7 = (from s in ctx.BOGStockPositions where s.CompanyID == compid && s.ORDERBY == 8 select s).FirstOrDefault();
                    float usd7 = (float)query7.USD;
                    float gbp7 = (float)query7.GBP;
                    float zar7 = (float)query7.ZAR;
                    float eur7 = (float)query7.EUR;
                    float ngn7 = (float)query7.NGN;
                    float jpy7 = (float)query7.JPY;
                    float cad7 = (float)query7.CAD;
                    float cny7 = (float)query7.CNY;
                    float xof7 = (float)query7.XOF;
                    float chf7 = (float)query7.CHF;
  
                        float usd71 = usd7 + usd5;
                        float gbp71 = gbp7 + gbp5;
                        float zar71 = zar7 + zar5;
                        float eur71 = eur7 + eur5;
                        float ngn71 = ngn7 + ngn5;
                        float jpy71 = jpy7 + jpy5;
                        float cad71 = cad7 + cad5;
                        float cny71 = cny7 + cny5;
                        float xof71 = xof7 + xof5;
                        float chf71 = chf7 + chf5;
                    //tOTALS
                    float usd10 = usd31 - usd71;
                    float gbp10 = gbp31 - gbp71;
                    float zar10 = zar31 - zar71;
                    float eur10 = eur31 - eur71;
                    float ngn10 = ngn31 - ngn71;
                    float jpy10 = jpy31 - jpy71;
                    float cad10 = cad31 - cad71;
                    float cny10 = cny31 - cny71;
                    float xof10 = xof31 - xof71;
                    float chf10 = chf31 - chf71;



                    SqlConnection cn = null;
                    cn = new SqlConnection(DbConnection.DbConnectionString);
                    cn.Open();
                    string sp = "[sp_BOGUpdateBalances]";
                    SqlCommand cmd = new SqlCommand(sp, cn);
                    cmd.CommandTimeout = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", sdate);
                    cmd.Parameters.AddWithValue("@EndDate", edate);
                    cmd.Parameters.AddWithValue("@CompanyID", compid);
                    cmd.Parameters.AddWithValue("@USD71", usd71);
                    cmd.Parameters.AddWithValue("@GBP71", gbp71); 
                    cmd.Parameters.AddWithValue("@ZAR71", zar71);
                    cmd.Parameters.AddWithValue("@EUR71", eur71);
                    cmd.Parameters.AddWithValue("@NGN71", ngn71);
                    cmd.Parameters.AddWithValue("@JPY71", jpy71);
                    cmd.Parameters.AddWithValue("@CAD71", cad71);
                    cmd.Parameters.AddWithValue("@CNY71", cny71);
                    cmd.Parameters.AddWithValue("@XOF71", xof71);
                    cmd.Parameters.AddWithValue("@CHF71", chf71);

                    cmd.Parameters.AddWithValue("@USD31", usd31);
                    cmd.Parameters.AddWithValue("@GBP31", gbp31);
                    cmd.Parameters.AddWithValue("@ZAR31", zar31);
                    cmd.Parameters.AddWithValue("@EUR31", eur31);
                    cmd.Parameters.AddWithValue("@NGN31", ngn31);
                    cmd.Parameters.AddWithValue("@JPY31", jpy31);
                    cmd.Parameters.AddWithValue("@CAD31", cad31);
                    cmd.Parameters.AddWithValue("@CNY31", cny31);
                    cmd.Parameters.AddWithValue("@XOF31", xof31);
                    cmd.Parameters.AddWithValue("@CHF31", chf31);

                    cmd.Parameters.AddWithValue("@USD10", usd10);
                    cmd.Parameters.AddWithValue("@GBP10", gbp10);
                    cmd.Parameters.AddWithValue("@ZAR10", zar10);
                    cmd.Parameters.AddWithValue("@EUR10", eur10);
                    cmd.Parameters.AddWithValue("@NGN10", ngn10);
                    cmd.Parameters.AddWithValue("@JPY10", jpy10);
                    cmd.Parameters.AddWithValue("@CAD10", cad10);
                    cmd.Parameters.AddWithValue("@CNY10", cny10);
                    cmd.Parameters.AddWithValue("@XOF10", xof10);
                    cmd.Parameters.AddWithValue("@CHF10", chf10);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
                catch (Exception ex)
            {
                result.Text = ex.Message;
            }
        }
        }

        private void ClosingRates()
        {
        using(var ctx=new ModelEntities())
            {
                try 
                { 
                var comps = from s in ctx.Companies select s;
                foreach (var company in comps)
                {
                    DateTime sdate = (DateTime)startDate.SelectedDate;
                    DateTime edate = (DateTime)endDate.SelectedDate;
                    int compid = company.CompanyID;
                    foreach (var currid in ctx.Currencies)
                    {
                        string currencyid = currid.CurrencyId;
                        var purrate = (from s in ctx.PurchasesDTimes where s.Dated <= edate && s.CurrencyId == currencyid select s).FirstOrDefault();
                        float prate = 0;
                        float srate = 0;

                        if (purrate != null)
                        {
                             prate = (float)purrate.PurchaseRate;

                        }
                        var salerate = (from s in ctx.SalesDTimes where s.Dated <= edate && s.CurrencyId == currencyid select s).FirstOrDefault();
                        if (salerate != null)
                        {
                             srate = (float)salerate.Rate;

                        }

                        SqlConnection cn = null;
                        cn = new SqlConnection(DbConnection.DbConnectionString);
                        cn.Open();
                        string sp = "[sp_BOGUpdateClosingRates]";
                        SqlCommand cmd = new SqlCommand(sp, cn);
                        cmd.CommandTimeout = 0;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CompanyID", compid);
                        cmd.Parameters.AddWithValue("@CurrencyId", currencyid);
                        cmd.Parameters.AddWithValue("@PurchaseRate", srate);
                        cmd.Parameters.AddWithValue("@salerate", srate);
                        cmd.Parameters.AddWithValue("@StartDate", sdate);
                        cmd.Parameters.AddWithValue("@EndDate", edate);
                        cmd.ExecuteNonQuery();
                        cn.Close();

                    }

                }
            }
                catch (Exception ex)
            {
                result.Text = ex.Message;
            }
        } 
        }
    }
}