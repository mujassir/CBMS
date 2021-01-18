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
    public partial class BankLodgement : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                LabelUser.Text = Page.User.Identity.Name;
                BureauDetails();
                GVSExpenseBlind();
                Clear();
                BindCurrency();
                PReceiptno();
                Bureauname();
            }

            if (Session["Username"] != null)
            {
                //Showprofile();
            }
            else
            {
            //    Response.Redirect("~/LogIn.aspx");
            }

            TextBPBM.Text = DateTime.Now.ToString("yyyyMMdd");
            TextBPDT.Text = DateTime.Now.ToString();
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
        //                LabelUser.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        //                LabelRank.Text = ds.Tables[0].Rows[0]["Discription"].ToString();
        //            }
        //        }
        //    }
        //}

        protected void BureauDetails()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UserDetails where UserName=@uname ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@uname", LabelUser.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //  LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        bureauid.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }

        protected void Bureauname()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Bureaus where BureauID=@buid ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@buid", bureauid.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        companyiD.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                        // Bureauid.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }

            }
        }


        protected void GVSExpenseBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select *from BankLodgement order by ReceiptNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable BankLodgement = new DataTable();
                        sda.Fill(BankLodgement);
                        RepetExpenses.DataSource = BankLodgement;
                        RepetExpenses.DataBind();
                    }
                }
            }
        }

        void Clear()
        {
            TexBER.Text = "";
            TexBoxEXAmot.Text = "";
            TexBEDts.Text = "";
            LinkButtDelete.Enabled = false;
            DroDownSCurr.Focus();
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
                SqlCommand cmd = new SqlCommand("insert into BankLodgement(ReceiptNo,Date,CurrencyId,Amount,Bank,Details,TransType,DTime,Username,CompanyID) " +
                    "values('" + TexBER.Text + "','" + TexBPD.Text + "','" + DroDownSCurr.Text + "','" + TexBoxEXAmot.Text + "','" + TextBNOB.Text + "','" + TexBEDts.Text + "','" + TextBusiesType.Text + "','" + TextBPDT.Text + "','" + LabelUser.Text + "','" + companyiD.Text + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,Username,TransType,DTime,BureauID,CompanyID)" +
                    "values('" + TexBER.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxEXAmot.Text + "','" + LabelUser.Text + "','" + TextBusiesType.Text + "','" + TextBPDT.Text + "','" + bureauid.Text + "','" + companyiD.Text + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSExpenseBlind();
                Clear();
                PReceiptno();
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
                SqlCommand cmd = new SqlCommand("delete from BankLodgement WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("delete from Stock WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSExpenseBlind();
                con.Close();
                TextBPDELETE.Text = "";
            }
        }

        public void PReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (ReceiptNo)+1 from BankLodgement", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TexBER.Text = dr[0].ToString();
                    if (TexBER.Text == "")
                    {
                        TexBER.Text = "1";
                    }
                }
            }
            else
            {
                TexBER.Text = "1";
            }
            con.Close();
        }

        protected void ButtLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
        }


    }
}

