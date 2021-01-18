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
    public partial class Expenses : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserP.Text = Page.User.Identity.Name;
                BureauDetails();
                GVSExpenseBlind();
                Clear();
                BindCurrency();
                PReceiptno();
                Daytimer();
            }

            if (Session["Username"] != null)
            {
                //LabelUserP.Text = Session["Username"].ToString();
                //LabelUserpP.Text = LabelUserP.Text;
                //Showprofile();
            }
            else
            {
           //     Response.Redirect("~/LogIn.aspx");
            }

            TextBPBM.Text = DateTime.Now.ToString("yyyyMMdd");
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
                        cmd.Parameters.AddWithValue("@bureau", LabelUserP.Text);
                        sda.Fill(ds);
                        BureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                        Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                    }
                }
            }
        }

        protected void Daytimer()
        {
            TextBPBM.Text = DateTime.Now.ToString("yyyy/MM/dd");
            TextBDT.Text = DateTime.Now.ToString();
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

        protected void GVSExpenseBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select *from Expenses order by ReceiptNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable Expenses = new DataTable();
                        sda.Fill(Expenses);
                        RepetExpenses.DataSource = Expenses;
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
                //string delt = "0";

                SqlCommand cmd = new SqlCommand("insert into Expenses(ReceiptNo,Date,CurrencyId,Amount,Account,Details,TransactionType,Username,DTime,CompanyID,BureauID,Active)" +
                " values('" + TexBER.Text + "','" + TexBPD.Text + "','" + DroDownSCurr.Text + "','" + TexBoxEXAmot.Text + "','" + DropDownEA.Text + "','" + TexBEDts.Text + "','" + TextBusiesType.Text + "','" + LabelUserpP.Text + "','" + TextBDT.Text + "','" + Company1D.Text + "','" + BureauID.Text + "','"+ actv + "')", con);
                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,Username,TransType,BureauID,DTime,CompanyID,Active)" +
                    " values('" + TexBER.Text + "','" + DroDownSCurr.Text + "','" + TexBPD.Text + "','" + TexBoxEXAmot.Text + "','" + LabelUserpP.Text + "','" + TextBusiesType.Text + "','" + BureauID.Text + "','" + TextBPBM.Text + "','" + Company1D.Text + "', '"+ actv + "')", con);
                SqlCommand cmd2 = new SqlCommand("UPDATE Bureaus SET " + DroDownSCurr.Text + " = " + DroDownSCurr.Text + " + '" + TexBoxEXAmot.Text + "' WHERE BureauID = " + Company1D.Text + ";", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();                cmd2.ExecuteNonQuery();

                GVSExpenseBlind();
                Clear();
                PReceiptno();
                con.Close();
                Response.Redirect(Request.Url.ToString(), false);
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string EBalance(string id, string BureauID)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String SQL = "select " + id + " from Bureaus where CompanyID ='" + BureauID + "'";

                DataTable DATA = new DataTable();
                SqlDataAdapter DTA = new SqlDataAdapter(SQL, con);
                DTA.Fill(DATA);

                if (DATA.Rows.Count > 0)
                {
                    if (DATA.Rows[0].ItemArray[0].ToString() == "")
                    {
                        return "0";
                    }
                    else
                    {
                        return DATA.Rows[0].ItemArray[0].ToString();
                    }
                }
                return "0";
            }
        }

        protected void LinkButtDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from Expenses WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("select max (ReceiptNo)+1 from Expenses", con);
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

    }
}