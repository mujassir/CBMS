using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Web.Services;
using System.Web.Script.Services;

namespace cbmsWA
{
    public partial class CashTransfer : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserS.Text = Page.User.Identity.Name;
              //  BureauDetails();
                GVSSalesBlind();
                Clear();
                daytimer();
                SReceiptno();
                BindCurrency();
                BindEmployee();
                Bureauname();
                BureauDetails();


            }


            if (Session["Username"] != null)
            {

                //Showprofile();
            }
            else
            {
                //Response.Redirect("~/LogIn.aspx");
            }
        }


        protected void Bureauname()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Bureaus where UserName=@buid ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@buid", LabelUserS.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //  LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        bureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }
        protected void BureauDetails()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from bureaus where BureauID=@buro", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@buro", bureauID.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                    }
                }
            }
        }

        void Clear()
        {
            TexBoxPurAmot.Text = "";
            LinkButtDelete.Enabled = false;
            DropDowCashRece.Focus();
        }

        protected void LinkButtSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into CashTranfers(TranferNo,Date,CashReceiver,CurrencyId,Amount,CashGiver,CashierBalance,Username,DTime,CompanyID)" +
               " values('" + TexBRn.Text + "','" + TexBPD.Text + "','" + DropDowCashRece.Text + "','" + DroDownSCurr.Text + "','" + TexBoxPurAmot.Text + "','" + DropDowRank.Text + "','" + TextBCBalance.Text + "','" + TextBoXUserS.Text + "','" + TextBPDT.Text + "','" + Company1D.Text + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,TransType,DTime,CompanyID) " +
               "values('" + TexBRn.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxPurAmot.Text + "','" + TextBusiesType.Text + "','" + TextBPDT.Text + "','" + Company1D.Text + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSSalesBlind();
                Clear();
                SReceiptno();
                con.Close();
                Response.Redirect(Request.Url.ToString(), false);
            }
        }
        public void SReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (TranferNo)+2 from CashTranfers", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TexBRn.Text = dr[0].ToString();
                    if (TexBRn.Text == "")
                    {
                        TexBRn.Text = "1";
                    }
                }
            }
            else
            {
                TexBRn.Text = "1";
            }
            con.Close();
        }

        protected void daytimer()
        {
            TextBSBM.Text = DateTime.Now.ToString("yyyyMMdd");
            TextBPDT.Text = DateTime.Now.ToString();
        }

        public void BindEmployee()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Employees", con);
                con.Open();
                DropDowCashRece.DataSource = cmd.ExecuteReader();
                DropDowCashRece.DataTextField = "Username";
                //DropDowCashRece.DataValueField = "CurrencyId";
                DropDowCashRece.DataBind();
            }
        }

        protected void GVSSalesBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from CTransferCurre where Deleted = 0 order by TranferNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable CTransferCurre = new DataTable();
                        sda.Fill(CTransferCurre);
                        RepetEmploye.DataSource = CTransferCurre;
                        RepetEmploye.DataBind();
                    }
                }
            }
        }

        public void BindCurrency()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Currency", con);
                con.Open();
                DroDownSCurr.DataSource = cmd.ExecuteReader();
                DroDownSCurr.DataTextField = "Discription";
                DroDownSCurr.DataValueField = "CurrencyId";
                DroDownSCurr.DataBind();
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string SBalance(string id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String SQL = "select sum(Amount) As Amt from Stock where Currencyid ='" + id + "'";

                DataTable DATA = new DataTable();
                SqlDataAdapter DTA = new SqlDataAdapter(SQL, con);
                DTA.Fill(DATA);

                if (DATA.Rows.Count > 0)
                {
                    return DATA.Rows[0].ItemArray[0].ToString();
                }
                return "0";
            }
        }

        protected void ButtLogoutS_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
        }

        protected void LinkButtDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from CashTranfers WHERE TranferNo =  '" + TextBPDELETE.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("delete from Stock WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSSalesBlind();
                con.Close();
                TextBPDELETE.Text = "";
            }
        }
    }
}