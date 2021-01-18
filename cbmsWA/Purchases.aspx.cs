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
    public partial class Purchases : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelUserP.Text = Page.User.Identity.Name;
                daytimer();
                GVPurBlind();
                DisplayCountry();
                Clear();
                PReceiptno();
                BindCurrency();
                BureauDetails();
                Idtypes();
                Regions();
                BureauIDNo();
                Bureauname();
            }
            TexBPCE.Attributes.Add("readonly", "readonly");
            TexBAM.Attributes.Add("readonly", "readonly");

            if (Session["Username"] != null)
            {

                //Showprofile();
            }
            else
            {
                //Response.Redirect("~/LogIn.aspx");
            }
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
                        Bureauid.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
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

                        cmd.Parameters.AddWithValue("@buid", Bureauid.Text);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                          LabeBureaName.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                       // Bureauid.Text = ds.Tables[0].Rows[0]["BureauID"].ToString();
                    }
                }
            }
        }
        protected void BureauDetails()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Company ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        LabeBureaName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                        Company1D.Text = ds.Tables[0].Rows[0]["CompanyID"].ToString();
                    }
                }
            }
        }

        void Clear()
        {
            TexBoxPurAmot.Text = "";
            TexBPR.Text = "";
            TexBPCN.Text = "";
            TexBRA.Text = "";
            TexBPIDNo.Text = "";
            TexBPIDNo.Text = "";
            TextBPSN.Text = "";
            TexBPCE.Text = "";
            TexBAM.Text = "";
            LinkButtDelete.Enabled = false;
            DropDownPurCNY.Focus();
        }

        protected void DisplayCountry()
        {
            DropDownTexBPN.DataSource = GetCountryNames();
            DropDownTexBPN.DataBind();
            DropDownTexBPN.Items.Insert(0, "Ghana");
        }

        protected void daytimer()
        {
            //TextBPBM.Text = DateTime.Now.ToString("yyyy/MM/dd");
            TextBPDT.Text = DateTime.Now.ToString();
        }

        protected void GVPurBlind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Purchases where Deleted = 0 order by ReceiptNo desc", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable Purchases = new DataTable();
                        sda.Fill(Purchases);
                        RepetPurchase.DataSource = Purchases;
                        RepetPurchase.DataBind();
                    }
                }
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

        public void BindCurrency()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Currency", con);
                con.Open();
                DropDownPurCNY.DataSource = cmd.ExecuteReader();
                DropDownPurCNY.DataTextField = "Discription";
                DropDownPurCNY.DataValueField = "CurrencyId";
                DropDownPurCNY.DataBind();
            }
        }

        public void Regions()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Area", con);
                con.Open();
                DropDowPROT.DataSource = cmd.ExecuteReader();
                DropDowPROT.DataTextField = "AreaName";
                DropDowPROT.DataValueField = "AreaID";
                DropDowPROT.DataBind();
            }
        }

        public void Idtypes()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from IdentityType", con);
                con.Open();
                DroDwonPId.DataSource = cmd.ExecuteReader();
                //DroDwonPId.DataTextField = "DescriptionIdtyp";
                DroDwonPId.DataTextField = "Description";
                
                DroDwonPId.DataValueField = "IdentityID";
                DroDwonPId.DataBind();
            }
        }

        public void PReceiptno()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select max (ReceiptNo)+1 from Purchases", con);
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

        protected void LinkButtSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into Purchases(BureauID,ReceiptNo,CurrencyId,Amount,PurchaseRate,CediEquivalent,Dated,Username,DTime,FirstName,SurName,Gender,CustAddress,TransactionType,Region,Nationality,IdentityType,IdentityNo,CompanyID,Active) values" +
               "('" + Bureauid.Text + "','" + TexBRn.Text + "','" + DropDownPurCNY.Text + "','" + TexBoxPurAmot.Text + "','" + TexBPR.Text + "','" + TexBPCE.Text + "','" + TexBPD.Text + "','" + LabelUserpP.Text + "','" + TextBPDT.Text + "','" + TexBPCN.Text + "','" + TextBPSN.Text + "','" + DropDownPG.Text + "','" + TexBRA.Text + "','" + TextBusiesType.Text + "','" + DropDowPROT.Text + "','" + DropDownTexBPN.Text + "','" + DroDwonPId.Text + "','" + TexBPIDNo.Text + "','" + Company1D.Text + "','" + TextActive.Text + "')", con);

                SqlCommand cmd1 = new SqlCommand("insert into Stock(BureauID,ReceiptNo,CurrencyId,Dated,Amount,CediEquivalent,Username,Rate,TransType,DTime,CompanyID)" +
                    " values('" + Bureauid.Text + "','" + TexBRn.Text + "','" + DropDownPurCNY.Text + "','" + TexBPD.Text + "','" + TexBoxPurAmot.Text + "','" + TexBPCE.Text + "','" + LabelUserP.Text + "','" + TexBPR.Text + "','" + TextBusiesType.Text + "','" + TextBPDT.Text + "','" + Company1D.Text + "')", con);

                //SqlCommand cmd2 = new SqlCommand(@"insert into Stock(ReceiptNo,CurrencyId,Dated,Amount,CediEquivalent,Username,Rate,TransType,DTime,CompanyID) values
                //      ('" + TexBRn.Text + "','GHS','" + TexBPD.Text + "','" + TexBPCE.Text + "','" + TexBoxPurAmot.Text + "','" + LabelUserpP.Text + "','" + TexBPR.Text + "','" + TextBusiesType.Text + "','" + TextBPDT.Text + "','" + Company1D.Text + "')", con);
                SqlCommand cmd3 = new SqlCommand("UPDATE Bureaus SET " + DropDownPurCNY.Text + " = " + DropDownPurCNY.Text + " + '" + TexBoxPurAmot.Text + "', GHS = GHS - '" + TexBPCE.Text + "' WHERE BureauID = " + Bureauid.Text + ";", con);

                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
   //             cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                PReceiptno();
                GVPurBlind();
                Clear();
                con.Close();
                Response.Redirect(Request.Url.ToString(), false);
            }
        }

        protected void ButtLogoutP_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LogIn.aspx");
        }

        protected void LinkButtDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from Stock WHERE ReceiptNo =  '" + TextBPDELETE.Text + "' and TransType = '" + TextBusiesType.Text + "'", con);
                SqlCommand cmd1 = new SqlCommand("UPDATE Purchases SET Deleted = 1 WHERE ReceiptNo =  '" + TextBPDELETE.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                GVPurBlind();
                con.Close();
                TextBPDELETE.Text = "";
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string ModalPOPUP()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select FirstName,SurName,Gender,CustAddress,Region,Nationality,IdentityType,IdentityNo from Purchases order by FirstName asc", con);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                String Temp = "";

                while (rd.Read())
                {

                    Temp += "<p class='content-list'>";
                    Temp += "<span class='fn' style='text-transform:uppercase'>" + rd["FirstName"].ToString() + "</span>";
                    Temp += "<span class='sn' style='text-transform:uppercase'>" + rd["SurName"].ToString() + "</span>";
                    Temp += "<span class='gd' style='display: none'>" + rd["Gender"].ToString() + "</span>";
                    Temp += "<span class='ad' style='display: none'>" + rd["CustAddress"].ToString() + "</span>";
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




    }
}