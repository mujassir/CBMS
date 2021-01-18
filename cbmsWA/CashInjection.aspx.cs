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
    public partial class CashInjection : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserS.Text = Page.User.Identity.Name;
                GVSSalesBlind();
                Clear();
                daytimer();
                SReceiptno();
                BindCurrency();
                Bureauname();
                BureauDetails();
                

                TextBSBM.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

            TeBSAFS.Attributes.Add("readonly", "readonly");
            if (Session["Username"] != null)
            {
                //LabelUserS.Text = Session["Username"].ToString();
                //TextBoXUserS.Text = LabelUserS.Text;
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

        void Clear()
        {
            TexBoxEXAmot.Text = "";
            TexBPR.Text = "";
            TexBSIDNo.Text = "";
            LinkButtDelete.Enabled = false;
            DroDownSCurr.Focus();
        }

        public void SReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (TransactionNo)+1 from CashInjection", con);
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

        protected void daytimer()
        {
            TextBSBM.Text = DateTime.Now.ToString("yyyyMMdd");
            TextBSDT.Text = DateTime.Now.ToString();
        }


        protected void GVSSalesBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from CashInjetCurency order by TransactionNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable CashInjetCurency = new DataTable();
                        sda.Fill(CashInjetCurency);
                        RepetEmploye.DataSource = CashInjetCurency;
                        RepetEmploye.DataBind();
                    }
                }
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
                SqlCommand cmd = new SqlCommand("delete from CashInjection WHERE TransactionNo =  '" + TextBPDELETE.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("delete from Stock WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSSalesBlind();
                con.Close();
                TextBPDELETE.Text = "";
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

        protected void LinkButtSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string actv = "1";
                Int16  xdelete = 0;

                //check the insert values
                SqlCommand cmd = new SqlCommand("insert into CashInjection(TransactionNo,Dated,CurrencyId,Amount,PurchaseRate,CediEquivalent,Remarks,Username,DTime,CompanyID,BureauID,Active) values" +
                  "('" + TexBRn.Text + "','" + TexBPD.Text + "','" + DroDownSCurr.Text + "','" + TexBoxEXAmot.Text + "','" + TexBPR.Text + "','" +  TextBCBalance.Text + "','" + TexBSIDNo.Text + "','" + TextBoXUserS.Text + "','" + TextBSDT.Text + "','" + company1D.Text + "','"+ bureauID.Text+ "','" + actv + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,Username,TransType,BureauID,DTime,CompanyID)" +
                    " values('" + TexBRn.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxEXAmot.Text + "','" + LabelUserS.Text + "','" + TextBusiesType.Text + "','" + bureauID.Text + "','" + TextBSDT.Text + "','" + company1D.Text + "')", con);

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
    }
}