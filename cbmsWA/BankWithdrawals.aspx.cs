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
    public partial class BankWithdrawals : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LabelUser.Text = Page.User.Identity.Name;
                Bureauname();
                BureauDetails();    
                GVSExpenseBlind();
                Clear();
                BindCurrency();
                PReceiptno();
            }

            if (Session["Username"] != null)
            {
                //Showprofile();
            }
            else
            {
               // Response.Redirect("~/LogIn.aspx");
            }

            TextBPDT.Text = DateTime.Now.ToString("yyyyMMdd");
            TextBPBM.Text = DateTime.Now.ToString();

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
        protected void Bureauname()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UserDetails where UserName=@buid ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@buid", LabelUser.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //   LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        bureauId.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
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
                        cmd.Parameters.AddWithValue("@bureau", bureauId.Text);
                        sda.Fill(ds);
                        //   bureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                        companyid.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                    }
                }
            }
        }

        protected void GVSExpenseBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select *from BankWithdrawal order by Receiptno desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable BankWithdrawal = new DataTable();
                        sda.Fill(BankWithdrawal);
                        RepetExpenses.DataSource = BankWithdrawal;
                        RepetExpenses.DataBind();
                    }
                }
            }
        }

        void Clear()
        {
            TexBER.Text = "";
            TexBoxEXAmot.Text = "";
            TextBNOB.Text = "";
            LinkButtDelete.Enabled = false;
            TexBER.Focus();
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
                SqlCommand cmd = new SqlCommand("insert into BankWithdrawal(Receiptno,Date,CurrencyId,Amount,Bank,Details,Username) " + 
                    "values('" + TexBER.Text + "','" + TexBPD.Text + "','" + DroDownSCurr.Text + "','" + TexBoxEXAmot.Text + "','" + TextBNOB.Text + "','" + TexBEDts.Text + "','" + LabelUser.Text + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,Username,TransType,BureauID,DTime,CompanyID,Active) " +
                    "values('" + TexBER.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxEXAmot.Text + "','" + LabelUser.Text + "','" + TextBusiesType.Text + "','"+ bureauId.Text+ "','" + DateTime.Now + "','" + companyid.Text + "','" + actv + "')", con);

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

        protected void LinkButtDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from BankWithdrawal WHERE Receiptno =  '" + TextBPDELETE.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("select max (Receiptno)+1 from BankWithdrawal", con);
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