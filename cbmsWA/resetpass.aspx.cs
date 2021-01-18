using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace cbmsWA
{
    public partial class resetpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnreset_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    MembershipUser usr = Membership.GetUser(username.Text);
                    string resetPwd = usr.ResetPassword();
                    usr.ChangePassword(resetPwd, pass.Text);
                    result.ForeColor = Color.Green;
                    result.Text = "Password changed successfully";

                    //username.Text = "";
                    pass.Text = "";
                    confirmpass.Text = "";
                }
                else
                {
                    grid_ModalPopupExtender.Show();
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.GetBaseException().Message;
            }
        }
        protected void grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                string cmdText = e.CommandName;
                // string cmdArgument = e.CommandArgument.ToString();
                if (cmdText == "reset")
                {
                    GridDataItem dataItem = (GridDataItem)e.Item;


                    // string id = dataItem.GetDataKeyValue("ServiceApplicationId").ToString();
                    string staffid = dataItem["username"].Text;
                    username.Text = staffid;

                    grid_ModalPopupExtender.Show();
                }

            }
            catch (Exception ex)
            {

            }
        }
    }

}