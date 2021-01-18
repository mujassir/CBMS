using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;

namespace cbmsWA
{
    public partial class addrank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    using (var ctx = new ModelEntities())
                    {

                        Rank rnk = new Rank();
                        // area.AreaId = txtareaid.Text;
                        rnk.RankName = txtname.Text;
                        // area.StationId = cmb.SelectedValue;


                        ctx.Ranks.Add(rnk);
                        ctx.SaveChanges();

                        result.ForeColor = Color.Green;
                        result.Text = "Rank added successfully";
                        grid.Rebind();

                        txtname.Text = "";
                        // txtareaid.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.Message;
            }
        }
    }
}
