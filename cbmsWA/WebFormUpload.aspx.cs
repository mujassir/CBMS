using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace cbmsWA
{
    public partial class WebFormUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
               // result.Text = FileUpload1.FileName;
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/NationalidImages/") + fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

    }
}