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
    public partial class BiginningBalance : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserS.Text= Page.User.Identity.Name;
                Bureauname();
                BureauDetails();
                GVSExpenseBlind();
                Clear();
                BindCurrency();
                SReceiptno();
            }

            if (Session["Username"] != null)
            {
                //LabelUserP.Text = Session["Username"].ToString();
                //LabelUserpP.Text = LabelUserP.Text;
                //Showprofile();
            }
            else
            {
            //    Response.Redirect("~/LogIn.aspx");
        }
            TextBPBM.Text = DateTime.Now.ToString("yyyyMMdd");

        }


        //protected void Showprofile()
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select * from EmployRanks where Username='" + Session["Username"] + "'", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataSet ds = new DataSet();
        //                sda.Fill(ds);
        //                LabelUserP.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        //                LabelRank.Text = ds.Tables[0].Rows[0]["Discription"].ToString();
        //            }
        //        }
        //    }
        //}

        protected void Bureauname()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UserDetails where UserName=@buid ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@buid", LabelUserS.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //   LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        bureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }

        protected void BureauDetails()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Bureaus where BureauID=@bureau", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        cmd.Parameters.AddWithValue("@bureau", bureauID.Text);
                        sda.Fill(ds);
                        bureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                        company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                    }
                }
            }
        }

        //protected void BureauDetails()
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select * from Company ", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataSet ds = new DataSet();

        //                sda.Fill(ds);
        //                LabeBureaName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
        //                Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
        //            }
        //        }
        //    }
        //}

        protected void GVSExpenseBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select *from BeginingBalanCurcy order by Receiptno desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable BeginningBalances = new DataTable();
                        sda.Fill(BeginningBalances);
                        RepetExpenses.DataSource = BeginningBalances;
                        RepetExpenses.DataBind();
                    }
                }
            }
        }

        void Clear()
        {
            //TexBER.Text = "";
            TexBoxEXAmot.Text = "";
            //TexBEDts.Text = "";
            LinkButtDelete.Enabled = false;
            DroDownSCurr.Focus();
        }

        protected void ButtExLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
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

        protected void LinkButtSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string actv = "1";
                SqlCommand cmd = new SqlCommand("insert into BeginningBalances(Receiptno,Date,CurrencyId,Amount,TransType,CompanyID,Active)" +
                    " values('" + TextBBiD.Text + "','" + TexBPD.Text + "','" + DroDownSCurr.Text + "','" + TexBoxEXAmot.Text + "','" + TextBusiesType.Text + "','" + company1D.Text + "','" + actv + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyID,Dated,Amount,Username,TransType,BureauID,DTime,CompanyID)" +
                    " values('" + TextBBiD.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxEXAmot.Text + "','" + LabelUserS.Text + "','" + TextBusiesType.Text + "','"+ bureauID.Text + "','"+ DateTime.Now + "','" + company1D.Text + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSExpenseBlind();
                Clear();
                SReceiptno();
                con.Close();
                Response.Redirect(Request.Url.ToString(), false);
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string SBalance(int id)
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

        protected void LinkButtDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from BeginningBalances WHERE Receiptno =  '" + TextBPDELETE.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("delete from Stock WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSExpenseBlind();
                con.Close();
                TextBPDELETE.Text = "";
            }
        }

        public void SReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (Receiptno)+1 from BeginningBalances", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TextBBiD.Text = dr[0].ToString();
                    if (TextBBiD.Text == "")
                    {
                        TextBBiD.Text = "1";
                    }
                }
            }
            else
            {
                TextBBiD.Text = "1";
            }
            con.Close();
        }

    }

}
