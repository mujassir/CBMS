using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace cbmsWA
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (!Page.IsPostBack)
            // {
            sql.InsertParameters["UserID"].DefaultValue = Page.User.Identity.Name;
            sql.UpdateParameters["UserID"].DefaultValue = Page.User.Identity.Name;
            sql.UpdateParameters["original_UserID"].DefaultValue = Page.User.Identity.Name;
            user.Text = Page.User.Identity.Name;

            // }
        }
    }
}