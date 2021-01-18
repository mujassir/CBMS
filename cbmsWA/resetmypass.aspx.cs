using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace cbmsWA
{
    public partial class resetmypass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnreset_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser usr = Membership.GetUser(Page.User.Identity.Name);
                string resetPwd = usr.ResetPassword();
                usr.ChangePassword(resetPwd, pass.Text);
                result.ForeColor = Color.Green;
                result.Text = "Password changed successfully";

                //username.Text = "";
                pass.Text = "";
                confirmpass.Text = "";
            }
        }
    }

}