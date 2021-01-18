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
    public partial class Utilities : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                BureauIDNo();
                LabelUserP.Text = Page.User.Identity.Name;
                BureauDetails();
                //Showprofile();
                BindBranch();
                string compid = Company1D.Text;
                string buroid = bureauid.Text;
                string userid = LabeBureaName.Text;
            }
            else
            {
                //Response.Redirect("~/LogIn.aspx");
            }
        }
        protected void BureauIDNo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from UserDetails where UserName=@uname ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        cmd.Parameters.AddWithValue("@uname", LabelUserP.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        //  LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        bureauid.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
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
                        cmd.Parameters.AddWithValue("@bureau", bureauid.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                        Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                        Session["CompanyId"] = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                        Session["BureauID"] = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }


        [WebMethod]
        [ScriptMethod]
        public static string SaveData(int Branchid, String BraName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into CompanyBranch(Branchid,BranchName)" +
               " values('" + Branchid + "','" + BraName + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return "submit";
            }
        }

        //[WebMethod]
        //[ScriptMethod]
        //public static string CompanySave(String BureaName, int BLicenceno, String BLocation, int Bnumber, String BureaB)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("insert into Company(String BureaName, int BLicenceno, String BLocation, int Bnumber, String BureaB) values('" + BureaName + "','" + BLicenceno + "','" + BLocation + "','" + Bnumber + "','" + BureaB + "')", con);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        return "submit";
        //    }
        //}

        [WebMethod]
        [ScriptMethod]
        public static string AddCompany(string BureaName, string BLicenceno, string AreaID, string BTelnumber, string BuDate,string compid)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlConnection cn = null;
                cn = new SqlConnection(DbConnection.DbConnectionString);
                cn.Open();
                string sp = "sp_NewBureau";
                SqlCommand cmd1 = new SqlCommand(sp, cn);
                cmd1.CommandTimeout = 0;
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@CompanyID", int.Parse(compid));
                cmd1.Parameters.AddWithValue("@BureauID", int.Parse(BureaName));

                cmd1.ExecuteNonQuery();
                cn.Close();
                SqlCommand cmd = new SqlCommand("insert into Company(CompanyName,LicenceNo,AreaID,Phonenumber,DateofEntry)" +
              " values('" + BureaName.ToString() + "','" + BLicenceno.ToString() + "','" + AreaID.ToString() + "','" + BTelnumber.ToString() + "','" + BuDate.ToString() + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return "submit";
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string UpdateCompany(String BureaName, String BLicenceno, String BLocation, String Bnumber, String buroid)
        { 
            SqlConnection cn = null;
            cn = new SqlConnection(DbConnection.DbConnectionString);
            cn.Open();
            string sp = "sp_NewBureau";
            SqlCommand cmd1 = new SqlCommand(sp, cn);
            cmd1.CommandTimeout = 0;
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@BureauID", int.Parse(buroid));
            cmd1.ExecuteNonQuery();
            cn.Close();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Company SET  CompanyName = '" + BureaName.ToString() + "', LicenceNo = " + BLicenceno.ToString() + ", Location = '" + BLocation.ToString() + "', Phonenumber = '" + Bnumber.ToString() + "', Branch = '" + buroid.ToString() + "' WHERE id = 1; ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return "submit";
            }

        }

        public void BindBranch()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from CompanyBranch", con);
                con.Open();
                DroDownBranch.DataSource = cmd.ExecuteReader();
                DroDownBranch.DataTextField = "BranchName";
                DroDownBranch.DataValueField = "Branchid";
                DroDownBranch.DataBind();
            }
        }

        protected void ButLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
        }
    }
}