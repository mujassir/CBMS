using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using CbmsLib;
namespace cbmsWA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clock.Text = DateTime.Now.ToString("dd-MMM-yyyy hh:mm");

 //           using (var ctx = new ForexEntities3())
 //           {var q = (from x in ctx.LabourCharges
 //                        select x).ToList();
 //               foreach (var c in q)
 //               {
 //                   //decimal gt =decimal.Parse(c.Grand_Total); 
 //                 //  decimal tpc = decimal.Parse(c.TotalProjectCost);
 //                  c.Grand_Total = decimal.Parse(c.flaggt);
 //                   c.TotalProjectCost = decimal.Parse(c.flagtpc);
 ////c.Contribution_by_NEDco = c.PURC_Rate - c.Contribution_by_Customer;
 //                   ctx.SaveChanges();
 //           //    }
          //  }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Membership.ValidateUser(username.Text, password.Text))
                    FormsAuthentication.RedirectFromLoginPage(username.Text, rememberme.Checked);
                else
                    result.Text = "Login failed. Please check your user name and password and try again.";
            }
        }
    }
}