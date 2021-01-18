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
using System.Web.SessionState;


namespace cbmsWA
{
    public partial class Sales : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserP.Text = Page.User.Identity.Name;
                bureauid.Text = Page.User.Identity.Name;
                Regions();
                BureauDetails();
                GVSSalesBlind();
                DisplayCountry();
                Clear();
                daytimer();
                SReceiptno();
                BindCurrency();
                Idtypes();
                TextBSBM.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

            TexBSCE.Attributes.Add("readonly", "readonly");
            if (Session["Username"] != null)
            {

                //Showprofile();
            }
            else
            {
              //  Response.Redirect("~/LogIn.aspx");
            }
        }


        public void Idtypes()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from IdentityType", con);
                con.Open();
                DroDwonSId.DataSource = cmd.ExecuteReader();
                DroDwonSId.DataTextField = "Description";
                DroDwonSId.DataValueField = "IdentityID";
                DroDwonSId.DataBind();
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
                     //   BureauID.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                        Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                        Session["CompanyId"] = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                        Session["BureauID"] = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }

        void Clear()
        {
            TexBoxSalsAmot.Text = "";
            TexBSR.Text = "";
            TexBSCN.Text = "";
            TexBSRA.Text = "";
            TexBSIDNo.Text = "";
            TextBSSN.Text = "";
            LinkButtSalesDelete.Enabled = false;
            TexBSCE.Text = "";
            DroDownSCurr.Focus();
        }

        public void SReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (Receiptno)+1 from Sales", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TexBSRn.Text = dr[0].ToString();
                    if (TexBSRn.Text == "")
                    {
                        TexBSRn.Text = "1";
                    }
                }
            }
            else
            {
                TexBSRn.Text = "1";
            }
            con.Close();
        }

        protected void DisplayCountry()
        {
            DropDownTexBSN.DataSource = GetCountryNames();
            DropDownTexBSN.DataBind();
            DropDownTexBSN.Items.Insert(0, "Ghana");
        }

        protected void GVSSalesBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Sales where Deleted = 0 order by ReceiptNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable Sales = new DataTable();
                        sda.Fill(Sales);
                        RepetSales.DataSource = Sales;
                        RepetSales.DataBind();
                    }
                }
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string ModalPOPUPS()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select FirstName,SurName,Gender,Address,Region,Nationality,IdentityType,IdentityNo from Sales order by FirstName asc", con);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                String Temp = "";

                while (rd.Read())
                {
                    Temp += "<p class='content-list'>";
                    Temp += "<span class='fn' style='text-transform:uppercase'>" + rd["FirstName"].ToString() + "</span>";
                    Temp += "<span class='sn' style='text-transform:uppercase'>" + rd["SurName"].ToString() + "</span>";
                    Temp += "<span class='gd' style='display: none'>" + rd["Gender"].ToString() + "</span>";
                    Temp += "<span class='ad' style='display: none'>" + rd["Address"].ToString() + "</span>";
                    Temp += "<span class='rg' style='display: none'>" + rd["Region"].ToString() + "</span>";
                    Temp += "<span class='na' style='display: none'>" + rd["Nationality"].ToString() + "</span>";
                    Temp += "<span class='idt' style='display: none'>" + rd["IdentityType"].ToString() + "</span>";
                    Temp += "<span class='idn' style='display: none'>" + rd["IdentityNo"].ToString() + "</span>";
                    Temp += "</p>";
                }

                con.Close();

                return Temp;
            }
        }

        public List<string> GetCountryNames()
        {
            List<string> list = new List<string>();
            foreach (CultureInfo info in CultureInfo.GetCultures(CultureTypes.SpecificCultures))
            {
                RegionInfo inforeg = new RegionInfo(info.LCID);
                if (!list.Contains(inforeg.EnglishName))
                {
                    list.Add(inforeg.EnglishName);
                    list.Sort();
                }
            }

            return list;
        }

        protected void daytimer()
        {
            TextBSBM.Text = DateTime.Now.ToString("yyyyMMdd");
            TextBSDT.Text = DateTime.Now.ToString();
        }

        protected void ButtLogoutS_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
        }

        protected void LinkButtSaveSALES_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                DateTime dt = DateTime.Now;
                SqlCommand cmd = new SqlCommand("insert into Sales(Receiptno,CurrencyId,Amount,Rate,FirstName," +
                    "SurName,Gender,Dated,CediEquivalent,Address,TransactionType,Region,Nationality,IdentityType," +
                    "IdentityNo,Username,DTime,CompanyID,BureauID) " +
                    "values('" + TexBSRn.Text + "','" + DroDownSCurr.Text + "','" + TexBoxSalsAmot.Text + "'," +
                    "'" + TexBSR.Text + "','" + TexBSCN.Text + "','" + TextBSSN.Text + "','" + DropDownSG.Text + "'," +
                    "'" + TexBSD.Text + "','" + TexBSCE.Text + "','" + TexBSRA.Text + "'," +
                    "'" + TextBusiesType.Text + "','" + DropDowSROT.Text + "','" + DropDownTexBSN.Text + "'," +
                    "'" + DroDwonSId.Text + "','" + TexBSIDNo.Text + "','" + LabelUserP.Text + "','" + dt + "'," +
                    "'" + Company1D.Text + "','" + bureauid.Text + "')", con);

                SqlCommand cmd1 = new SqlCommand("insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,CediEquivalent," +
                    "Username,Rate,TransType,BureauID,DTime,CompanyID) " +
                    "values('" + TexBSRn.Text + "','" + DroDownSCurr.Text + "','" + TexBSD.Text + "','" + TexBoxSalsAmot.Text + "'," +
                    "'" + TexBSCE.Text + "','" + LabelUserP.Text + "','" + TexBSR.Text + "','" + TextBusiesType.Text + "','" + bureauid.Text + "'," +
                    "'" + dt + "','" + Company1D.Text + "')", con);

                //SqlCommand cmd2 = new SqlCommand(@"insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,CediEquivalent,Username,Rate,TransType,BureauID,DTime,CompanyID) 
                //            values('" + TexBSRn.Text + "','GHS','" + TexBSD.Text + "','" + TexBSCE.Text + "','"
                //            + TexBSCE.Text + "','" + LabelUserP.Text + "','" + TexBSR.Text + "','" + TextBusiesType.Text + "'," +
                //            "'" + bureauid.Text + "','" + TextBSDT.Text + "','" + Company1D.Text + "')", con);
                SqlCommand cmd3 = new SqlCommand("UPDATE Bureaus SET " + DroDownSCurr.Text + " = " + DroDownSCurr.Text + " - '" + TexBoxSalsAmot.Text + "', GHS = GHS  + '" + TexBSCE.Text + "' WHERE BureauID = " + Company1D.Text + ";", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                //cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                GVSSalesBlind();
                Clear();
                SReceiptno();
                con.Close();
                Response.Redirect(Request.Url.ToString(), false);
            }
        }

        protected void LinkButtSalesDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Sales SET Deleted = 1 WHERE ReceiptNo =  '" + TextBSDELETE.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("UPDATE Stock SET Deleted = 1 WHERE ReceiptNo =  '" + TextBSDELETE.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVSSalesBlind();
                con.Close();
                TextBSDELETE.Text = "";
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

        public void Regions()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Area", con);
                con.Open();
                DropDowSROT.DataSource = cmd.ExecuteReader();
                DropDowSROT.DataTextField = "AreaName";
                DropDowSROT.DataValueField = "AreaID";
                DropDowSROT.DataBind();
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string SBalance(string id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                String SQL = "select " + id + " from Bureaus where BureauID ='" + HttpContext.Current.Session["BureauID"] + "'";

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
    }
}